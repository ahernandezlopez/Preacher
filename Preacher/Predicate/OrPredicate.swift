//
//  OrPredicate.swift
//  Preacher
//
//  Created by Albert Hernández López on 31/5/15.
//  Copyright (c) 2015 Albert Hernández López. All rights reserved.
//

/**
    OR predicate.
*/
internal class OrPredicate: Predicate {
    
    let a: Predicate
    let b: Predicate
    
    // MARK: - Lifecycle
    
    init(a: Predicate, b: Predicate) {
        self.a = a
        self.b = b
    }
    
    // MARK: - Printable
    
    override var description: String {
        return "(\(a) OR \(b))"
    }
}

/**
    Returns an OR predicate with the given predicates.

    :param: lhs left-hand side predicate.
    :param: rhs right-hand side precidate.

    :returns: An OR predicate.
*/
public func ||(lhs: Predicate, rhs:Predicate) -> Predicate {
    return lhs.or(rhs)
}