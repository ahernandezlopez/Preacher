//
//  NumberComparison.swift
//  Predicates
//
//  Created by AHL on 31/5/15.
//  Copyright (c) 2015 Albert Hernández López. All rights reserved.
//

import Foundation

public enum NumberComparison: Equatable, Printable {
    case Eq(NSNumber)
    case Neq(NSNumber)
    
    case Gt(NSNumber)
    case Gte(NSNumber)
    case Lt(NSNumber)
    case Lte(NSNumber)
    
    case Between(NSNumber, NSNumber)
    
    case In(Set<NSNumber>)
    
    public var description: String {
        switch self {
        case .Eq(let value):
            return "== \(value)"
        case .Neq(let value):
            return "!= \(value)"
        case .Gt(let value):
            return "> \(value)"
        case .Gte(let value):
            return ">= \(value)"
        case .Lt(let value):
            return "< \(value)"
        case .Lte(let value):
            return "<= \(value)"
        case .Between(let a, let b):
            return "BETWEEN {\(a),\(b)}"
        case .In(let values):
            return "IN \(values)"
        }
    }
}

public func ==(lhs: NumberComparison, rhs: NumberComparison) -> Bool {
    switch (lhs, rhs) {
    case (.Eq(let lValue), .Eq(let rValue)):
        return lValue == rValue
    case (.Neq(let lValue), .Neq(let rValue)):
        return lValue == rValue
    case (.Gt(let lValue), .Gt(let rValue)):
        return lValue == rValue
    case (.Gte(let lValue), .Gte(let rValue)):
        return lValue == rValue
    case (.Lt(let lValue), .Lt(let rValue)):
        return lValue == rValue
    case (.Lte(let lValue), .Lte(let rValue)):
        return lValue == rValue
    case (.Between(let lAValue, let lBValue), .Between(let rAValue, let rBValue)):
        return lAValue == rAValue && lBValue == rBValue
    case (.In(let lValue), .In(let rValue)):
        return lValue == rValue
    default:
        return false
    }
}