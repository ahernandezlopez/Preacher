//
//  Comparison.swift
//  Preacher
//
//  Created by Albert Hernández López on 1/6/15.
//  Copyright (c) 2015 Albert Hernández López. All rights reserved.
//

import Foundation

/**
    Describes all supported comparisons.

    - EqualsDate:               Equals to a date.
    - NotEqualsDate:            Not equals to a date.
    - GreaterThanDate:          Greater than a date.
    - GreaterThanOrEqualDate:   Greater than or equals a date.
    - LessThanDate:             Less than a date.
    - LessThanOrEqualDate:      Less than or equals a date.
    - InDates:                  Contained in the given dates.
    - BetweenDates:             Between two dates.
    - EqualsNumber:             Equals to a number.
    - NotEqualsNumber:          Not equals to a number.
    - GreaterThanNumber:        Not equals to a number.
    - GreaterThanOrEqualNumber: Greater than or equals a number.
    - LessThanNumber:           Less than a number.
    - LessThanOrEqualNumber:    Less than or equals a number.
    - InNumbers:                Contained in the given numbers.
    - BetweenNumbers:           Between two numbers.
    - EqualsString:             Equals to a string.
    - NotEqualsString:          Not equals to a string.
    - InStrings:                Contained in the given strings.
    - BeginsWith:               Begins with a substring.
    - Contains:                 Contains a substring.
    - EndsWith:                 Ends with a substring.
    - Like:                     Likes a string.
    - Matches:                  Matches a regular expression.
*/
public enum Comparison: Equatable {
    // NSDate
    case EqualsDate(NSDate)
    case NotEqualsDate(NSDate)
    case GreaterThanDate(NSDate)
    case GreaterThanOrEqualDate(NSDate)
    case LessThanDate(NSDate)
    case LessThanOrEqualDate(NSDate)
    case InDates(Array<NSDate>)
    case BetweenDates(NSDate, NSDate)
    
    // NSNumber
    case EqualsNumber(NSNumber)
    case NotEqualsNumber(NSNumber)
    case GreaterThanNumber(NSNumber)
    case GreaterThanOrEqualNumber(NSNumber)
    case LessThanNumber(NSNumber)
    case LessThanOrEqualNumber(NSNumber)
    case InNumbers(Array<NSNumber>)
    case BetweenNumbers(NSNumber, NSNumber)
    
    // String
    case EqualsString(String)
    case NotEqualsString(String)
    case InStrings(Array<String>)
    case BeginsWith(String, StringComparisonModifier)
    case Contains(String, StringComparisonModifier)
    case EndsWith(String, StringComparisonModifier)
    case Like(String, StringComparisonModifier)
    case Matches(String, StringComparisonModifier)
}

// MARK: - Equatable

