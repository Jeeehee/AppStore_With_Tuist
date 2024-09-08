//
//  CoreDataStack.swift
//  AppFoundationManifests
//
//  Created by Jihee hwang on 9/8/24.
//

import CoreData

import Logger

public class CoreDataStack {
  
  // MARK: - Shared
  
  public static let shared = CoreDataStack()
  
  // MARK: - Properties
  
  public lazy var persistentContainer: NSPersistentContainer = {
    guard let modelBundle = Bundle(identifier: "com.JiheeAppStore.Storage"),
          let url = modelBundle.url(forResource: "Model", withExtension: "momd"),
          let model = NSManagedObjectModel(contentsOf: url)
    else {
      let errorMessage = "Failed to locate Core Data model"
      Logger.error(errorMessage)
      fatalError(errorMessage)
    }
    
    let container = NSPersistentContainer(name: "SearchKeyword", managedObjectModel: model)
    container.loadPersistentStores { (storeDescription, error) in
      if let error = error as NSError? {
        fatalError("Unresolved error \(error), \(error.userInfo)")
      }
    }
    return container
  }()
  
  public var viewContext: NSManagedObjectContext {
    return persistentContainer.viewContext
  }
  
  public func saveContext() {
    let context = persistentContainer.viewContext
    if context.hasChanges {
      do {
        try context.save()
      } catch {
        let nserror = error as NSError
        fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
      }
    }
  }
}
