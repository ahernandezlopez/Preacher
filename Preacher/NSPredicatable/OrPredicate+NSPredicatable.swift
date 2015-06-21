//
//  OrPredicate+NSPredicatable.swift
//  Preacher
//
//  Created by Albert Hernández López on 21/6/15.
//  Copyright (c) 2015 Albert Hernández López. All rights reserved.
//

extension OrPredicate: NSPredicatable {
    
    @objc override func nsPredicate() -> NSPredicate {
        return NSCompoundPredicate.orPredicateWithSubpredicates([a.nsPredicate(), b.nsPredicate()])
    }
}
