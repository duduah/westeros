//
//  Date+Additions.swift
//  Westeros
//
//  Created by Diego Gay Saez on 22/02/2018.
//  Copyright © 2018 Diego Gay Saez. All rights reserved.
//

import Foundation

let currentYear = Date.getYearFrom(date: Date())

enum StringDate {
    case yyyyMMdd(yyyyMMdd: String)
    case yyyyMMd(yyyyMMdd: String)
    case yyyyMdd(yyyyMMdd: String)
    case yyyyMd(yyyyMMdd: String)
    case ddMMyyyy(ddMMyyyy: String)
    case ddMyyyy(dMyyyy: String)
    case dMMyyyy(dMyyyy: String)
    case dMyyyy(dMyyyy: String)
}

enum Months: String {
    case january = "01"
    case february = "02"
    case march = "03"
    case april = "04"
    case may = "05"
    case june = "06"
    case july = "07"
    case august = "08"
    case september = "09"
    case october = "10"
    case november = "11"
    case december = "12"
}

extension Date {

    static func getYearFrom(date: Date) -> Int {
        return Calendar(identifier: .iso8601).component(.year, from: date)
    }

    static func getDateFor(day: String, month: String, year: String) -> Date {
        let myDateFormatter = DateFormatter()
        myDateFormatter.locale = Locale(identifier: Locale.current.identifier)
        myDateFormatter.dateFormat = "yyyy-MM-dd"

        let fechaString = "\(year)-\(month)-\(day)"
        return myDateFormatter.date(from: fechaString)!
    }
}

extension String {

    static func getDateFor(day: String, month: String, year: String) -> Date {
        let myDateFormatter = DateFormatter()
        myDateFormatter.locale = Locale(identifier: Locale.current.identifier)
        myDateFormatter.dateFormat = "yyyy-M-d"
        
        let fechaString = "\(year)-\(month)-\(day)"
        return myDateFormatter.date(from: fechaString)!
    }
    
    
    static func getDateFor(day: Int, month: Months?, year: Int = currentYear) -> Date {
        guard day > 0 && day <= 31 else {
            fatalError("Wrong day number")
        }
        let theMonth = month?.rawValue ?? ""
        guard !theMonth.isEmpty else {
            fatalError("Wrong month number")
        }
        guard year <= currentYear else {
            fatalError("Wrong year. Future years are not allowed")
        }

        let myDateFormatter = DateFormatter()
        myDateFormatter.locale = Locale(identifier: Locale.current.identifier)
        myDateFormatter.dateFormat = "yyyy-M-d"
        
        let fechaString = "\(year)-\(theMonth)-\(day)"
        return myDateFormatter.date(from: fechaString)!
    }
    
//    static func getDateFor(stringDate: StringDate) -> Date {
//        var formatStringDate: String
//        switch stringDate {
//        case .ddMMyyyy(var fecha1):
//            formatStringDate = fecha1.sub
//        case .dMyyyy(ddMMyyyy: <#T##String#>)(let fecha1):
//            formatStringDate = fecha1
//        default:
//            <#code#>
//        }
//    }
}



