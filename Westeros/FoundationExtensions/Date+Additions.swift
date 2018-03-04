//
//  Date+Additions.swift
//  Westeros
//
//  Created by Diego Gay Saez on 22/02/2018.
//  Copyright © 2018 Diego Gay Saez. All rights reserved.
//

import Foundation

let currentYear = Date.getYearFrom(date: Date())

/**
 Dates can be expressed in different formats:
 
 - yyyy-MM-dd
 - dd-MM-yyyy
 
 */
enum DateFormats {
    case yyyyMd(year: Int, month: Int, day: Int)
    case dMyyyy(day: Int, month: Int, year: Int)
}

// MARK: - Date conversion
extension Date {

    static func getYearFrom(date: Date) -> Int {
        return Calendar(identifier: .iso8601).component(.year, from: date)
    }

    /**
     Cast the String param to Date.
     
     Usage:
     
            let date1 = Date.getDateFor(yyyyMd: "2004-4-27")
     
     - Parameter date: String that must fit to **yyyy-M-d** format.
     
     - Return: a equivalent Date for date param.
     */
    static func getDateFor(yyyyMd date: String) -> Date {
        let myDateFormatter = DateFormatter()
        myDateFormatter.locale = Locale(identifier: Locale.current.identifier)
        myDateFormatter.dateFormat = "yyyy-MM-dd"
        
        return myDateFormatter.date(from: date)!
    }
    
    /**
     Cast the enum DateFormats param to Date.
     
     Usage:
     
             let date1 = Date.getDateFor(date: .yyyyMd(year: 2011, month: 4, day: 17))
             let date2 = Date.getDateFor(date: .dMyyyy(day: 17, month: 4, year: 2011))

     - Parameter date: String that must fit to **yyyy-M-d** format.
     
     - Return: a equivalent Date for date param.
     */
    static func getDateFor(date: DateFormats) -> Date {
        let myDateFormatter = DateFormatter()
        myDateFormatter.locale = Locale(identifier: Locale.current.identifier)
        myDateFormatter.dateFormat = "yyyy-MM-dd"
        
        switch date {
        case let .dMyyyy(day: dayNumber, month: monthNumber, year: yearNumber):
            return myDateFormatter.date(from: "\(yearNumber)-\(monthNumber)-\(dayNumber)")!
        case let .yyyyMd(year: yearNumber, month: monthNumber, day: dayNumber):
            return myDateFormatter.date(from: "\(yearNumber)-\(monthNumber)-\(dayNumber)")!
        }
    }
}


