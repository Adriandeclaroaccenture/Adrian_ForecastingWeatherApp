//
//  WeatherViewModel.swift
//  ForecastingWeather
//
//  Created by john.adrian.de.claro on 8/17/22.
//
// Fetch Data from the API to Main View

import Foundation


class WeatherViewModel: ObservableObject {
    private let weatherService: WeatherService = WeatherService()
    @Published var temperature: Float?
    @Published var pressure: Float?
    @Published var humidity: Float?
//    @Published var sunrise: Double?
//    @Published var sunset: Double?
    @Published var weatherDescription: String?
    @Published var backgroundImageUrl: String = ""
    
    
    func fetchData(for city: String?) {
        if let city = city {
            weatherService.fetchWeatherData(forCity: city) { weather, error in
                guard error == nil else {
                    print(error as Any)
                    return
                }
                if let retrievedWeather = weather {
                    DispatchQueue.main.async {
                        self.temperature = retrievedWeather.temp
                        self.humidity = retrievedWeather.humidity
                        self.pressure = retrievedWeather.pressure
//                        self.sunrise = retrievedWeather.sunrise
//                        self.sunset = retrievedWeather.sunset
                        self.weatherDescription = retrievedWeather.weatherDescription
                    }
                }
            }
        }
    }
}


