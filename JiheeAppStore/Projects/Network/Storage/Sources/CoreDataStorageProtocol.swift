//
//  CoreDataStorageProtocol.swift
//  Storage
//
//  Created by Jihee hwang on 9/9/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import Foundation

import CoreData

public protocol CoreDataStorageProtocol {
  func saveContext()
  func performBackgroundTask(_ block: @escaping (NSManagedObjectContext) -> Void)
}
