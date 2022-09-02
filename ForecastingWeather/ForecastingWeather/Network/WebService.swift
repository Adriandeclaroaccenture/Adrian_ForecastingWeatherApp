//
//  WebService.swift
//  ForecastingWeather
//
//  Created by john.adrian.de.claro on 8/17/22.
//

//Main Display Weather Fetch

import Foundation
import SwiftUI


public enum WebServiceControllerError: Error {
    
    case invalidUrl(String)
    case invalidPayload(URL)
    case forwarded(Error)
}

public struct WeatherService {
    private let apiKey: String = "96d28c208664698f6c02c4be0dba3e8f"
    private let baseUrl: String = "https://api.openweathermap.org/data/2.5/weather"
    private let weeklybaseUrl: String = "https://api.openweathermap.org/data/2.5/forecast"
    
    func fetchWeatherData(forCity: String, callback: @escaping ((temp: Float?, pressure: Float?, humidity: Float?, weatherDescription: String)?, WebServiceControllerError?) -> Void)
    
 //   func fetchWeatherData(forCity: String, callback: @escaping ((sunrise:Date?, sunset: Date?, weatherDescription: String)?, WebServiceControllerError?) -> Void)
    {
        
        let possibleUrl = "\(baseUrl)?q=\(forCity)&appid=\(apiKey)&units=metric"
        
        if let url = URL(string: possibleUrl) {
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard error == nil else {
                    callback(nil, WebServiceControllerError.forwarded(error!))
                    return
                }
                
                if let dataFromWeather = data, let _ = response  {
                    // MARK: - JSON Parsing
                    let decoder = JSONDecoder()
                    
                    do {
                        let weatherData = try decoder.decode(OpenMapWeatherData.self, from: dataFromWeather)
                        print(weatherData)
                        guard let weatherDescription = weatherData.weather.first?.description,
                              let temperature = weatherData.main.temp ,
                              let humidity = weatherData.main.humidity ,
                              let pressure = weatherData.main.pressure else {
                                  print("DATA NOT VALID")
                                  callback(nil, WebServiceControllerError.invalidPayload(url))
                                  return
                              }
                        callback((temp: temperature, pressure: pressure, humidity: humidity, weatherDescription: weatherDescription), nil)
                    }
                    catch let error {
                        callback(nil, WebServiceControllerError.forwarded(error))
                    }
                } else {
                    callback(nil, WebServiceControllerError.invalidPayload(url))
                }
            }.resume()
        } else {
            callback(nil, WebServiceControllerError.invalidUrl(possibleUrl))
        }
    }
}
