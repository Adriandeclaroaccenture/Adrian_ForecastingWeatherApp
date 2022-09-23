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
//    let icon: [WeatherIcon]
    var main: OpenMapWeatherMain
//    var sys: Sys
    
//    private enum CodingKeys: String, CodingKey {
//
//        case name
//        case weather = "main"
//        case icon = "weather"
//        case sys = "sys"
//
//    }
//    enum WeatherKeys: String, CodingKey {
//
//            case temperature = "temp"
//        }
//
////        init(from decoder: Decoder) throws {
////
////            let container = try decoder.container(keyedBy: CodingKeys.self)
////            name = try container.decode(String.self, forKey: .name)
////            icon = try container.decode([WeatherIcon].self, forKey: .icon)
////            sys = try container.decode(Sys.self, forKey: .sys)
////
////            let weatherContainer = try container.nestedContainer(keyedBy: WeatherKeys.self, forKey: .weather)
////            let temperature = try weatherContainer.decode(Double.self, forKey: .temperature)
//////            weather = OpenMapWeatherMain(city: name, temp: temperature, icon: icon.first!.icon, sunrise: sys.sunrise, sunset: sys.sunset)
////
////        }
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
//    let sunrise: Double?
//    let sunset: Double?
   
}

//struct Sys: Decodable {
//
//    let sunset: Double?
//    let sunrise: Double?
//
//}

//struct WeatherIcon: Decodable {
//
//    let main: String
//    let description: String
//    let icon: String
//}


