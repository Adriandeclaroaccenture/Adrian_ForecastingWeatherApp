//
//  WebServiceAddConnection.swift
//  ForecastingWeather
//
//  Created by john.adrian.de.claro on 8/19/22.
//

//List View City

import Foundation


enum NetworkError: Error {
    
    case badURL
    case noData
}

class WebService {
    
    func getWeatherByCity(city: String, completion: @escaping ((Result<Weather, NetworkError>) -> Void)) {
        
        guard let weatherURL = Constants.Urls.weatherByCity(city: city) else {
            
            return completion(.failure(.badURL))
        }
        
        URLSession.shared.dataTask(with: weatherURL) { (data, _, error) in
            
            guard let data = data, error == nil else {
                
                return completion(.failure(.noData))
            }
            
            let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)
            if let weatherResponse = weatherResponse{
                completion(.success(weatherResponse.weather))
            }
        } .resume()
    }
}
