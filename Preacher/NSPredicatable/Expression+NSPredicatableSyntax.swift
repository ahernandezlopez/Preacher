//
//  Expression+NSPredicatableSyntax.swift
//  Preacher
//
//  Created by Albert Hernández López on 21/6/15.
//  Copyright (c) 2015 Albert Hernández López. All rights reserved.
//

extension Expression: NSPredicatableSyntax {
    
    public func predicateArguments() -> PredicateArguments {
        return comparison.predicateArguments()
    }
}
