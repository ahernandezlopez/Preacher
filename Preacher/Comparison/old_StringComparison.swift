//
//  StringComparison.swift
//  Predicates
//
//  Created by AHL on 31/5/15.
//  Copyright (c) 2015 Albert Hernández López. All rights reserved.
//

import Foundation

public enum StringComparison: Equatable, Printable {
    case Eq(String)
    case Neq(String)
    
    case BeginsWith(String)
    case Contains(String)
    case EndsWith(String)
    case Like(String)
    case Matches(NSRegularExpression)
    
    case In(Set<String>)
    
    public var description: String {
        switch self {
        case .Eq(let value):
            return "== '\(value)'"
        case .Neq(let value):
            return "!= '\(value)'"
            
        case BeginsWith(let value):
            return "BEGINSWITH '\(value)'"
        case Contains(let value):
            return "CONTAINS '\(value)'"
        case EndsWith(let value):
            return "ENDSWITH '\(value)'"
        case Like(let value):
            return "LIKE '\(value)'"
        case Matches(let value):
            return "MATCHES '\(value)'"
            
        case .In(let values):
            return "IN \(values)"
        }
    }
}

public func ==(lhs: StringComparison, rhs: StringComparison) -> Bool {
    switch (lhs, rhs) {
    case (.Eq(let lValue), .Eq(let rValue)):
        return lValue == rValue
    case (.Neq(let lValue), .Neq(let rValue)):
        return lValue == rValue
    case (.BeginsWith(let lValue), .BeginsWith(let rValue)):
        return lValue == rValue
    case (.Contains(let lValue), .Contains(let rValue)):
        return lValue == rValue
    case (.EndsWith(let lValue), .EndsWith(let rValue)):
        return lValue == rValue
    case (.Like(let lValue), .Like(let rValue)):
        return lValue == rValue
    case (.Matches(let lValue), .Matches(let rValue)):
        return lValue == rValue
    case (.In(let lValue), .In(let rValue)):
        return lValue == rValue
    default:
        return false
    }
}