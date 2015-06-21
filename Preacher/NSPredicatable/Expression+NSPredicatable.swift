//
//  Expression+NSPredicatable.swift
//  Preacher
//
//  Created by Albert Hernández López on 21/6/15.
//  Copyright (c) 2015 Albert Hernández López. All rights reserved.
//

extension Expression: NSPredicatable {
    
    @objc override public func nsPredicate() -> NSPredicate {
        return predicateArguments().predicateWithField(field)
    }
}