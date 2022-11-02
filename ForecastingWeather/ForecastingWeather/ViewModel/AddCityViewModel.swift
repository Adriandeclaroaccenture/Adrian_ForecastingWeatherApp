//
//  AddCityViewModel.swift
//  ForecastingWeather
//
//  Created by john.adrian.de.claro on 10/27/22.
//

import Foundation
import CoreData

class AddCityViewModel: ObservableObject {
    @Published var weatherVM: [ForecastViewModel] = []
    var city: String = ""
    
    func getCity(completion: @escaping (ForecastViewModel) -> Void ) {
        WebService().getCurrentCity(city: city.trimmedAndEscaped()) { result  in
            switch result {
            case .success(let myWeather):
                DispatchQueue.main.async {
                    completion(ForecastViewModel(myWeather: myWeather!))
                }
            case .failure(let error):
                print(error)
            }
        }
    }//end getcity
}//End class

//MARK: - Struct Forecast View Model

struct ForecastViewModel: Identifiable, Codable {
    let myWeather: MyWeather
    var id = UUID()
    
    var cityName: String {
        return myWeather.city
    }
//    var temp: String {
//        return getTempByUnit(unit: Store().tempUnit)
//    }
//MARK: - Function TempUnit
//    func getTempByUnit(unit: TemperatureUnit) -> String {
//
//    }
}//end struct
