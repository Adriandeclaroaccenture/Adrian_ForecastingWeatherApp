//
//  Store.swift
//  ForecastingWeather
//
//  Created by john.adrian.de.claro on 8/19/22.
//

//Storing Saved Cities

import Foundation

class Store: ObservableObject {
    
    @Published var tempUnit: TemperatureUnit = .celsius
    @Published var weatherVM: [WeatherViews] = []
    @Published var locationList: [WeatherViews] = []
//    @Published var weatherVM: WeatherViews?
//    @Published var weatherVM: [WeatherViewModel] = [WeatherViewModel]()
    init() {
        tempUnit = UserDefaults.standard.unit
        print(FileManager.docDirURL.path)
        if FileManager().docExist(named: filename) {
            
        }
        
    }
    
    func addWeather(_ weather: WeatherViews) {
        weatherVM.append(weather)
        saveWeather()
    }
    func updateWeather(_ weather: WeatherViews) {
        guard let index = weatherVM.firstIndex(where: {$0.id == weather.id}) else { return }
        weatherVM[index] = weather
        saveWeather()
    }
    func deleteWeather(at weather: IndexSet) {
        weatherVM.remove(atOffsets: weather)
        saveWeather()
    }
    func loadWeather() {
        FileManager().readDocument(docName: filename) { (result) in
            switch result {
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    weatherVM = try decoder.decode([WeatherViews].self, from: data)
                } catch {
                    print(error.localizedDescription)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    func saveWeather() {
        print("Save City Weather")
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(weatherVM)
            let jsonString = String(decoding: data, as: UTF8.self)
            FileManager().saveDocument(contents: jsonString, docName: filename) { (error) in
                if let error = error {
                    print(error.localizedDescription)
                }
            }
        } catch {
            print(error.localizedDescription)
        }
    }


}
