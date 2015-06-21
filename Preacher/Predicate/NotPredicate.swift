//
//  NotPredicate.swift
//  Preacher
//
//  Created by Albert Hernández López on 31/5/15.
//  Copyright (c) 2015 Albert Hernández López. All rights reserved.
//

/**
    NOT predicate.
*/
class NotPredicate: Predicate {
    
    let predicate: Predicate
    
    // MARK: - Lifecycle
    
    init(predicate: Predicate) {
        self.predicate = predicate
    }
    
    // MARK: - Printable
    
    override var description: String {
        return "(NOT \(predicate))"
    }
}

/**
    Returns the negated predicate for the given input.

    :param: predicate A predicate.

    :returns: A negated predicate for the given one.
*/
public prefix func !(predicate: Predicate) -> Predicate {
    return predicate.not()
}