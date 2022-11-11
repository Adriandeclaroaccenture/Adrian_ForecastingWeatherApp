//
//  AddCityForecast.swift
//  ForecastingWeather
//
//  Created by john.adrian.de.claro on 10/27/22.
//

import Foundation

//MARK: - Struct Forecast
//struct ForecastList: Codable {
//
//    let list: [WeatherList]
//}


//MARK: - Init Cities
    struct MyWeather: Codable {
        let city: String
        let temperature0: Double
        let id: Int
        let speed: Double
        let icon0: String
        let description0: String
//        let date0: String

        let temperature1: Double
        let icon1: String
        let description1: String
//        let date1: String

        let temperature2: Double
        let icon2: String
        let description2: String
//        let date2: String
        
        let temperature3: Double
        let icon3: String
        let description3: String
//        let date3: String

        let temperature4: Double
        let icon4: String
        let description4: String
//        let date4: String


    init(forecast: WeatherResponse ) {
        city = forecast.city.name
        temperature0 = forecast.list[0].main.temp
        id = forecast.list[0].weather[0].id
        speed = forecast.list[0].wind.speed
        icon0 = forecast.list[0].weather[0].icon
        description0 = forecast.list[0].weather[0].description
//        date0 = forecast.list[0].date


        temperature1 = forecast.list[8].main.temp
        icon1 = forecast.list[8].weather[0].icon
        description1 = forecast.list[8].weather[0].description
//        date1 = forecast.list[8].date

        temperature2 = forecast.list[16].main.temp
        icon2 = forecast.list[16].weather[0].icon
        description2 = forecast.list[16].weather[0].description
//        date2 = forecast.list[16].date

        temperature3 = forecast.list[24].main.temp
        icon3 = forecast.list[24].weather[0].icon
        description3 = forecast.list[24].weather[0].description
//        date3 = forecast.list[24].date

        temperature4 = forecast.list[32].main.temp
        icon4 = forecast.list[32].weather[0].icon
        description4 = forecast.list[32].weather[0].description
//        date4 = forecast.list[32].date
    }
}



