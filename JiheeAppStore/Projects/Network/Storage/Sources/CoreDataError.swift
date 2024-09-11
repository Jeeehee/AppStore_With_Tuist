//
//  CoreDataError.swift
//  Storage
//
//  Created by Jihee hwang on 9/9/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import Foundation

public enum CoreDataStorageError: Error {
  case failedLocateCoreDataModel
  case failedLoadPersistentStore(Error)
  case failedSaveContext(Error)
  case filedDeleteExisting(String)
  case readError(Error)
  
  public var errorDescription: String {
    switch self {
    case .failedLocateCoreDataModel:
      return "Failed to locate Core Data model."
    case .failedLoadPersistentStore(let error):
      return "Failed to load Persistent Store. - \(error)"
    case .failedSaveContext(let error):
      return "Failed to Save Context. - \(error)"
    case .filedDeleteExisting(let value):
      return "Failed to delete existing \(value)"
    case .readError(let error):
      return "Failed to Read. - \(error)"
    }
  }
}

