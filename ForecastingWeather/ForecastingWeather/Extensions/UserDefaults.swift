//
//  UserDefaults.swift
//  ForecastingWeather
//
//  Created by john.adrian.de.claro on 9/12/22.
//

import Foundation


extension UserDefaults {
    
    var unit: TemperatureUnit {
        
        guard let value = self.value(forKey: "unit") as? String else {
            
            return .celsius
        }
        
        return TemperatureUnit(rawValue: value) ?? .celsius
        
    }
}
