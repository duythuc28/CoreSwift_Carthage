//
//  Date.swift
//  UbiqApp
//
//  Created by admin on 5/16/17.
//  Copyright © 2017 ubiq. All rights reserved.
//

import Foundation

extension Date {
    /// Return month in integer format (i.e 1-12)
    var month: Int {
        return Calendar.current.component(.month, from: self)
    }
    
    var year: Int {
        return Calendar.current.component(.year, from: self)
    }
}

extension Calendar {
    func firstDateOfMonth(_ month: Int, year: Int) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM yyyy"
        guard let parsedDate = formatter.date(from: "\(month) \(year)") else {
            return nil
        }
        var components = dateComponents([.day, .month, .year, .hour, .minute, .second], from: parsedDate)
        components.day = 1
        components.hour = 0
        components.minute = 0
        components.second = 0
        return date(from: components)
    }
    
    func lastDateOfMonth(_ month: Int, year: Int) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM yyyy"
        guard let parsedDate = formatter.date(from: "\(month) \(year)"),
              let dayRange = range(of: .day, in: .month, for: parsedDate) else
        {
            return nil
        }
        var components = dateComponents([.day, .month, .year, .hour, .minute, .second], from: parsedDate)
        components.day = dayRange.upperBound - 1
        components.hour = 23
        components.minute = 59
        components.second = 59
        return date(from: components)
    }
    
    func firstDateOfCurrentMonth() -> Date {
        let currentDate = Date()
        return firstDateOfMonth(currentDate.month, year: currentDate.year)!
    }
    
    func lastDateOfCurrentMonth() -> Date {
        let currentDate = Date()
        return lastDateOfMonth(currentDate.month, year: currentDate.year)!
    }
    
    func firstMomentOfDate(_ date: Date) -> Date {
        var components = dateComponents([.day, .month, .year, .hour, .minute, .second], from: date)
        components.hour = 0
        components.minute = 0
        components.second = 0
        return self.date(from: components)!
    }
    
    func lastMomentOfDate(_ date: Date) -> Date {
        var components = dateComponents([.day, .month, .year, .hour, .minute, .second], from: date)
        components.hour = 23
        components.minute = 59
        components.second = 59
        return self.date(from: components)!
    }
}
