//
//  AddWeather.swift
//  ForecastingWeather
//
//  Created by john.adrian.de.claro on 8/19/22.
//
// Add Weather to List View

import Foundation


class AddWeatherViewModel: ObservableObject {

    var city: String = ""
    func save(completion: @escaping(WeatherView) -> Void) {

        WebService().getWeatherByCity(city: city) { (result) in

            switch result {

            case .success(let weather):
                DispatchQueue.main.async {
                    completion(WeatherView(weather: weather))
                }
//            case .success(let weather, let myWeather):
//                DispatchQueue.main.async {
//                    completion(WeatherView(weather: weather, myWeather: myWeather))
//                }

            case .failure(let error):
                print(error)

            }
        }
    }
}

