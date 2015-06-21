//
//  Person.swift
//  Preacher
//
//  Created by Albert Hernández López on 2/6/15.
//  Copyright (c) 2015 Albert Hernández López. All rights reserved.
//

import Foundation

class Person: NSObject, Equatable {
    let firstName: String
    let lastName: String
    let age: Int
    let birthday: NSDate
    
    init(firstName: String, lastName: String, age: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age

        // this is done just to avoid rounding problems when checking predicate format in the tests
        let calendar = NSCalendar.currentCalendar()
        var todayComps = calendar.components(.CalendarUnitYear | .CalendarUnitMonth | .CalendarUnitDay, fromDate: NSDate())
        let year = todayComps.year - age
        let month = todayComps.month
        let day = todayComps.day
        self.birthday = calendar.dateWithEra(1, year: year, month: month, day: day, hour: 0, minute: 0, second: 1, nanosecond: 123123)!
    }
    
    override var description: String {
        return "\(firstName) \(lastName)"
    }
}

func ==(lhs: Person, rhs: Person) -> Bool {
    return lhs.firstName == rhs.firstName && lhs.lastName == rhs.lastName && lhs.age == rhs.age && rhs.birthday == lhs.birthday
}
