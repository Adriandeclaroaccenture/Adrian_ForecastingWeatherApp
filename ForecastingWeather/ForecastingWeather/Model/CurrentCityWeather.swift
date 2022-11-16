//
//  CurrentWeather.swift
//  ForecastingWeather
//
//  Created by john.adrian.de.claro on 11/16/22.
//

import Foundation

public struct CurrentCityWeather {
    
    let city: String
    let temperature: String
    let description: String
    let iconName: String
    
    init (response: APIResponse) {
        
        city = response.name
        temperature = "\(Int(response.main.temp))"
        description = response.weather.first?.description ?? ""
        iconName = response.weather.first?.iconName ?? ""
    }
}
