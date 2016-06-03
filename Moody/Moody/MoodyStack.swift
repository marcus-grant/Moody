//
//  MoodyStack.swift
//  Moody
//
//  Created by Marcus Grant on 6/3/16.
//  Copyright © 2016 Marcus Grant. All rights reserved.
//

import Foundation
import CoreData


// documentsURL is awkwardly defined as an extended member variable of NSURL within the 
// file Utilities.swift
private let StoreURL = NSURL.documentsURL.URLByAppendingPathComponent("Moody.moody")

// The function that generates a singleton of the main ManagedObjectContext
public func createMoodyMainContext() -> NSManagedObjectContext {

  // First the 
  let bundles = [NSBundle(forClass: Mood.self)]
  guard let model = NSManagedObjectModel.mergedModelFromBundles(bundles) else {
    fatalError("model not found")
  }
  let psc = NSPersistentStoreCoordinator(managedObjectModel: model)
  try! psc.addPersistentStoreWithType(NSSQLiteStoreType,
                                      configuration: nil,
                                      URL: StoreURL,
                                      options: nil)
  let context = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
  context.persistentStoreCoordinator = psc
  return context
}