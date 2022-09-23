//
//  Store.swift
//  ForecastingWeather
//
//  Created by john.adrian.de.claro on 8/19/22.
//

//Storing Saved Cities

import Foundation

class Store: ObservableObject {
    @Published var selectedUnit: TemperatureUnit = .celsius
    @Published var weatherList:[WeatherView] = [WeatherView]()
    
    init() {
        
        selectedUnit = UserDefaults.standard.unit
    }
    
    func addWeather(_ weather: WeatherView) {
        weatherList.append(weather)
    }
}
