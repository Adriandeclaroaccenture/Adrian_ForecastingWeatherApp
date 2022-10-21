//
//  Weather.swift
//  ForecastingWeather
//
//  Created by john.adrian.de.claro on 8/17/22.
//
// Current Weather Data

import Foundation
import UIKit

//MARK: - List

struct WeatherList: Codable, Identifiable {
    var date: Int
    var main: Main
    var weather: [Weather]
    var wind: Wind
    var pop: Double
    var id: UUID {
        UUID()
    }
    
    enum CodingKeys: String, CodingKey {
        case date = "dt"
        case main = "main"
        case weather = "weather"
        case wind = "wind"
        case pop = "pop"
  
}
    init() {
        date = 0
        main = Main(temp: 0.0, humidity: 0)
        weather = []
        wind = Wind(speed: 0.0)
        pop = 0
    }
}

struct Main: Codable {
    var temp: Double
    var humidity: Int
    
}

struct Weather: Codable, Identifiable {
    var main: String
    var description: String
    var icon: String
    var id: Int {
        0
    }
}

struct Wind: Codable {
    var speed: Double
}

//MARK: - City

struct CityName: Codable, Identifiable {
    var name: String
    var country: String
    var id: UUID {
        UUID()
    }
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case country = "country"
    }
    
    init() {
        name = ""
        country = ""
    }
}

//MARK: - Response

struct WeatherResponse: Codable {
    var city: CityName
    var list: [WeatherList]
    
    static func empty() -> WeatherResponse {
        WeatherResponse(city: CityName(), list: [WeatherList](repeating: WeatherList(), count: 40))
    }
}

struct WeatherViews: Decodable {
    var weathers: WeatherResponse
//    var store: Store
    var id: UUID {
        UUID()
    }
    //MARK: - Current Weather

        var currentLocation: String {
            return weathers.city.name
        }
        var currentCountry: String {
            return weathers.city.country
        }
        var currentDate: String {
            return DateTime.defaultDateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval((weathers.list.first?.date)!)))
        }
        var weatherIcons: String? {
            return weatherDayIcons.first
        }
        var currentTemp: String? {
            return getTempByUnit(unit: .celsius)[0]
        }
        var currentCondition: String? {
            return weeklyConditions.first
        }
        var currentHumidity: Int {
            return weathers.list.first?.main.humidity ?? 0
        }
        var currentWind: String {
            return roundedOf(weathers.list.first?.wind.speed ?? 0.0)
        }
        var currentRain: String {
            return toString(100*(weathers.list.first?.pop ?? 0.0))
        } 
    //MARK: - Weekly
        var weeklyDays: [String] {
            return [
                DateTime.dayFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(weathers.list[0].date))),
                DateTime.dayFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(weathers.list[7].date))),
                DateTime.dayFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(weathers.list[15].date))),
                DateTime.dayFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(weathers.list[23].date))),
                DateTime.dayFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(weathers.list[31].date))),
                DateTime.dayFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(weathers.list[39].date))),
                
            ]
        }
        
    //MARK: - Weather Icons
        var weatherDayIcons: [String] {
            return [
                weathers.list[0].weather.first?.icon ?? "",
                weathers.list[7].weather.first?.icon ?? "",
                weathers.list[15].weather.first?.icon ?? "",
                weathers.list[23].weather.first?.icon ?? "",
                weathers.list[31].weather.first?.icon ?? "",
                weathers.list[39].weather.first?.icon ?? "",
                
            ]
            
        }
        
    //MARK: - Dates

        var dailyDates:[String] {
            return [
                DateTime.dateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(weathers.list[0].date))),
                DateTime.dateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(weathers.list[7].date))),
                DateTime.dateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(weathers.list[15].date))),
                DateTime.dateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(weathers.list[23].date))),
                DateTime.dateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(weathers.list[31].date))),
                DateTime.dateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(weathers.list[39].date))),
            ]
            
        }
        
    //MARK: - Temperature
        func getTempByUnit(unit: TemperatureUnit) -> [String] {
            switch unit {
            case .celsius:
                return [
                    roundedOf(weathers.list[0].main.temp),
                    roundedOf(weathers.list[7].main.temp),
                    roundedOf(weathers.list[15].main.temp),
                    roundedOf(weathers.list[23].main.temp),
                    roundedOf(weathers.list[31].main.temp),
                    roundedOf(weathers.list[39].main.temp),
                ]
            case .fahrenheit:
                return [
                    roundedOf(1.8 * (weathers.list[0].main.temp) + 32),
                    roundedOf(1.8 * (weathers.list[7].main.temp) + 32),
                    roundedOf(1.8 * (weathers.list[15].main.temp) + 32),
                    roundedOf(1.8 * (weathers.list[23].main.temp) + 32),
                    roundedOf(1.8 * (weathers.list[31].main.temp) + 32),
                    roundedOf(1.8 * (weathers.list[39].main.temp) + 32),
                ]
            }
        }
        
    //MARK: - Weekly Conditions
        var weeklyConditions: [String] {
            return [
                weathers.list[0].weather.first?.description ?? "Sunny",
                weathers.list[7].weather.first?.description ?? "Sunny",
                weathers.list[15].weather.first?.description ?? "Sunny",
                weathers.list[23].weather.first?.description ?? "Sunny",
                weathers.list[31].weather.first?.description ?? "Sunny",
                weathers.list[39].weather.first?.description ?? "Sunny",
            ]
            
        }
        
    //MARK: - Functions
        func toString(_ double: Double) -> String {
            return String(format: "%1.f", double)
        }
        func roundedOf(_ roundOf: Double) -> String {
            return String(format: "%1.f", roundOf)
        }
       
        
}




