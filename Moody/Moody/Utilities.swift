//
//  Utilities.swift
//  Moody
//
//  Created by Marcus Grant on 6/3/16.
//  Copyright © 2016 Marcus Grant. All rights reserved.
//

import Foundation

extension NSURL {
  static var documentsURL: NSURL {
    return try! NSFileManager.defaultManager().URLForDirectory(.DocumentDirectory,
                                                               inDomain: .UserDomainMask,
                                                               appropriateForURL: nil,
                                                               create: true)
  }

}