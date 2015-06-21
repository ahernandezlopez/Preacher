//
//  PredicateArguments.swift
//  Preacher
//
//  Created by Albert Hernández López on 21/6/15.
//  Copyright (c) 2015 Albert Hernández López. All rights reserved.
//

/**
    Contains the format and the arguments to build up a NSPredicate.
*/
public struct PredicateArguments: Printable {
    
    let format: String
    let arguments: [AnyObject]?
    
    // MARK: - Lifecycle
    
    public init(_ format: String, _ arguments: [AnyObject]?) {
        self.format = format
        self.arguments = arguments
    }
    
    // MARK: - Public methods
    
    public func predicateWithField(field: String) -> NSPredicate {
        return NSPredicate(format: "\(field) \(format)", argumentArray: arguments)
    }
    
    // MARK: - Printable
    
    public var description: String {
        if let actualArgs = arguments {
            return String(format: format, actualArgs)
        }
        else {
            return format
        }
    }
}
