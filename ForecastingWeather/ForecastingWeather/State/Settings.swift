//
//  Settings.swift
//  ForecastingWeather
//
//  Created by john.adrian.de.claro on 10/12/22.
//

import Foundation
import SwiftUI

enum TemperatureUnit: String, CaseIterable, Identifiable {
    
    var id: String {
        return rawValue
    }
    case celsius
    case fahrenheit
}

extension TemperatureUnit {
    
    var displayText: String {
        switch self {
        case .celsius:
            return "Celcius"
        case .fahrenheit:
            return "Fahrenheit"
        }
    }
}

enum Sheets: Identifiable {
    
    var id: UUID {
        return UUID()
    }
    case settings
}
