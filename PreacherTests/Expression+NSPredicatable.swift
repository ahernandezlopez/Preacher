//
//  Expression+NSPredicatable.swift
//  Preacher
//
//  Created by Albert Hernández López on 31/5/15.
//  Copyright (c) 2015 Albert Hernández López. All rights reserved.
//

import Quick
import Nimble
import Preacher

class ExpressionNSPredicatable: QuickSpec {
    
    override func spec() {
        let alice = Person(firstName: "Alice", lastName: "Smith", age: 24)
        let bob = Person(firstName: "Bob", lastName: "Jones", age: 27)
        let charlie = Person(firstName: "Charlie", lastName: "Smith", age: 33)
        let quentin = Person(firstName: "Quentin", lastName: "Alberts", age: 31)

        let people: NSArray = [alice, bob, charlie, quentin]
        
        describe("NSDate") {
            it("equals") {
                let date = alice.birthday
                let sut = "birthday".equals(date)
                let predicate = sut.nsPredicate()
                expect(predicate.predicateFormat).to(equal("birthday == CAST(\(date.timeIntervalSinceReferenceDate), \"NSDate\")"))
                
                let filteredArray = people.filteredArrayUsingPredicate(predicate)
                let expectedResult: NSArray = [alice]
                expect(filteredArray).to(equal(expectedResult))
            }
            
            it("not equals") {
                let date = alice.birthday
                let sut = "birthday".notEquals(date)
                let predicate = sut.nsPredicate()
                expect(predicate.predicateFormat).to(equal("birthday != CAST(\(date.timeIntervalSinceReferenceDate), \"NSDate\")"))
                
                let filteredArray = people.filteredArrayUsingPredicate(predicate)
                let expectedResult: NSArray = [bob, charlie, quentin]
                expect(filteredArray).to(equal(expectedResult))
            }

            it("gt") {
                let date = charlie.birthday
                let sut = "birthday".gt(date)
                let predicate = sut.nsPredicate()
                expect(predicate.predicateFormat).to(equal("birthday > CAST(\(date.timeIntervalSinceReferenceDate), \"NSDate\")"))
                
                let filteredArray = people.filteredArrayUsingPredicate(predicate)
                let expectedResult: NSArray = [alice, bob, quentin]
                expect(filteredArray).to(equal(expectedResult))
            }
            
            it("gte") {
                let date = charlie.birthday
                let sut = "birthday".gte(date)
                let predicate = sut.nsPredicate()
                expect(predicate.predicateFormat).to(equal("birthday >= CAST(\(date.timeIntervalSinceReferenceDate), \"NSDate\")"))
                
                let filteredArray = people.filteredArrayUsingPredicate(predicate)
                let expectedResult: NSArray = [alice, bob, charlie, quentin]
                expect(filteredArray).to(equal(expectedResult))
            }

            it("lt") {
                let date = bob.birthday
                let sut = "birthday".lt(date)
                let predicate = sut.nsPredicate()
                expect(predicate.predicateFormat).to(equal("birthday < CAST(\(date.timeIntervalSinceReferenceDate), \"NSDate\")"))
                
                let filteredArray = people.filteredArrayUsingPredicate(predicate)
                let expectedResult: NSArray = [charlie, quentin]
                expect(filteredArray).to(equal(expectedResult))
            }
            
            it("lte") {
                let date = bob.birthday
                let sut = "birthday".lte(date)
                let predicate = sut.nsPredicate()
                expect(predicate.predicateFormat).to(equal("birthday <= CAST(\(date.timeIntervalSinceReferenceDate), \"NSDate\")"))
                
                let filteredArray = people.filteredArrayUsingPredicate(predicate)
                let expectedResult: NSArray = [bob, charlie, quentin]
                expect(filteredArray).to(equal(expectedResult))
            }

            it("between") {
                let min = alice.birthday
                let max = bob.birthday
                let sut = "birthday".between(min, max)
                let predicate = sut.nsPredicate()
                expect(predicate.predicateFormat).to(equal("birthday BETWEEN {\(min), \(max)}"))
                
                let filteredArray = people.filteredArrayUsingPredicate(predicate)
                let expectedResult: NSArray = [alice, bob]
                expect(filteredArray).to(equal(expectedResult))
            }

            it("contained in") {
                let aliceBd = alice.birthday
                let charlieBd = charlie.birthday
                let sut = "birthday".containedIn([aliceBd,charlieBd])
                let predicate = sut.nsPredicate()
                expect(predicate.predicateFormat).to(equal("birthday IN {\(aliceBd), \(charlieBd)}"))
                
                let filteredArray = people.filteredArrayUsingPredicate(predicate)
                let expectedResult: NSArray = [alice, charlie]
                expect(filteredArray).to(equal(expectedResult))
            }
            
            it("contained in empty") {
                let aliceBd = alice.birthday
                let charlieBd = charlie.birthday
                let sut = "birthday".containedIn([] as Array<NSDate>)
                let predicate = sut.nsPredicate()
                expect(predicate.predicateFormat).to(equal("birthday IN {}"))
                
                let filteredArray = people.filteredArrayUsingPredicate(predicate)
                let expectedResult: NSArray = []
                expect(filteredArray).to(equal(expectedResult))
            }
        }
        
        describe("NSNumber") {
            context("integers") {
                it("equals") {
                    let sut = "age".equals(24)
                    let predicate = sut.nsPredicate()
                    expect(predicate.predicateFormat).to(equal("age == 24"))
                    
                    let filteredArray = people.filteredArrayUsingPredicate(predicate)
                    let expectedResult: NSArray = [alice]
                    expect(filteredArray).to(equal(expectedResult))
                }
                
                it("not equals") {
                    let sut = "age".notEquals(24)
                    let predicate = sut.nsPredicate()
                    expect(predicate.predicateFormat).to(equal("age != 24"))
                    
                    let filteredArray = people.filteredArrayUsingPredicate(predicate)
                    let expectedResult: NSArray = [bob, charlie, quentin]
                    expect(filteredArray).to(equal(expectedResult))
                }
                
                it("gt") {
                    let sut = "age".gt(24)
                    let predicate = sut.nsPredicate()
                    expect(predicate.predicateFormat).to(equal("age > 24"))
                    
                    let filteredArray = people.filteredArrayUsingPredicate(predicate)
                    let expectedResult: NSArray = [bob, charlie, quentin]
                    expect(filteredArray).to(equal(expectedResult))
                }
                
                it("gte") {
                    let sut = "age".gte(24)
                    let predicate = sut.nsPredicate()
                    expect(predicate.predicateFormat).to(equal("age >= 24"))
                    
                    let filteredArray = people.filteredArrayUsingPredicate(predicate)
                    let expectedResult: NSArray = [alice, bob, charlie, quentin]
                    expect(filteredArray).to(equal(expectedResult))
                }
                
                it("lt") {
                    let sut = "age".lt(25)
                    let predicate = sut.nsPredicate()
                    expect(predicate.predicateFormat).to(equal("age < 25"))
                    
                    let filteredArray = people.filteredArrayUsingPredicate(predicate)
                    let expectedResult: NSArray = [alice]
                    expect(filteredArray).to(equal(expectedResult))
                }
                
                it("lte") {
                    let sut = "age".lte(27)
                    let predicate = sut.nsPredicate()
                    expect(predicate.predicateFormat).to(equal("age <= 27"))
                    
                    let filteredArray = people.filteredArrayUsingPredicate(predicate)
                    let expectedResult: NSArray = [alice, bob]
                    expect(filteredArray).to(equal(expectedResult))
                }
                
                it("between") {
                    let sut = "age".between(24, 31)
                    let predicate = sut.nsPredicate()
                    expect(predicate.predicateFormat).to(equal("age BETWEEN {24, 31}"))
                    
                    let filteredArray = people.filteredArrayUsingPredicate(predicate)
                    let expectedResult: NSArray = [alice, bob, quentin]
                    expect(filteredArray).to(equal(expectedResult))
                }
                
                it("contained in") {
                    let sut = "age".containedIn([24,33])
                    let predicate = sut.nsPredicate()
                    expect(predicate.predicateFormat).to(equal("age IN {24, 33}"))
                    
                    let filteredArray = people.filteredArrayUsingPredicate(predicate)
                    let expectedResult: NSArray = [alice, charlie]
                    expect(filteredArray).to(equal(expectedResult))
                }
                
                it("contained in empty") {
                    let sut = "age".containedIn([] as Array<Int>)
                    let predicate = sut.nsPredicate()
                    expect(predicate.predicateFormat).to(equal("age IN {}"))
                    
                    let filteredArray = people.filteredArrayUsingPredicate(predicate)
                    let expectedResult: NSArray = []
                    expect(filteredArray).to(equal(expectedResult))
                }
            }
        }
        
        describe("String") {
            it("equals") {
                let sut = "firstName".equals("Bob")
                let predicate = sut.nsPredicate()
                expect(predicate.predicateFormat).to(equal("firstName == \"Bob\""))
                
                let filteredArray = people.filteredArrayUsingPredicate(predicate)
                let expectedResult: NSArray = [bob]
                expect(filteredArray).to(equal(expectedResult))
            }
            
            it("not equals") {
                let sut = "firstName".notEquals("Bob")
                let predicate = sut.nsPredicate()
                expect(predicate.predicateFormat).to(equal("firstName != \"Bob\""))
                
                let filteredArray = people.filteredArrayUsingPredicate(predicate)
                let expectedResult: NSArray = [alice, charlie, quentin]
                expect(filteredArray).to(equal(expectedResult))
            }
            
            it("contained in") {
                let sut = "firstName".containedIn(["Bob", "Alice"])
                let predicate = sut.nsPredicate()
                expect(predicate.predicateFormat).to(equal("firstName IN {\"Bob\", \"Alice\"}"))
                
                let filteredArray = people.filteredArrayUsingPredicate(predicate)
                let expectedResult: NSArray = [alice, bob]
                expect(filteredArray).to(equal(expectedResult))
            }
            
            it("contained in empty") {
                let sut = "firstName".containedIn([] as [String])
                let predicate = sut.nsPredicate()
                expect(predicate.predicateFormat).to(equal("firstName IN {}"))
                
                let filteredArray = people.filteredArrayUsingPredicate(predicate)
                let expectedResult = []
                expect(filteredArray).to(equal(expectedResult))
            }
            
            it("begins with") {
                let sut = "firstName".beginsWith("B")
                let predicate = sut.nsPredicate()
                expect(predicate.predicateFormat).to(equal("firstName BEGINSWITH \"B\""))
                
                let filteredArray = people.filteredArrayUsingPredicate(predicate)
                let expectedResult: NSArray = [bob]
                expect(filteredArray).to(equal(expectedResult))
            }

            it("begins with, with case insensitivity") {
                let sut = "firstName".beginsWith("b", .CaseInsensitivity)
                let predicate = sut.nsPredicate()
                expect(predicate.predicateFormat).to(equal("firstName BEGINSWITH[c] \"b\""))
                
                let filteredArray = people.filteredArrayUsingPredicate(predicate)
                let expectedResult: NSArray = [bob]
                expect(filteredArray).to(equal(expectedResult))
            }
            
            it("begins with, with diacritic insensitivity") {
                let sut = "firstName".beginsWith("Bó", .DiacriticInsensitivity)
                let predicate = sut.nsPredicate()
                expect(predicate.predicateFormat).to(equal("firstName BEGINSWITH[d] \"Bó\""))
                
                let filteredArray = people.filteredArrayUsingPredicate(predicate)
                let expectedResult: NSArray = [bob]
                expect(filteredArray).to(equal(expectedResult))
            }
            
            it("begins with, with case & diacritic insensitivity") {
                let sut = "firstName".beginsWith("bó", .CaseInsensitivity | .DiacriticInsensitivity)
                let predicate = sut.nsPredicate()
                expect(predicate.predicateFormat).to(equal("firstName BEGINSWITH[cd] \"bó\""))
                
                let filteredArray = people.filteredArrayUsingPredicate(predicate)
                let expectedResult: NSArray = [bob]
                expect(filteredArray).to(equal(expectedResult))
            }
            
            it("contains") {
                let sut = "firstName".contains("li")
                let predicate = sut.nsPredicate()
                expect(predicate.predicateFormat).to(equal("firstName CONTAINS \"li\""))
                
                let filteredArray = people.filteredArrayUsingPredicate(predicate)
                let expectedResult: NSArray = [alice, charlie]
                expect(filteredArray).to(equal(expectedResult))
            }
            
            it("contains with case insensitivity") {
                let sut = "firstName".contains("LI", .CaseInsensitivity)
                let predicate = sut.nsPredicate()
                expect(predicate.predicateFormat).to(equal("firstName CONTAINS[c] \"LI\""))
                
                let filteredArray = people.filteredArrayUsingPredicate(predicate)
                let expectedResult: NSArray = [alice, charlie]
                expect(filteredArray).to(equal(expectedResult))
            }
            
            it("contains with diacritic insensitivity") {
                let sut = "firstName".contains("lí", .DiacriticInsensitivity)
                let predicate = sut.nsPredicate()
                expect(predicate.predicateFormat).to(equal("firstName CONTAINS[d] \"lí\""))
                
                let filteredArray = people.filteredArrayUsingPredicate(predicate)
                let expectedResult: NSArray = [alice, charlie]
                expect(filteredArray).to(equal(expectedResult))
            }
            
            it("contains with case & diacritic insensitivity") {
                let sut = "firstName".contains("LÍ", .CaseInsensitivity | .DiacriticInsensitivity)
                let predicate = sut.nsPredicate()
                expect(predicate.predicateFormat).to(equal("firstName CONTAINS[cd] \"LÍ\""))
                
                let filteredArray = people.filteredArrayUsingPredicate(predicate)
                let expectedResult: NSArray = [alice, charlie]
                expect(filteredArray).to(equal(expectedResult))
            }
            
            it("ends with") {
                let sut = "firstName".endsWith("e")
                let predicate = sut.nsPredicate()
                expect(predicate.predicateFormat).to(equal("firstName ENDSWITH \"e\""))
                
                let filteredArray = people.filteredArrayUsingPredicate(predicate)
                let expectedResult: NSArray = [alice, charlie]
                expect(filteredArray).to(equal(expectedResult))
            }
            
            it("ends with, with case insensitivity") {
                let sut = "firstName".endsWith("E", .CaseInsensitivity)
                let predicate = sut.nsPredicate()
                expect(predicate.predicateFormat).to(equal("firstName ENDSWITH[c] \"E\""))
                
                let filteredArray = people.filteredArrayUsingPredicate(predicate)
                let expectedResult: NSArray = [alice, charlie]
                expect(filteredArray).to(equal(expectedResult))
            }
            
            it("ends with, with diacritic insensitivity") {
                let sut = "firstName".endsWith("é", .DiacriticInsensitivity)
                let predicate = sut.nsPredicate()
                expect(predicate.predicateFormat).to(equal("firstName ENDSWITH[d] \"é\""))
                
                let filteredArray = people.filteredArrayUsingPredicate(predicate)
                let expectedResult: NSArray = [alice, charlie]
                expect(filteredArray).to(equal(expectedResult))
            }
            
            it("ends with, with case & diacritic insensitivity") {
                let sut = "firstName".endsWith("É", .CaseInsensitivity | .DiacriticInsensitivity)
                let predicate = sut.nsPredicate()
                expect(predicate.predicateFormat).to(equal("firstName ENDSWITH[cd] \"É\""))
                
                let filteredArray = people.filteredArrayUsingPredicate(predicate)
                let expectedResult: NSArray = [alice, charlie]
                expect(filteredArray).to(equal(expectedResult))
            }
            
            it("like") {
                let sut = "firstName".like("Bob")
                let predicate = sut.nsPredicate()
                expect(predicate.predicateFormat).to(equal("firstName LIKE \"Bob\""))
                
                let filteredArray = people.filteredArrayUsingPredicate(predicate)
                let expectedResult: NSArray = [bob]
                expect(filteredArray).to(equal(expectedResult))
            }
            
            it("like, with case insensitivity") {
                let sut = "firstName".like("BOB", .CaseInsensitivity)
                let predicate = sut.nsPredicate()
                expect(predicate.predicateFormat).to(equal("firstName LIKE[c] \"BOB\""))
                
                let filteredArray = people.filteredArrayUsingPredicate(predicate)
                let expectedResult: NSArray = [bob]
                expect(filteredArray).to(equal(expectedResult))
            }
            
            it("like, with diacritic insensitivity") {
                let sut = "firstName".like("Bób", .DiacriticInsensitivity)
                let predicate = sut.nsPredicate()
                expect(predicate.predicateFormat).to(equal("firstName LIKE[d] \"Bób\""))
                
                let filteredArray = people.filteredArrayUsingPredicate(predicate)
                let expectedResult: NSArray = [bob]
                expect(filteredArray).to(equal(expectedResult))
            }
            
            it("like, with case & diacritic insensitivity") {
                let sut = "firstName".like("BôB", .CaseInsensitivity | .DiacriticInsensitivity)
                let predicate = sut.nsPredicate()
                expect(predicate.predicateFormat).to(equal("firstName LIKE[cd] \"BôB\""))
                
                let filteredArray = people.filteredArrayUsingPredicate(predicate)
                let expectedResult: NSArray = [bob]
                expect(filteredArray).to(equal(expectedResult))
            }
            
            it("matches") {
                let sut = "firstName".matches("([A-B])\\w+")  // starts with A or B
                let predicate = sut.nsPredicate()
                expect(predicate.predicateFormat).to(equal("firstName MATCHES \"([A-B])\\\\w+\""))
                
                let filteredArray = people.filteredArrayUsingPredicate(predicate)
                let expectedResult: NSArray = [alice, bob]
                expect(filteredArray).to(equal(expectedResult))
            }
            
            it("matches, with case insensitivity") {
                let sut = "firstName".matches("([a-b])\\w+", .CaseInsensitivity)  // starts with A or B
                let predicate = sut.nsPredicate()
                expect(predicate.predicateFormat).to(equal("firstName MATCHES[c] \"([a-b])\\\\w+\""))
                
                let filteredArray = people.filteredArrayUsingPredicate(predicate)
                let expectedResult: NSArray = [alice, bob]
                expect(filteredArray).to(equal(expectedResult))
            }
            
            it("matches, with diacritic insensitivity") {
                let sut = "firstName".matches("([Á-B])\\w+", .DiacriticInsensitivity)  // starts with A or B
                let predicate = sut.nsPredicate()
                expect(predicate.predicateFormat).to(equal("firstName MATCHES[d] \"([Á-B])\\\\w+\""))
                
                let filteredArray = people.filteredArrayUsingPredicate(predicate)
                let expectedResult: NSArray = [alice, bob]
                expect(filteredArray).to(equal(expectedResult))
            }
            
            it("matches, with case & diacritic insensitivity") {
                let sut = "firstName".matches("([á-b])\\w+", .CaseInsensitivity | .DiacriticInsensitivity)  // starts with A or B
                let predicate = sut.nsPredicate()
                expect(predicate.predicateFormat).to(equal("firstName MATCHES[cd] \"([á-b])\\\\w+\""))
                
                let filteredArray = people.filteredArrayUsingPredicate(predicate)
                let expectedResult: NSArray = [alice, bob]
                expect(filteredArray).to(equal(expectedResult))
            }
        }
    }
}


