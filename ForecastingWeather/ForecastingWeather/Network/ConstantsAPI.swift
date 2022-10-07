//
//  ConstantsAPI.swift
//  ForecastingWeather
//
//  Created by john.adrian.de.claro on 8/19/22.
//

//Weather List View

import Foundation

struct Constants {
    
    struct Urls {
        
       static func weatherByCity(city: String) -> URL? {
            
            return URL(string: "https://api.openweathermap.org/data/2.5/forecast?&q=\(city)&appid=96d28c208664698f6c02c4be0dba3e8f&units=metric")
//            &units=metric
        }
        
        static func weatherURLAsStringByIcon(icon: String) -> String {
            
            return "https://api.openweathermap.org/img/w/\(icon).png"
        }
    }
}
