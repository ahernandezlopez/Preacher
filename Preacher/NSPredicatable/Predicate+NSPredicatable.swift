//
//  Predicate+NSPredicatable.swift
//  Preacher
//
//  Created by Albert Hernández López on 21/6/15.
//  Copyright (c) 2015 Albert Hernández López. All rights reserved.
//

extension Predicate: NSPredicatable {
    
    @objc public func nsPredicate() -> NSPredicate {
        return NSPredicate()
    }
}
