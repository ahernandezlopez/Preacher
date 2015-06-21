//
//  NSPredicatable.swift
//  Preacher
//
//  Created by Albert Hernández López on 31/5/15.
//  Copyright (c) 2015 Albert Hernández López. All rights reserved.
//

public protocol NSPredicatable {
    
    /**
        Returns an NSPredicate.
    
        :returns: An NSPredicate.
    */
    @objc func nsPredicate() -> NSPredicate
}