public func ==(lhs: Comparison, rhs: Comparison) -> Bool {
    switch (lhs, rhs) {
    
    // NSDate
    case (.EqualsDate(let lValue), .EqualsDate(let rValue)):
        return lValue == rValue
    case (.NotEqualsDate(let lValue), .NotEqualsDate(let rValue)):
        return lValue == rValue
    case (.GreaterThanDate(let lValue), .GreaterThanDate(let rValue)):
        return lValue == rValue
    case (.GreaterThanOrEqualDate(let lValue), .GreaterThanOrEqualDate(let rValue)):
        return lValue == rValue
    case (.LessThanDate(let lValue), .LessThanDate(let rValue)):
        return lValue == rValue
    case (.LessThanOrEqualDate(let lValue), .LessThanOrEqualDate(let rValue)):
        return lValue == rValue
    case (.InDates(let lValue), .InDates(let rValue)):
        return lValue == rValue
    case (.BetweenDates(let lA, let lB), .BetweenDates(let rA, let rB)):
        return lA == rA && lB == rB
        
    // NSNumber
    case (.EqualsNumber(let lValue), .EqualsNumber(let rValue)):
        return lValue == rValue
    case (.NotEqualsNumber(let lValue), .NotEqualsNumber(let rValue)):
        return lValue == rValue
    case (.GreaterThanNumber(let lValue), .GreaterThanNumber(let rValue)):
        return lValue == rValue
    case (.GreaterThanOrEqualNumber(let lValue), .GreaterThanOrEqualNumber(let rValue)):
        return lValue == rValue
    case (.LessThanNumber(let lValue), .LessThanNumber(let rValue)):
        return lValue == rValue
    case (.LessThanOrEqualNumber(let lValue), .LessThanOrEqualNumber(let rValue)):
        return lValue == rValue
    case (.InNumbers(let lValue), .InNumbers(let rValue)):
        return lValue == rValue
    case (.BetweenNumbers(let lA, let lB), .BetweenNumbers(let rA, let rB)):
        return lA == rA && lB == rB
    
    // String
    case (.EqualsString(let lValue), .EqualsString(let rValue)):
        return lValue == rValue
    case (.NotEqualsString(let lValue), .NotEqualsString(let rValue)):
        return lValue == rValue
    case (.InStrings(let lValue), .InStrings(let rValue)):
        return lValue == rValue
    case (.BeginsWith(let lValue, let lModifier), .BeginsWith(let rValue, let rModifier)):
        return lValue == rValue && lModifier == rModifier
    case (.Contains(let lValue, let lModifier), .Contains(let rValue, let rModifier)):
        return lValue == rValue && lModifier == rModifier
    case (.EndsWith(let lValue, let lModifier), .EndsWith(let rValue, let rModifier)):
        return lValue == rValue && lModifier == rModifier
    case (.Like(let lValue, let lModifier), .Like(let rValue, let rModifier)):
        return lValue == rValue && lModifier == rModifier
    case (.Matches(let lValue, let lModifier), .Matches(let rValue, let rModifier)):
        return lValue == rValue && lModifier == rModifier
    default:
        return false
    }
}

// MARK: - Printable

extension Comparison: Printable {
    public var description: String {
        switch self {
            
        // NSDate
        case EqualsDate(let date):
            return "== \(date)"
        case NotEqualsDate(let date):
            return "!= \(date)"
        case GreaterThanDate(let date):
            return "> \(date)"
        case GreaterThanOrEqualDate(let date):
            return ">= \(date)"
        case LessThanDate(let date):
            return "< \(date)"
        case LessThanOrEqualDate(let date):
            return "<= \(date)"
        case InDates(let array):
            var valuesDescription = array.reduce("") { "\($0),\($1)"}
            return "IN {\(valuesDescription)}"
        case BetweenDates(let min, let max):
            return "BETWEEN {\(min), \(max)}"
            
        // NSNumber
        case .EqualsNumber(let number):
            return "== \(number)"
        case NotEqualsNumber(let number):
            return "!= \(number)"
        case GreaterThanNumber(let number):
            return "> \(number)"
        case GreaterThanOrEqualNumber(let number):
            return ">= \(number)"
        case LessThanNumber(let number):
            return "< \(number)"
        case LessThanOrEqualNumber(let number):
            return "<= \(number)"
        case InNumbers(let array):
            var valuesDescription = array.reduce("") { "\($0),\($1)"}
            return "IN {\(valuesDescription)}"
        case BetweenNumbers(let min, let max):
            return "BETWEEN {\(min), \(max)}"
            
        // String
        case .EqualsString(let value):
            return "== \(value)"
        case .NotEqualsString(let value):
            return "!= \(value)"
        case .InStrings(let array):
            var valuesDescription = array.reduce("") { "\($0),\"\($1)\""}
            return "IN {\(valuesDescription)}"
        case BeginsWith(let value, let modifiers):
            return "BEGINSWITH\(modifiers) \"\(value)\""
        case Contains(let value, let modifiers):
            return "CONTAINS\(modifiers) \"\(value)\""
        case EndsWith(let value, let modifiers):
            return "ENDSWITH\(modifiers) \"\(value)\""
        case Like(let value, let modifiers):
            return "LIKE\(modifiers) \"\(value)\""
        case Matches(let value, let modifiers):
            return "MATCHES\(modifiers) \"\(value)\""
        }
    }
}