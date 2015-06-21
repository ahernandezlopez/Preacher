//
//  String+ExpressionSpec.swift
//  Preacher
//
//  Created by Albert Hernández López on 31/5/15.
//  Copyright (c) 2015 Albert Hernández López. All rights reserved.
//

import Quick
import Nimble
import Preacher

class StringPredicateSpec: QuickSpec {
    
    override func spec() {
        let field = "field"
        
        describe("NSDate expressions") {
            let date = NSDate()
            it("equals") {
                let sut = field.equals(date)
                expect(sut.field).to(equal(field))
                expect(sut.comparison).to(equal(Comparison.EqualsDate(date)))
            }
            it("not equals") {
                let sut = field.notEquals(date)
                expect(sut.field).to(equal(field))
                expect(sut.comparison).to(equal(Comparison.NotEqualsDate(date)))
            }
            it("gt") {
                let sut = field.gt(date)
                expect(sut.field).to(equal(field))
                expect(sut.comparison).to(equal(Comparison.GreaterThanDate(date)))
            }
            it("gte") {
                let sut = field.gte(date)
                expect(sut.field).to(equal(field))
                expect(sut.comparison).to(equal(Comparison.GreaterThanOrEqualDate(date)))
            }
            it("lt") {
                let sut = field.lt(date)
                expect(sut.field).to(equal(field))
                expect(sut.comparison).to(equal(Comparison.LessThanDate(date)))
            }
            it("lte") {
                let sut = field.lte(date)
                expect(sut.field).to(equal(field))
                expect(sut.comparison).to(equal(Comparison.LessThanOrEqualDate(date)))
            }
            it("between") {
                let date2 = NSDate(timeIntervalSinceNow: 1000)
                let sut = field.between(date, date2)
                expect(sut.field).to(equal(field))
                expect(sut.comparison).to(equal(Comparison.BetweenDates(date, date2)))
            }
            it("containedIn") {
                let date2 = NSDate(timeIntervalSinceNow: 1000)
                let date3 = NSDate(timeIntervalSinceNow: 2000)
                let sut = field.containedIn([date,date2,date3])
                expect(sut.field).to(equal(field))
                expect(sut.comparison).to(equal(Comparison.InDates([date,date2,date3])))
            }
        }
        
        describe("NSNumber expressions") {
            context("integers") {
                let n = 3
                it("equals") {
                    let sut = field.equals(n)
                    expect(sut.field).to(equal(field))
                    expect(sut.comparison).to(equal(Comparison.EqualsNumber(n)))
                }
                it("not equals") {
                    let sut = field.notEquals(n)
                    expect(sut.field).to(equal(field))
                    expect(sut.comparison).to(equal(Comparison.NotEqualsNumber(n)))
                }
                it("gt") {
                    let sut = field.gt(n)
                    expect(sut.field).to(equal(field))
                    expect(sut.comparison).to(equal(Comparison.GreaterThanNumber(n)))
                }
                it("gte") {
                    let sut = field.gte(n)
                    expect(sut.field).to(equal(field))
                    expect(sut.comparison).to(equal(Comparison.GreaterThanOrEqualNumber(n)))
                }
                it("lt") {
                    let sut = field.lt(n)
                    expect(sut.field).to(equal(field))
                    expect(sut.comparison).to(equal(Comparison.LessThanNumber(n)))
                }
                it("lte") {
                    let sut = field.lte(n)
                    expect(sut.field).to(equal(field))
                    expect(sut.comparison).to(equal(Comparison.LessThanOrEqualNumber(n)))
                }
                it("between") {
                    let sut = field.between(1, 3)
                    expect(sut.field).to(equal(field))
                    expect(sut.comparison).to(equal(Comparison.BetweenNumbers(1, 3)))
                }
                it("containedIn") {
                    let sut = field.containedIn([1,2,3])
                    expect(sut.field).to(equal(field))
                    expect(sut.comparison).to(equal(Comparison.InNumbers([1,2,3])))
                }
            }
            context("floats") {
                let n = 3.14
                it("equals") {
                    let sut = field.equals(n)
                    expect(sut.field).to(equal(field))
                    expect(sut.comparison).to(equal(Comparison.EqualsNumber(n)))
                }
                it("not equals") {
                    let sut = field.notEquals(n)
                    expect(sut.field).to(equal(field))
                    expect(sut.comparison).to(equal(Comparison.NotEqualsNumber(n)))
                }
                it("gt") {
                    let sut = field.gt(n)
                    expect(sut.field).to(equal(field))
                    expect(sut.comparison).to(equal(Comparison.GreaterThanNumber(n)))
                }
                it("gte") {
                    let sut = field.gte(n)
                    expect(sut.field).to(equal(field))
                    expect(sut.comparison).to(equal(Comparison.GreaterThanOrEqualNumber(n)))
                }
                it("lt") {
                    let sut = field.lt(n)
                    expect(sut.field).to(equal(field))
                    expect(sut.comparison).to(equal(Comparison.LessThanNumber(n)))
                }
                it("lte") {
                    let sut = field.lte(n)
                    expect(sut.field).to(equal(field))
                    expect(sut.comparison).to(equal(Comparison.LessThanOrEqualNumber(n)))
                }
                it("between") {
                    let sut = field.between(2.72, n)
                    expect(sut.field).to(equal(field))
                    expect(sut.comparison).to(equal(Comparison.BetweenNumbers(2.72, n)))
                }
                it("containedIn") {
                    let sut = field.containedIn([1.5,2.3,3.7])
                    expect(sut.field).to(equal(field))
                    expect(sut.comparison).to(equal(Comparison.InNumbers([1.5,2.3,3.7])))
                }
            }
            context("bools") {
                it("equals to number") {
                    let sut = field.equals(true)
                    expect(sut.field).to(equal(field))
                    expect(sut.comparison).to(equal(Comparison.EqualsNumber(true)))
                }
                it("not equals to number") {
                    let sut = field.notEquals(true)
                    expect(sut.field).to(equal(field))
                    expect(sut.comparison).to(equal(Comparison.NotEqualsNumber(true)))
                }
                it("gt") {
                    let sut = field.gt(true)
                    expect(sut.field).to(equal(field))
                    expect(sut.comparison).to(equal(Comparison.GreaterThanNumber(true)))
                }
                it("gte") {
                    let sut = field.gte(true)
                    expect(sut.field).to(equal(field))
                    expect(sut.comparison).to(equal(Comparison.GreaterThanOrEqualNumber(true)))
                }
                it("lt") {
                    let sut = field.lt(true)
                    expect(sut.field).to(equal(field))
                    expect(sut.comparison).to(equal(Comparison.LessThanNumber(true)))
                }
                it("lte") {
                    let sut = field.lte(true)
                    expect(sut.field).to(equal(field))
                    expect(sut.comparison).to(equal(Comparison.LessThanOrEqualNumber(true)))
                }
                it("between") {
                    let sut = field.between(false, true)
                    expect(sut.field).to(equal(field))
                    expect(sut.comparison).to(equal(Comparison.BetweenNumbers(false, true)))
                }
                it("containedIn") {
                    let sut = field.containedIn([false, true])
                    expect(sut.field).to(equal(field))
                    expect(sut.comparison).to(equal(Comparison.InNumbers([false, true])))
                }
            }
        }
        
        describe("String expressions") {
            let str = "value"
            it("equals") {
                let sut = field.equals(str)
                expect(sut.field).to(equal(field))
                expect(sut.comparison).to(equal(Comparison.EqualsString(str)))
            }
            
            it("not equals") {
                let sut = field.notEquals(str)
                expect(sut.field).to(equal(field))
                expect(sut.comparison).to(equal(Comparison.NotEqualsString(str)))
            }
            
            it("begins with string") {
                let sut = field.beginsWith(str)
                expect(sut.field).to(equal(field))
                expect(sut.comparison).to(equal(Comparison.BeginsWith(str, .None)))
            }
            
            it("begins with string & case insensitivity modifier") {
                let sut = field.beginsWith(str, .CaseInsensitivity)
                expect(sut.field).to(equal(field))
                expect(sut.comparison).to(equal(Comparison.BeginsWith(str, .CaseInsensitivity)))
            }
            
            it("begins with string & case diacritic modifier") {
                let sut = field.beginsWith(str, .DiacriticInsensitivity)
                expect(sut.field).to(equal(field))
                expect(sut.comparison).to(equal(Comparison.BeginsWith(str, .DiacriticInsensitivity)))
            }
            
            it("begins with string & all modifiers") {
                let sut = field.beginsWith(str, .CaseInsensitivity | .DiacriticInsensitivity)
                expect(sut.field).to(equal(field))
                expect(sut.comparison).to(equal(Comparison.BeginsWith(str, .CaseInsensitivity | .DiacriticInsensitivity)))
            }
            
            it("contains string") {
                let sut = field.contains(str)
                expect(sut.field).to(equal(field))
                expect(sut.comparison).to(equal(Comparison.Contains(str, .None)))
            }
            
            it("contains string with case insensitivity modifier") {
                let sut = field.contains(str, .CaseInsensitivity)
                expect(sut.field).to(equal(field))
                expect(sut.comparison).to(equal(Comparison.Contains(str, .CaseInsensitivity)))
            }
            
            it("contains string with case diacritic modifier") {
                let sut = field.contains(str, .DiacriticInsensitivity)
                expect(sut.field).to(equal(field))
                expect(sut.comparison).to(equal(Comparison.Contains(str, .DiacriticInsensitivity)))
            }
            
            it("contains string with all modifiers") {
                let sut = field.contains(str, .CaseInsensitivity | .DiacriticInsensitivity)
                expect(sut.field).to(equal(field))
                expect(sut.comparison).to(equal(Comparison.Contains(str, .CaseInsensitivity | .DiacriticInsensitivity)))
            }
            
            it("ends with string") {
                let sut = field.endsWith(str)
                expect(sut.field).to(equal(field))
                expect(sut.comparison).to(equal(Comparison.EndsWith(str, .None)))
            }
            
            it("ends with string & case insensitivity modifier") {
                let sut = field.endsWith(str, .CaseInsensitivity)
                expect(sut.field).to(equal(field))
                expect(sut.comparison).to(equal(Comparison.EndsWith(str, .CaseInsensitivity)))
            }
            
            it("ends with string & case diacritic modifier") {
                let sut = field.endsWith(str, .DiacriticInsensitivity)
                expect(sut.field).to(equal(field))
                expect(sut.comparison).to(equal(Comparison.EndsWith(str, .DiacriticInsensitivity)))
            }
            
            it("ends with string & all modifiers") {
                let sut = field.endsWith(str, .CaseInsensitivity | .DiacriticInsensitivity)
                expect(sut.field).to(equal(field))
                expect(sut.comparison).to(equal(Comparison.EndsWith(str, .CaseInsensitivity | .DiacriticInsensitivity)))
            }
            
            it("like string") {
                let sut = field.like(str)
                expect(sut.field).to(equal(field))
                expect(sut.comparison).to(equal(Comparison.Like(str, .None)))
            }
            
            it("like string with case insensitivity modifier") {
                let sut = field.like(str, .CaseInsensitivity)
                expect(sut.field).to(equal(field))
                expect(sut.comparison).to(equal(Comparison.Like(str, .CaseInsensitivity)))
            }
            
            it("like string with case diacritic modifier") {
                let sut = field.like(str, .DiacriticInsensitivity)
                expect(sut.field).to(equal(field))
                expect(sut.comparison).to(equal(Comparison.Like(str, .DiacriticInsensitivity)))
            }
            
            it("like string with all modifiers") {
                let sut = field.like(str, .CaseInsensitivity | .DiacriticInsensitivity)
                expect(sut.field).to(equal(field))
                expect(sut.comparison).to(equal(Comparison.Like(str, .CaseInsensitivity | .DiacriticInsensitivity)))
            }
            
            it("matches regexp") {
                let sut = field.matches(str)
                expect(sut.field).to(equal(field))
                expect(sut.comparison).to(equal(Comparison.Matches(str, .None)))
            }
            
            it("matches regexp with case insensitivity modifier") {
                let sut = field.matches(str, .CaseInsensitivity)
                expect(sut.field).to(equal(field))
                expect(sut.comparison).to(equal(Comparison.Matches(str, .CaseInsensitivity)))
            }
            
            it("matches regexp with case diacritic modifier") {
                let sut = field.matches(str, .DiacriticInsensitivity)
                expect(sut.field).to(equal(field))
                expect(sut.comparison).to(equal(Comparison.Matches(str, .DiacriticInsensitivity)))
            }
            
            it("matches regexp with all modifiers") {
                let sut = field.matches(str, .CaseInsensitivity | .DiacriticInsensitivity)
                expect(sut.field).to(equal(field))
                expect(sut.comparison).to(equal(Comparison.Matches(str, .CaseInsensitivity | .DiacriticInsensitivity)))
            }
            
            it("contained in") {
                let sut = field.containedIn(["a","b","c"])
                expect(sut.field).to(equal(field))
                expect(sut.comparison).to(equal(Comparison.InStrings(["a","b","c"])))
            }
        }
    }
}


