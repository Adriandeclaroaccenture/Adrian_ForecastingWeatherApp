//
//  Store.swift
//  ForecastingWeather
//
//  Created by john.adrian.de.claro on 8/19/22.
//

//Storing Saved Cities

import Foundation

class Store: ObservableObject {
    
    @Published var tempUnit: TemperatureUnit = .celsius
    @Published var weatherVM: [WeatherViewModel] = [WeatherViewModel]()
    
    init() {
        tempUnit = UserDefaults.standard.unit
    }
    
    func addWeather(_ weather: WeatherViewModel){
        weatherVM.append(weather)
    }
    
}
