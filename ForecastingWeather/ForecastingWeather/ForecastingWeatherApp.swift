//
//  ForecastingWeatherApp.swift
//  ForecastingWeather
//
//  Created by john.adrian.de.claro on 8/17/22.
//

import SwiftUI

@main
struct ForecastingWeatherApp: App {
    var body: some Scene {
        WindowGroup {
            let weatherService = WeatherService()
            let currentCityVM = CurrentCityViewModel(weatherService: WeatherService())
            LaunchScreenSplashView()
            //For Observable Object
               .environmentObject(Store())
        }
    }
}
