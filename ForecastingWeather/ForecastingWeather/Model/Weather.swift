//
//  Weather.swift
//  ForecastingWeather
//
//  Created by john.adrian.de.claro on 8/17/22.
//
// Current Weather View to fetch Data on the API

import Foundation


struct OpenMapWeatherData: Decodable {
    var weather: [OpenMapWeatherWeather]
    var main: OpenMapWeatherMain
    var sys: Sys
    
   
}

struct OpenMapWeatherWeather: Codable {
    var id: Int?
    var main: String?
    var description: String?
    var icon: String?
}

struct OpenMapWeatherMain: Codable {
    var temp: Float?
    let pressure: Float?
    let humidity: Float?
   
}

struct Sys: Decodable {
    
    let sunset: Double?
    let sunrise: Double?

}




