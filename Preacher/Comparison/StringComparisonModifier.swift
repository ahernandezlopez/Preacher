//
//  StringComparisonModifier.swift
//  Preacher
//
//  Created by Albert Hernández López on 7/6/15.
//  Copyright (c) 2015 Albert Hernández López. All rights reserved.
//

/**
    Lists all string comparison modifier options.
    
    - None:                     No modifiers.
    - CaseInsensitivity:        Case insensitive.
    - DiacriticInsensitivity:   Diacritic insensitive.
*/
public struct StringComparisonModifier: RawOptionSetType, BooleanType, Printable {
    
    public static var None: StringComparisonModifier                   { return self(rawValue: 0b00) }
    public static var CaseInsensitivity: StringComparisonModifier      { return self(rawValue: 0b01) }
    public static var DiacriticInsensitivity: StringComparisonModifier { return self(rawValue: 0b10) }
    
    // MARK: - RawRepresentable
    
    public var rawValue: UInt
    
    public init(rawValue: UInt) {
        self.rawValue = rawValue
    }
    
    // MARK: - NilLiteralConvertible
    
    public init(nilLiteral: ()) {
        self.rawValue = 0
    }
    
    // MARK: - BitwiseOperationsType
    
    public static var allZeros: StringComparisonModifier {
        return StringComparisonModifier.None
    }
    
    // MARK: - BooleanType
    
    public var boolValue: Bool {
        return rawValue != 0
    }
    
    // MARK: - Printable
    
    public var description: String {
        var modifiersStr = ""
        if self & StringComparisonModifier.CaseInsensitivity {
            modifiersStr += "c"
        }
        if self & StringComparisonModifier.DiacriticInsensitivity {
            modifiersStr += "d"
        }
        
        if modifiersStr.isEmpty {
            return ""
        }
        else {
            return "[\(modifiersStr)]"
        }
    }
}
