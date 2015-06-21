//
//  AndPredicate.swift
//  Preacher
//
//  Created by Albert Hernández López on 31/5/15.
//  Copyright (c) 2015 Albert Hernández López. All rights reserved.
//

/**
    AND predicate
*/
class AndPredicate: Predicate {
    
    let a: Predicate
    let b: Predicate
    
    // MARK: - Lifecycle
    
    init(a: Predicate, b: Predicate) {
        self.a = a
        self.b = b
    }
    override var description: String {
        return "(\(a) AND \(b))"
    }
}

/**
    Returns an AND predicate with the given predicates.

    :param: lhs left-hand side predicate.
    :param: rhs right-hand side precidate.

    :returns: An AND predicate.
*/
public func &&(lhs: Predicate, rhs:Predicate) -> Predicate {
    return lhs.and(rhs)
}