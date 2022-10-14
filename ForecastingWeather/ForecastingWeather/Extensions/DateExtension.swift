//
//  DateExtension.swift
//  ForecastingWeather
//
//  Created by john.adrian.de.claro on 8/19/22.
//

//Date Format for List View

import Foundation

class DateTime {
    
    static let defaultDateFormatter: DateFormatter = {
        
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter
    }()
    
    static let dayFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE"
        return formatter
    }()
    
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d"
        return formatter
    }()
    
    static let timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh a"
        return formatter
    }()
    
}

