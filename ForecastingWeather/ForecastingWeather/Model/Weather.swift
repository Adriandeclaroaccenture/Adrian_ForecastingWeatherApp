//
//  Weather.swift
//  ForecastingWeather
//
//  Created by john.adrian.de.claro on 8/17/22.
//
// Current Weather View to fetch Data on the API

import Foundation


struct OpenMapWeatherData: Decodable {
    
    let name: String?
    var weather: [OpenMapWeatherWeather]
    var main: OpenMapWeatherMain

}

struct OpenMapWeatherWeather: Codable {
    var id: Int?
    var main: String?
    var description: String?
    var icon: String?
}

struct OpenMapWeatherMain: Codable {
    let city: String?
    var temp: Float?
    let icon: String?
    let pressure: Float?
    let humidity: Float?
    let temp_min: Float?
    let temp_max: Float?
   
}




