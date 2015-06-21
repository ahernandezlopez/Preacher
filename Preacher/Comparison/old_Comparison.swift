//
//  Comparison.swift
//  Predicates
//
//  Created by AHL on 31/5/15.
//  Copyright (c) 2015 Albert Hernández López. All rights reserved.
//

public enum Comparison: Equatable, Printable {
    case NumberCmp(NumberComparison)
    case StringCmp(StringComparison)
    
    public var description: String {
        switch self {
        case .NumberCmp(let nc):
            return nc.description
        case .StringCmp(let sc):
            return sc.description
        }
    }
}

public func ==(lhs: Comparison, rhs: Comparison) -> Bool {
    switch (lhs, rhs) {
    case (.NumberCmp(let lValue), .NumberCmp(let rValue)):
        return lValue == rValue
    case (.StringCmp(let lValue), .StringCmp(let rValue)):
        return lValue == rValue
    default:
        return false
    }
}