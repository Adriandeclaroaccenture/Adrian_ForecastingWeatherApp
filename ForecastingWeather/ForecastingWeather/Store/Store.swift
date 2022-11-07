//
//  Store.swift
//  ForecastingWeather
//
//  Created by john.adrian.de.claro on 11/7/22.
//

import Foundation

class Store: ObservableObject {
    
    @Published var tempUnit: TemperatureUnit = .celsius
    @Published var forecastList: [ForecastViewModel] = []

    init() {
        tempUnit = UserDefaults.standard.unit
        print(FileManager.docDirURL.path)
        if FileManager().docExist(named: filename) {
            loadWeather()
        }
        
    }
    
    func addWeather(_ weather: ForecastViewModel) {
        forecastList.append(weather)
        saveWeather()
    }
    func updateWeather(_ weather: ForecastViewModel) {
        guard let index = forecastList.firstIndex(where: {$0.id == weather.id}) else { return }
        forecastList[index] = weather
        saveWeather()
    }
    func deleteWeather(at weather: IndexSet) {
        forecastList.remove(atOffsets: weather)
        saveWeather()
    }
    func loadWeather() {
        FileManager().readDocument(docName: filename) { (result) in
            switch result {
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    forecastList = try decoder.decode([ForecastViewModel].self, from: data)
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
            let data = try encoder.encode(forecastList)
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

