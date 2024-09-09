//
//  CoreDataStorage.swift
//  AppFoundationManifests
//
//  Created by Jihee hwang on 9/8/24.
//

import CoreData

import Logger

public class CoreDataStorage: CoreDataStorageProtocol {
  
  // MARK: - Shared
  
  public static let shared = CoreDataStorage()
  
  // MARK: - Properties
  
  private lazy var persistentContainer: NSPersistentContainer = {
    guard let modelBundle = Bundle(identifier: "com.JiheeAppStore.Storage"),
          let url = modelBundle.url(forResource: "Model", withExtension: "momd"),
          let model = NSManagedObjectModel(contentsOf: url)
    else {
      let errorMessage = CoreDataStorageError.failedLocateCoreDataModel.errorDescription
      Logger.error(errorMessage)
      fatalError(errorMessage)
    }
    
    let container = NSPersistentContainer(name: "SearchKeyword", managedObjectModel: model)
    container.loadPersistentStores { (storeDescription, error) in
      if let error = error as NSError? {
        let errorMessage = CoreDataStorageError.failedLoadPersistentStore(error).errorDescription
        Logger.error(errorMessage)
        assertionFailure(errorMessage)
      }
    }
    return container
  }()
  
  public var viewContext: NSManagedObjectContext {
    return persistentContainer.viewContext
  }
  
  // MARK: - Function
  
  public func saveContext() {
    let context = persistentContainer.viewContext
    if context.hasChanges {
      do {
        try context.save()
      } catch {
        let errorMessage = CoreDataStorageError.failedSaveContext(error as NSError).errorDescription
        Logger.error(errorMessage)
        assertionFailure(errorMessage)
      }
    }
  }
  
  public func performBackgroundTask(_ block: @escaping (NSManagedObjectContext) -> Void) {
    persistentContainer.performBackgroundTask(block)
  }
}
