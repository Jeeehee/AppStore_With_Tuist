//
//  StorageImpl.swift
//  Storage
//
//  Created by Jihee hwang on 9/9/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import CoreData

import Logger

public class StorageImpl {
  private let context: NSManagedObjectContext
  
  public init(context: NSManagedObjectContext = CoreDataStack.shared.viewContext) {
    self.context = context
  }
}

extension StorageImpl: Storage {
  /// C
  public func createData(keyword: String) {
    let search = SearchKeyword(context: context)
    search.keyword = keyword
    search.searchTime = Date()
    
    CoreDataStack.shared.saveContext()
  }
  
  /// R
  public func readRecentSearcheKeywords(limit: Int = 10) -> [SearchKeyword] {
    let fetchRequest: NSFetchRequest<SearchKeyword> = SearchKeyword.fetchRequest()
    fetchRequest.sortDescriptors = [NSSortDescriptor(key: "searchTime", ascending: false)]
    fetchRequest.fetchLimit = limit
    
    do {
      return try context.fetch(fetchRequest)
    } catch {
      Logger.error("Can not fetch Recent Search Keywords")
      return []
    }
  }
  
  /// D
  public func deleteAll() {
    let request = SearchKeyword.fetchRequest()
    let keywords = try? context.fetch(request)
    
    keywords?.forEach { context.delete($0) }
    CoreDataStack.shared.saveContext()
  }
}
