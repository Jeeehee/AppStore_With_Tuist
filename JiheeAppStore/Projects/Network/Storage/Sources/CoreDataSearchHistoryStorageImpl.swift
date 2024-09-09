//
//  CoreDataSearchHistoryStorageImpl.swift
//  Storage
//
//  Created by Jihee hwang on 9/9/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import CoreData

import Logger
import Entities

public class CoreDataSearchHistoryStorageImpl {
  //  private let context: NSManagedObjectContext
  private let coreDataStorage: CoreDataStorage
  
  public init(coreDataStorage: CoreDataStorage = CoreDataStorage.shared) {
    self.coreDataStorage = coreDataStorage
  }
}

extension CoreDataSearchHistoryStorageImpl: CoreDataSearchHistoryStorage {
  /// C
  public func createData(keyword: String) {
    let search = SearchKeyword(context: coreDataStorage.viewContext)
    search.keyword = keyword
    search.searchTime = Date()
    coreDataStorage.saveContext()
  }
  
  /// R
  public func readSearchHistory(limit: Int) async -> [SearchHistory] {
    await withCheckedContinuation { continuation in
      coreDataStorage.performBackgroundTask { context in
        do {
          let fetchRequest: NSFetchRequest<SearchKeyword> = SearchKeyword.fetchRequest()
          fetchRequest.sortDescriptors = [NSSortDescriptor(key: "searchTime", ascending: false)]
          fetchRequest.fetchLimit = limit
          
          let fetchResults = try context.fetch(fetchRequest)
          let result = fetchResults.map { $0.toDomain() }
          
          continuation.resume(returning: result)
        } catch {
          let error = CoreDataStorageError.readError(error)
          Logger.error(error.errorDescription)
          continuation.resume(returning: [])
        }
      }
    }
  }

  /// D
  public func deleteAll() {
    let request = SearchKeyword.fetchRequest()
    let keywords = try? coreDataStorage.viewContext.fetch(request)
    
    keywords?.forEach { coreDataStorage.viewContext.delete($0) }
    coreDataStorage.saveContext()
  }
  
}
