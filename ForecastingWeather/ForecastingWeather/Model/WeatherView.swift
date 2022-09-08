//
//  WeatherView.swift
//  ForecastingWeather
//
//  Created by john.adrian.de.claro on 8/19/22.
//

//Weather List View Get Data

import Foundation


struct WeatherView {

    let weather: Weather

    let id = UUID()

    var temperature: Double {

        return weather.temperature
    }

    var city: String {

        return weather.city
    }

    var icon: String {

        return weather.icon
    }

    var sunrise: Date {

        return weather.sunrise
    }

    var sunset: Date {

        return weather.sunset
    }

}
