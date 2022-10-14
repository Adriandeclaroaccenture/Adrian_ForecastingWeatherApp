//
//  AddLocation.swift
//  ForecastingWeather
//
//  Created by john.adrian.de.claro on 10/12/22.
//

import Foundation

struct AddLocation: Identifiable, Codable {
    var id: String = UUID().uuidString
    var location: String
    
    static var sData:[AddLocation] {
        [
            AddLocation(location: "San Pablo City")
        ]
    }
    
}
