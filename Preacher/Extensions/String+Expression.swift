//
//  String+Expression.swift
//  Expressions
//
//  Created by Albert Hernández López on 31/5/15.
//  Copyright (c) 2015 Albert Hernández López. All rights reserved.
//

import Foundation

// MARK: - Expressions for NSDate fields

extension String {
    public func equals(date: NSDate) -> Expression {
        return Expression(self, .EqualsDate(date))
    }
    
    public func notEquals(date: NSDate) -> Expression {
        return Expression(self, .NotEqualsDate(date))
    }
    
    public func gt(date: NSDate) -> Expression {
        return Expression(self, .GreaterThanDate(date))
    }
    
    public func gte(date: NSDate) -> Expression {
        return Expression(self, .GreaterThanOrEqualDate(date))
    }
    
    public func lt(date: NSDate) -> Expression {
        return Expression(self, .LessThanDate(date))
    }
    
    public func lte(date: NSDate) -> Expression {
        return Expression(self, .LessThanOrEqualDate(date))
    }
    
    public func between(a: NSDate, _ b: NSDate) -> Expression {
        return Expression(self, .BetweenDates(a, b))
    }
    
    public func containedIn(dates: Array<NSDate>) -> Expression {
        return Expression(self, .InDates(dates))
    }
}

// MARK: - Expressions for NSNumber fields

extension String {
    public func equals(number: NSNumber) -> Expression {
        return Expression(self, .EqualsNumber(number))
    }
    
    public func notEquals(number: NSNumber) -> Expression {
        return Expression(self, .NotEqualsNumber(number))
    }
    
    public func gt(number: NSNumber) -> Expression {
        return Expression(self, .GreaterThanNumber(number))
    }
    
    public func gte(number: NSNumber) -> Expression {
        return Expression(self, .GreaterThanOrEqualNumber(number))
    }
    
    public func lt(number: NSNumber) -> Expression {
        return Expression(self, .LessThanNumber(number))
    }
    
    public func lte(number: NSNumber) -> Expression {
        return Expression(self, .LessThanOrEqualNumber(number))
    }
    
    public func between(a: NSNumber, _ b: NSNumber) -> Expression {
        return Expression(self, .BetweenNumbers(a, b))
    }
    
    public func containedIn(numbers: Array<NSNumber>) -> Expression {
        return Expression(self, .InNumbers(numbers))
    }
}

// MARK: - Expressions for String fields

public extension String {
    public func equals(string: String) -> Expression {
        return Expression(self, .EqualsString(string))
    }
    
    public func notEquals(string: String) -> Expression {
        return Expression(self, .NotEqualsString(string))
    }

    public func beginsWith(string: String) -> Expression {
        return beginsWith(string, StringComparisonModifier.allZeros)
    }
    
    public func beginsWith(string: String, _ modifier: StringComparisonModifier) -> Expression {
        return Expression(self, .BeginsWith(string, modifier))
    }
    
    public func contains(string: String) -> Expression {
        return contains(string, StringComparisonModifier.allZeros)
    }
    
    public func contains(string: String, _ modifier: StringComparisonModifier) -> Expression {
        return Expression(self, .Contains(string, modifier))
    }
    
    public func endsWith(string: String) -> Expression {
        return endsWith(string, StringComparisonModifier.allZeros)
    }
    
    public func endsWith(string: String, _ modifier: StringComparisonModifier) -> Expression {
        return Expression(self, .EndsWith(string, modifier))
    }
    
    public func like(string: String) -> Expression {
        return like(string, StringComparisonModifier.allZeros)
    }
    
    public func like(string: String, _ modifier: StringComparisonModifier) -> Expression {
        return Expression(self, .Like(string, modifier))
    }
    
    public func matches(regex: String) -> Expression {
        return matches(regex, StringComparisonModifier.allZeros)
    }
    
    public func matches(string: String, _ modifier: StringComparisonModifier) -> Expression {
        return Expression(self, .Matches(string, modifier))
    }
    
    public func containedIn(strings: Array<String>) -> Expression {
        return Expression(self, .InStrings(strings))
    }
}