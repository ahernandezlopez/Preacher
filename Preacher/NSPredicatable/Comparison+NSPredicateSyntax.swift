//
//  Comparison+NSPredicateSyntax.swift
//  Preacher
//
//  Created by Albert Hernández López on 21/6/15.
//  Copyright (c) 2015 Albert Hernández López. All rights reserved.
//

extension Comparison: NSPredicatableSyntax {
    
    public func predicateArguments() -> PredicateArguments {
        switch self {
            
        // NSDate
        case EqualsDate(let date):
            return PredicateArguments("== %@", [date])
        case NotEqualsDate(let date):
            return PredicateArguments("!= %@", [date])
        case GreaterThanDate(let date):
            return PredicateArguments("> %@", [date])
        case GreaterThanOrEqualDate(let date):
            return PredicateArguments(">= %@", [date])
        case LessThanDate(let date):
            return PredicateArguments("< %@", [date])
        case LessThanOrEqualDate(let date):
            return PredicateArguments("<= %@", [date])
        case InDates(let set):
            return PredicateArguments("IN %@", [set])
        case BetweenDates(let min, let max):
            return PredicateArguments("BETWEEN %@", [[min, max]])
            
        // NSNumber
        case .EqualsNumber(let number):
            return PredicateArguments("== %@", [number])
        case NotEqualsNumber(let number):
            return PredicateArguments("!= %@", [number])
        case GreaterThanNumber(let number):
            return PredicateArguments("> %@", [number])
        case GreaterThanOrEqualNumber(let number):
            return PredicateArguments(">= %@", [number])
        case LessThanNumber(let number):
            return PredicateArguments("< %@", [number])
        case LessThanOrEqualNumber(let number):
            return PredicateArguments("<= %@", [number])
        case InNumbers(let set):
            return PredicateArguments("IN %@", [set])
        case BetweenNumbers(let min, let max):
            return PredicateArguments("BETWEEN %@", [[min, max]])
            
        // String
        case .EqualsString(let string):
            return PredicateArguments("== %@", [string])
        case .NotEqualsString(let string):
            return PredicateArguments("!= %@", [string])
        case .InStrings(let set):
            return PredicateArguments("IN %@", [set])
        case BeginsWith(let string, let modifiers):
            if let strModifiers = Comparison.predicateArgumentsForStringComparisonModifier(modifiers) {
                return PredicateArguments("BEGINSWITH\(strModifiers) %@", [string])
            }
            else {
                return PredicateArguments("BEGINSWITH %@", [string])
            }
        case Contains(let string, let modifiers):
            if let strModifiers = Comparison.predicateArgumentsForStringComparisonModifier(modifiers) {
                return PredicateArguments("CONTAINS\(strModifiers) %@", [string])
            }
            else {
                return PredicateArguments("CONTAINS %@", [string])
            }
        case EndsWith(let string, let modifiers):
            if let strModifiers = Comparison.predicateArgumentsForStringComparisonModifier(modifiers) {
                return PredicateArguments("ENDSWITH\(strModifiers) %@", [string])
            }
            else {
                return PredicateArguments("ENDSWITH %@", [string])
            }
        case Like(let string, let modifiers):
            if let strModifiers = Comparison.predicateArgumentsForStringComparisonModifier(modifiers) {
                return PredicateArguments("LIKE\(strModifiers) %@", [string])
            }
            else {
                return PredicateArguments("LIKE %@", [string])
            }
        case Matches(let string, let modifiers):
            if let strModifiers = Comparison.predicateArgumentsForStringComparisonModifier(modifiers) {
                return PredicateArguments("MATCHES\(strModifiers) %@", [string])
            }
            else {
                return PredicateArguments("MATCHES %@", [string])
            }
        }
    }
    
    private static func predicateArgumentsForStringComparisonModifier(stringCmpMod: StringComparisonModifier) -> String? {
        var modifiersStr = ""
        if stringCmpMod & StringComparisonModifier.CaseInsensitivity {
            modifiersStr += "c"
        }
        if stringCmpMod & StringComparisonModifier.DiacriticInsensitivity {
            modifiersStr += "d"
        }
        
        if modifiersStr.isEmpty {
            return nil
        }
        else {
            return "[\(modifiersStr)]"
        }
    }
}
