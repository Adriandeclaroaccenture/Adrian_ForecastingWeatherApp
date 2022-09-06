//
//  SettingsViewModel.swift
//  ForecastingWeather
//
//  Created by john.adrian.de.claro on 9/6/22.
//

import Foundation


enum Unit: String, CaseIterable {
    
    case celcius = "metric"
    case fahrenheit = "imperial"
}

extension Unit {
    
    var displayName: String {
        
        get {
            switch(self) {
                
            case .celcius:
                return "Celcius"
            case .fahrenheit:
                return "Fahrenheit"
            }
        }
    }
}

class SettingsViewModel {
    
    let units = Unit.allCases
    var selectedUnit: Unit {
        get {
            let userDefaults = UserDefaults.standard
            var unitValue = ""
            if let value = userDefaults.value(forKey: "unit") as? String {
                unitValue = value
            }
            return Unit(rawValue: unitValue)!
        }
        set {
            let userDefault = UserDefaults.standard
            userDefault.set(newValue.rawValue, forKey: "unit")
        }
    }
    
}
