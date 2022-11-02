//
//  WeatherViewModel.swift
//  ForecastingWeather
//
//  Created by john.adrian.de.claro on 8/17/22.
//
// Fetch Data from the API to Main View

import Foundation
import CoreLocation
import SwiftUI

class WeatherViewModel: ObservableObject {
//struct WeatherViewModel: Identifiable, (Optional: <ObservableObject()>) {
//MARK: - Properties
    var id = UUID()
    @EnvironmentObject var store: Store
//    @State private var weather = WeatherResponse.empty()
//    @State private var city = Constants.CityLocation.city {
    @Published var weatherVM: WeatherViews?
    @Published var weather = WeatherResponse.empty()
    @Published var city = Constants.CityLocation.currentCity {
        didSet {
            getLocation()
        }
    }
//MARK: - Geo Location / Current Location

    init() {
        getLocation()
    }
    func getLocation() {
        CLGeocoder().geocodeAddressString(city) { (placemarks, error) in
            if let places = placemarks,
               let place = places.first {
                self.getWeather(coord: place.location?.coordinate)
            }
        }
    }
    func getWeather(coord: CLLocationCoordinate2D?) {
        var urlString = ""
        if let coord = coord {
            urlString = forecastAPI.getUrlForecast(latitude: coord.latitude, longitude: coord.longitude)
        } else {
            urlString = forecastAPI.getUrlForecast(latitude: 14.0642108, longitude: 121.32333689999996) //San Pablo City
        }
        getWeatherStatic(city: city, for: urlString)
    }
//    func getWeatherStatic(city: String, for urlString: String) {
//            guard let url = URL (string: urlString) else { return }
//            NetworkManager<WeatherResponse>.fetchForecast(for: url) { (result) in
//                switch result {
//                case .success(let response):
//                    DispatchQueue.main.async {
//                        self.weatherVM?.weathers = response
//                        guard let saveWeather = self.weatherVM else { return }
//                        self.store.addWeather(saveWeather)
//                        self.store.loadWeather()
//                        self.weather = response
//                        // Clear Persistence after before saving
//                        // Save response to Persistence
//                    }
//                case . failure(let error):
//                    print(error)
//                }
//            }
//        }
    func getWeatherStatic(city: String, for urlString: String) {
        guard let url = URL (string: urlString) else { return }
        NetworkManager<WeatherResponse>.fetchForecast(for: url) { (result) in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.weather = response
                }
            case . failure(let error):
                print(error)
            }
        }
    }
//}// Class WeatherViewModel
//MARK: - Current Weather
//struct WeatherViewsModel: Codable {
    
//    var weather: WeatherResponse
    
    var currentLocation: String {
        return weather.city.name
//        return weatherVM.city.name
    }
    var currentCountry: String {
        return weather.city.country
//        return weatherVM.city.country
    }
    var currentDate: String {
        return DateTime.defaultDateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval((weather.list.first?.date)!)))
    }
    var weatherIcons: String? {
        return weatherDayIcons.first
    }
    var currentTemp: String? {
//        return getTempByUnit(unit: .celsius)[0]
        return getTempByUnit(unit: store.tempUnit)[0]
    }
    var currentCondition: String? {
        return weeklyConditions.first
    }
    var currentHumidity: Int {
        return weather.list.first?.main.humidity ?? 0
    }
    var currentWind: String {
        return roundedOf(weather.list.first?.wind.speed ?? 0.0)
    }
    var currentRain: String {
        return toString(100*(weather.list.first?.pop ?? 0.0))
    }
    
//MARK: - Weekly
    var weeklyDays: [String] {
        return [
            DateTime.dayFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(weather.list[0].date))),
            DateTime.dayFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(weather.list[7].date))),
            DateTime.dayFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(weather.list[15].date))),
            DateTime.dayFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(weather.list[23].date))),
            DateTime.dayFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(weather.list[31].date))),
            DateTime.dayFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(weather.list[39].date))),
            
        ]
    }
    
//MARK: - Weather Icons
    var weatherDayIcons: [String] {
        return [
            weather.list[0].weather.first?.icon ?? "",
            weather.list[7].weather.first?.icon ?? "",
            weather.list[15].weather.first?.icon ?? "",
            weather.list[23].weather.first?.icon ?? "",
            weather.list[31].weather.first?.icon ?? "",
            weather.list[39].weather.first?.icon ?? "",
            
        ]
        
    }
    
//MARK: - Dates

    var dailyDates:[String] {
        return [
            DateTime.dateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(weather.list[0].date))),
            DateTime.dateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(weather.list[7].date))),
            DateTime.dateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(weather.list[15].date))),
            DateTime.dateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(weather.list[23].date))),
            DateTime.dateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(weather.list[31].date))),
            DateTime.dateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(weather.list[39].date))),
        ]
        
    }
    
//MARK: - Temperature
    func getTempByUnit(unit: TemperatureUnit) -> [String] {
        switch unit {
        case .celsius:
            return [
                roundedOf(weather.list[0].main.temp),
                roundedOf(weather.list[7].main.temp),
                roundedOf(weather.list[15].main.temp),
                roundedOf(weather.list[23].main.temp),
                roundedOf(weather.list[31].main.temp),
                roundedOf(weather.list[39].main.temp),
            ]
        case .fahrenheit:
            return [
                roundedOf(1.8 * (weather.list[0].main.temp) + 32),
                roundedOf(1.8 * (weather.list[7].main.temp) + 32),
                roundedOf(1.8 * (weather.list[15].main.temp) + 32),
                roundedOf(1.8 * (weather.list[23].main.temp) + 32),
                roundedOf(1.8 * (weather.list[31].main.temp) + 32),
                roundedOf(1.8 * (weather.list[39].main.temp) + 32),
            ]
        }
    }
    
//MARK: - Weekly Conditions
    var weeklyConditions: [String] {
        return [
            weather.list[0].weather.first?.description ?? "Sunny",
            weather.list[7].weather.first?.description ?? "Sunny",
            weather.list[15].weather.first?.description ?? "Sunny",
            weather.list[23].weather.first?.description ?? "Sunny",
            weather.list[31].weather.first?.description ?? "Sunny",
            weather.list[39].weather.first?.description ?? "Sunny",
        ]
        
    }
    
//MARK: - Functions
    func toString(_ double: Double) -> String {
        return String(format: "%1.f", double)
    }
    func roundedOf(_ roundOf: Double) -> String {
        return String(format: "%1.f", roundOf)
    }
    func getWeatherIconFor(icon: String) -> Image {
        switch icon {
        case "01d":
            return Image("sun")
        case "01n":
            return Image("moon")
        case "02d":
            return Image("cloudSun")
        case "02n":
            return Image("cloudMoon")
        case "03d":
            return Image("cloud")
        case "03n":
            return Image("cloudMoon")
        case "04d":
            return Image("cloudMax")
        case "04n":
            return Image("cloudMoon")
        case "09d":
            return Image("rainy")
        case "09n":
            return Image("rainy")
        case "10d":
            return Image("rainySun")
        case "10n":
            return Image("rainyMoon")
        case "11d":
            return Image("thunderstormSun")
        case "11n":
            return Image("thunderstormMoon")
        case "13d":
            return Image("snowy")
        case "13n":
            return Image("snowy-2")
        case "50d":
            return Image("tornado")
        case "50n":
            return Image("tornado")
        default:
            return Image("sun")
        }
//    }//End Struct
    }//End Class
}//End
