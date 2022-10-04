//
//  DateExtension.swift
//  ForecastingWeather
//
//  Created by john.adrian.de.claro on 8/19/22.
//

//Date Format for List View

import Foundation


extension Date {
    func formatAsString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMMM d"
        return formatter.string(from: self)
    }
    
    func formatAsString1() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "E"
        return formatter.string(from: self)
    }
    
    func formatAsString2() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE, MMM d"
        return formatter.string(from: self)
    }
//    func formatAsString() -> String {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "hh:mm a"
//        return formatter.string(from: self)
//    }

}
