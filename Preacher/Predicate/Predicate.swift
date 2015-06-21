//
//  Predicate.swift
//  Predicates
//
//  Created by Albert Hernández López on 31/5/15.
//  Copyright (c) 2015 Albert Hernández López. All rights reserved.
//

/**
    Base class for predicates as composite.
*/
public class Predicate: Printable {
    
    // MARK: - Public methods
    
    /**
        Returns AND predicate with self and the given predicate.
    
        :param: predicate A predicate.
    
        :returns: An AND predicate.
    */
    public func and(predicate: Predicate) -> Predicate {
        return AndPredicate(a: self, b: predicate)
    }
    
    /**
        Returns OR predicate with self and the given predicate.
    
        :param: predicate A predicate.
    
        :returns: An OR predicate.
    */
    public func or(predicate: Predicate) -> Predicate {
        return OrPredicate(a: self, b: predicate)
    }
    
    /**
        Returns self as a negated predicate.
    
        :returns: The negated predicate.
    */
    public func not() -> Predicate {
        return NotPredicate(predicate: self)
    }
    
    // MARK: - Printable
    
    public var description: String {
        return ""
    }
}