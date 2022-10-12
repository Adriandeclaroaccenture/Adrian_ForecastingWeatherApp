//
//  API.swift
//  ForecastingWeather
//
//  Created by john.adrian.de.claro on 10/12/22.
//

import Foundation

enum NetworkError: Error {
    case invalidResponse
    case invalidData
    case decodingError(err: String)
    case error(err: String)
}
//MARK: - API
struct forecastAPI {
    
    static func getUrlForecast(latitude: Double, longitude: Double) -> String {
        
        return "https://api.openweathermap.org/data/2.5/forecast?lat=\(latitude)&lon=\(longitude)&appid=96d28c208664698f6c02c4be0dba3e8f&units=metric"
    }
}
//MARK: - Network Call
final class NetworkManager<T: Codable> {
    static func fetchForecast(for url: URL, completion: @escaping(Result<T, NetworkError>) -> Void) {
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                completion (.failure(.invalidData))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                
                completion (.failure(.invalidResponse))
                return
            }
            
            guard error == nil else {
                print(String(describing: error))
                if let error = error?.localizedDescription {
                    completion (.failure(.error(err: error)))
                }
                return
            }
//MARK: - JSON Decoder
            do {
                
                let json = try JSONDecoder().decode(T.self, from: data)
                completion (.success(json))
                
            } catch let err {
                print(String(describing: err))
                completion(.failure(.decodingError(err: err.localizedDescription)))
            }

        }.resume()
    }
    
    
    
}

