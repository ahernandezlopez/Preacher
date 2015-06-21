//
//  NSPredicatableSyntax.swift
//  Preacher
//
//  Created by Albert Hernández López on 21/6/15.
//  Copyright (c) 2015 Albert Hernández López. All rights reserved.
//

public protocol NSPredicatableSyntax {
    
    /**
        Returns the predicate arguments needed to build up a NSPredicate.
    
        :returns: The predicate arguments needed to build up a NSPredicate.
    */
    func predicateArguments() -> PredicateArguments
}
