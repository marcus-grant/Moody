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

  // First the bundle where the ManagedObjectModel resides is given a reference "bundles"
  let bundles = [NSBundle(forClass: Mood.self)]

  // Then data model is loaded and merged if necessary into one model reference
  guard let model = NSManagedObjectModel.mergedModelFromBundles(bundles) else {
    fatalError("model not found")
  }

  // Next an NSPersistentStoreCoordinator is needed which is created with the new model
  let psc = NSPersistentStoreCoordinator(managedObjectModel: model)

  // The persistant store is added with the previously defined StoreURL.
  // addPersistentStoreWithType throws potential errors, so the try! keyword is needed to
  // create a run-time error since there is no recovery from such a scenario
  try! psc.addPersistentStoreWithType(NSSQLiteStoreType,
                                      configuration: nil,
                                      URL: StoreURL,
                                      options: nil)

  // Finally the singleton instance of NSManagedObjectContext can be create within the
  // MainQueue tying all of its work to the main thread of the application.
  // This ensures the data can safely be accessed by any UI elements of the code
  let context = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
  context.persistentStoreCoordinator = psc
  return context
}