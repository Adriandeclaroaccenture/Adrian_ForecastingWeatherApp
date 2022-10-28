//
//  AddCityViewModel.swift
//  ForecastingWeather
//
//  Created by john.adrian.de.claro on 10/27/22.
//

import Foundation
import CoreData

class AddCityViewModel: ObservableObject {
    @Published var weatherVM: [WeatherViews] = []
    var city: String = ""
    
    func getCity(completion: @escaping (WeatherViews) -> Void ) {
//        WeatherResponse()
        
    }//end getcity
}//End class
