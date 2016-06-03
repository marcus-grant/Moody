//
//  Mood.swift
//  Moody
//
//  Created by Marcus Grant on 6/3/16.
//  Copyright © 2016 Marcus Grant. All rights reserved.
//

import Foundation
import UIKit

public final class Mood: ManagedObject {

  // The two initial basic attributes of the Mood Entity date and color
  // @NSManaged tells the compiler that these attributes are backed by CoreData attributes
  // those attributes are the public and private(set) properties, which state that
  // they are both publicly readable, but privately written to
  // Before these classes are recoginzable within the Data model, we need to specify what
  // class is backing them within the xcdatamodeld file
  @NSManaged  public  private(set)  var date:   NSDate
  @NSManaged  public  private(set)  var colors: [UIColor]

}
