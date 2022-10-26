//
//  Weather.swift
//  ForecastingWeather
//
//  Created by john.adrian.de.claro on 8/17/22.
//
// Current Weather Data

import Foundation
import UIKit
import CoreLocation

//MARK: - List

struct WeatherList: Codable { //,Identifiable
    var date: Int
    var main: Main
    var weather: [Weather]
    var wind: Wind
    var pop: Double
//    var id: UUID {
//        UUID()
//}
        
        //MARK: - JSON Decoder WeatherList
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let dateTimeInterval = try container.decode(Int32.self, forKey: .date)
            date = Int(TimeInterval(dateTimeInterval))
            main = try container.decode(Main.self, forKey: .main)
            weather = try container.decode([Weather].self, forKey: .weather)
            wind = try container.decode(Wind.self, forKey: .wind)
            pop = try container.decode(Double.self, forKey: .pop)
        }//Json Decoder End
//    }
    
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

struct CityName: Codable { //,Identifiable
    var name: String
    var country: String
//    var id: UUID {
//        UUID()
//    }
    //MARK: - JSON Decoder CityName
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        country = try container.decode(String.self, forKey: .country)
    }//Json Decoder End
    
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


//MARK: - Added new Struct for Storing Data and Calling Weather
struct WeatherViews: Identifiable, Codable {
    var weathers: WeatherResponse
    var city = Constants.CityLocation.city
//    var store: Store
    var id = UUID()
//    var getLocation: String
//
//
//    //MARK: - Geo Location / Current Location
//
////        init() {
////            getLocation
////        }
//    func getLocation() {
//            CLGeocoder().geocodeAddressString(city) { (placemarks, error) in
//                if let places = placemarks,
//                   let place = places.first {
//                    self.getWeather(coord: place.location?.coordinate)
//                }
//            }
//        }
//     func getWeather(coord: CLLocationCoordinate2D?) {
//            var urlString = ""
//            if let coord = coord {
//                urlString = forecastAPI.getUrlForecast(latitude: coord.latitude, longitude: coord.longitude)
//            } else {
//                urlString = forecastAPI.getUrlForecast(latitude: 14.0642108, longitude: 121.32333689999996) //San Pablo City
//            }
//            getWeatherStatic(city: city, for: urlString)
//        }
//     func getWeatherStatic(city: String, for urlString: String) {
//            guard let url = URL (string: urlString) else { return }
//            NetworkManager<WeatherResponse>.fetchForecast(for: url) { (result) in
//                switch result {
//                case .success(let response):
//                    DispatchQueue.main.async {
//                        self.weathers = response
//                    }
//                case . failure(let error):
//                    print(error)
//                }
//            }
//        }
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
    func getWeatherIconFor(icon: String) -> String {
        switch icon {
        case "01d":
            return String("sun")
        case "01n":
            return String("moon")
        case "02d":
            return String("cloudSun")
        case "02n":
            return String("cloudMoon")
        case "03d":
            return String("cloud")
        case "03n":
            return String("cloudMoon")
        case "04d":
            return String("cloudMax")
        case "04n":
            return String("cloudMoon")
        case "09d":
            return String("rainy")
        case "09n":
            return String("rainy")
        case "10d":
            return String("rainySun")
        case "10n":
            return String("rainyMoon")
        case "11d":
            return String("thunderstormSun")
        case "11n":
            return String("thunderstormMoon")
        case "13d":
            return String("snowy")
        case "13n":
            return String("snowy-2")
        case "50d":
            return String("tornado")
        case "50n":
            return String("tornado")
        default:
            return String("sun")
        }

    }
}




