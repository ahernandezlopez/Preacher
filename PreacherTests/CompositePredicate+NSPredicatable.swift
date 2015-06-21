//
//  CompositePredicate+NSPredicatable.swift
//  Preacher
//
//  Created by Albert Hernández López on 2/6/15.
//  Copyright (c) 2015 Albert Hernández López. All rights reserved.
//

import Foundation

import Quick
import Nimble
import Preacher

class CompositePredicateNSPredicatable: QuickSpec {
    
    override func spec() {
        let alice = Person(firstName: "Alice", lastName: "Smith", age: 24)
        let bob = Person(firstName: "Bob", lastName: "Jones", age: 27)
        let charlie = Person(firstName: "Charlie", lastName: "Smith", age: 33)
        let quentin = Person(firstName: "Quentin", lastName: "Alberts", age: 31)
        
        let people: NSArray = [alice, bob, charlie, quentin]
        
        describe("not") {
            it("using not method") {
                let sut = "age".equals(24).not()
                let predicate = sut.nsPredicate()
                expect(predicate.predicateFormat).to(equal("NOT age == 24"))
                
                let filteredArray = people.filteredArrayUsingPredicate(predicate)
                let expectedResult: NSArray = [bob, charlie, quentin]
                expect(filteredArray).to(equal(expectedResult))
            }
            
            it("using ! operand") {
                let sut = !"age".equals(24)
                let predicate = sut.nsPredicate()
                expect(predicate.predicateFormat).to(equal("NOT age == 24"))
                
                let filteredArray = people.filteredArrayUsingPredicate(predicate)
                let expectedResult: NSArray = [bob, charlie, quentin]
                expect(filteredArray).to(equal(expectedResult))
            }
        }
        
        describe("and") {
            it("using and method") {
                let sut = "lastName".equals("Smith").and("age".equals(24))
                let predicate = sut.nsPredicate()
                expect(predicate.predicateFormat).to(equal("lastName == \"Smith\" AND age == 24"))
                
                let filteredArray = people.filteredArrayUsingPredicate(predicate)
                let expectedResult: NSArray = [alice]
                expect(filteredArray).to(equal(expectedResult))
            }
            
            it("using && operand") {
                let sut = "lastName".equals("Smith") && "age".equals(24)
                let predicate = sut.nsPredicate()
                expect(predicate.predicateFormat).to(equal("lastName == \"Smith\" AND age == 24"))
                
                let filteredArray = people.filteredArrayUsingPredicate(predicate)
                let expectedResult: NSArray = [alice]
                expect(filteredArray).to(equal(expectedResult))
            }
        }
        
        describe("or") {
            it("using or method") {
                let sut = "lastName".equals("Smith").or("age".equals(24))
                let predicate = sut.nsPredicate()
                expect(predicate.predicateFormat).to(equal("lastName == \"Smith\" OR age == 24"))
                
                let filteredArray = people.filteredArrayUsingPredicate(predicate)
                let expectedResult: NSArray = [alice, charlie]
                expect(filteredArray).to(equal(expectedResult))
            }
            
            it("using || operand") {
                let sut = "lastName".equals("Smith") || "age".equals(24)
                let predicate = sut.nsPredicate()
                expect(predicate.predicateFormat).to(equal("lastName == \"Smith\" OR age == 24"))
                
                let filteredArray = people.filteredArrayUsingPredicate(predicate)
                let expectedResult: NSArray = [alice, charlie]
                expect(filteredArray).to(equal(expectedResult))
            }
        }
        
        describe("mixed up") {
            it("using not, or & and") {
                let sut = (!"lastName".equals("Smith") || "firstName".equals("Charlie")) && "age".gt(30)
                let predicate = sut.nsPredicate()
                expect(predicate.predicateFormat).to(equal("((NOT lastName == \"Smith\") OR firstName == \"Charlie\") AND age > 30"))
                
                let filteredArray = people.filteredArrayUsingPredicate(predicate)
                let expectedResult: NSArray = [charlie, quentin]
                expect(filteredArray).to(equal(expectedResult))
            }
        }
    }
}