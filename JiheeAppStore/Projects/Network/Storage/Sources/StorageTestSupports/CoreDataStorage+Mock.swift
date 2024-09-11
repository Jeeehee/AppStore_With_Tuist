//
//  MockCoreDataStorage.swift
//  Storage
//
//  Created by Jihee hwang on 9/9/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import Foundation

import CoreData

import Storage
import Entities

final class MockCoreDataStorage: CoreDataStorageProtocol {
  var fetchResults: [SearchKeyword] = []
  var context = MockManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
  
  func saveContext() {
    if context.hasChanges {
      do {
        try context.save()
      } catch {
        let errorMessage = CoreDataStorageError.failedSaveContext(error as NSError).errorDescription
        assertionFailure(errorMessage)
      }
    }
  }
  
  func performBackgroundTask(_ block: @escaping (NSManagedObjectContext) -> Void) {
    context.fetchResults = fetchResults
    block(context)
  }
}

final class MockManagedObjectContext: NSManagedObjectContext {
  var fetchResults: [SearchKeyword] = []

  func mockFetch<T>(_ request: NSFetchRequest<T>) -> [SearchKeyword] {
    return fetchResults
  }
}
