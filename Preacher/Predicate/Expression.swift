//
//  Expression.swift
//  Predicates
//
//  Created by Albert Hernández López on 31/5/15.
//  Copyright (c) 2015 Albert Hernández López. All rights reserved.
//

/**
    Defines an expression composed by a field name and a comparison.
*/
public class Expression: Predicate, Printable {
    
    public let field: String
    public let comparison: Comparison
    
    // MARK: - Lifecycle
    
    public init(_ field: String, _ comparison: Comparison) {
        self.field = field
        self.comparison = comparison
    }
    
    // MARK: - Printable
    
    override public var description: String {
        return "\(field) \(comparison)"
    }
}