//
//  AddLocationViewModel.swift
//  ForecastingWeather
//
//  Created by john.adrian.de.claro on 10/24/22.
//

//import Foundation
////MARK: - Add Location Model
//class AddLocationVM: ObservableObject {
//
//    var location: String = ""
//
//    var id: String?
//
//    var updating: Bool {
//        id != nil
//    }
//
//    var isDisabled: Bool {
//        location.isEmpty
//    }
//
//    init() {}
//
//    init(_ currentLocation: AddLocation) {
//        self.location = currentLocation.location
//        id = currentLocation.id
//    }
//}
//
////MARK: - DataStore
//class DataStore: ObservableObject {
//    @Published var loc:[AddLocation] = []
//
//    init() {
//        print(FileManager.docDirURL.path)
//        if FileManager().docExist(named: filename){
//            loadToDosWeather()
//        }
//    }
//
//    func addLocationWeather(_ location: AddLocation) {
//        loc.append(location)
//        saveLocationWeather()
//    }
//
//    func updateLocationWeather(_ location: AddLocation) {
//        guard let index = loc.firstIndex(where: { $0.id == location.id}) else { return }
//        loc[index] = location
//        saveLocationWeather()
//    }
//
//    func deleteLocationWeather(at indexSet: IndexSet) {
//        loc.remove(atOffsets: indexSet)
//        saveLocationWeather()
//    }
//
//    func loadToDosWeather() {
//        FileManager().readDocument(docName: filename) { (result) in
//            switch result {
//            case .success(let data):
//                let decoder = JSONDecoder()
//                do {
//                    loc = try decoder.decode([AddLocation].self, from: data)
//                } catch {
//                    print(error.localizedDescription)
//                }
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//    }
//
//    func saveLocationWeather() {
//        print("Saving Location to file system")
//        let encoder = JSONEncoder()
//        do {
//            let data = try encoder.encode(loc)
//            let jsonString = String(decoding: data, as: UTF8.self)
//            FileManager().saveDocument(contents: jsonString, docName: filename) { (error) in
//                if let error = error {
//                    print(error.localizedDescription)
//                }
//            }
//        } catch {
//            print(error.localizedDescription)
//        }
//    }
//}

//MARK: - Added new Struct for Storing Data and Calling Weather
//struct WeatherViews: Identifiable, Codable {
//    var weathers: WeatherResponse
//    var id = UUID()
////    var store: Store
//
//
//    //MARK: - Current Weather
//
//        var currentLocation: String {
//            return weathers.city.name
//        }
//        var currentCountry: String {
//            return weathers.city.country
//        }
//        var currentDate: String {
//            return DateTime.defaultDateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval((weathers.list.first?.date)!)))
//        }
//        var weatherIcons: String? {
//            return weatherDayIcons.first
//        }
//        var currentTemp: String? {
//            return getTempByUnit(unit: .celsius)[0]
//        }
//        var currentCondition: String? {
//            return weeklyConditions.first
//        }
//        var currentHumidity: Int {
//            return weathers.list.first?.main.humidity ?? 0
//        }
//        var currentWind: String {
//            return roundedOf(weathers.list.first?.wind.speed ?? 0.0)
//        }
//        var currentRain: String {
//            return toString(100*(weathers.list.first?.pop ?? 0.0))
//        }
//    //MARK: - Weekly
//        var weeklyDays: [String] {
//            return [
//                DateTime.dayFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(weathers.list[0].date))),
//                DateTime.dayFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(weathers.list[7].date))),
//                DateTime.dayFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(weathers.list[15].date))),
//                DateTime.dayFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(weathers.list[23].date))),
//                DateTime.dayFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(weathers.list[31].date))),
//                DateTime.dayFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(weathers.list[39].date))),
//
//            ]
//        }
//
//    //MARK: - Weather Icons
//        var weatherDayIcons: [String] {
//            return [
//                weathers.list[0].weather.first?.icon ?? "",
//                weathers.list[7].weather.first?.icon ?? "",
//                weathers.list[15].weather.first?.icon ?? "",
//                weathers.list[23].weather.first?.icon ?? "",
//                weathers.list[31].weather.first?.icon ?? "",
//                weathers.list[39].weather.first?.icon ?? "",
//
//            ]
//
//        }
//
//    //MARK: - Dates
//
//        var dailyDates:[String] {
//            return [
//                DateTime.dateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(weathers.list[0].date))),
//                DateTime.dateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(weathers.list[7].date))),
//                DateTime.dateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(weathers.list[15].date))),
//                DateTime.dateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(weathers.list[23].date))),
//                DateTime.dateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(weathers.list[31].date))),
//                DateTime.dateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(weathers.list[39].date))),
//            ]
//
//        }
//
//    //MARK: - Temperature
//        func getTempByUnit(unit: TemperatureUnit) -> [String] {
//            switch unit {
//            case .celsius:
//                return [
//                    roundedOf(weathers.list[0].main.temp),
//                    roundedOf(weathers.list[7].main.temp),
//                    roundedOf(weathers.list[15].main.temp),
//                    roundedOf(weathers.list[23].main.temp),
//                    roundedOf(weathers.list[31].main.temp),
//                    roundedOf(weathers.list[39].main.temp),
//                ]
//            case .fahrenheit:
//                return [
//                    roundedOf(1.8 * (weathers.list[0].main.temp) + 32),
//                    roundedOf(1.8 * (weathers.list[7].main.temp) + 32),
//                    roundedOf(1.8 * (weathers.list[15].main.temp) + 32),
//                    roundedOf(1.8 * (weathers.list[23].main.temp) + 32),
//                    roundedOf(1.8 * (weathers.list[31].main.temp) + 32),
//                    roundedOf(1.8 * (weathers.list[39].main.temp) + 32),
//                ]
//            }
//        }
//
//    //MARK: - Weekly Conditions
//        var weeklyConditions: [String] {
//            return [
//                weathers.list[0].weather.first?.description ?? "Sunny",
//                weathers.list[7].weather.first?.description ?? "Sunny",
//                weathers.list[15].weather.first?.description ?? "Sunny",
//                weathers.list[23].weather.first?.description ?? "Sunny",
//                weathers.list[31].weather.first?.description ?? "Sunny",
//                weathers.list[39].weather.first?.description ?? "Sunny",
//            ]
//
//        }
//
//    //MARK: - Functions
//        func toString(_ double: Double) -> String {
//            return String(format: "%1.f", double)
//        }
//        func roundedOf(_ roundOf: Double) -> String {
//            return String(format: "%1.f", roundOf)
//        }
//    func getWeatherIconFor(icon: String) -> String {
//        switch icon {
//        case "01d":
//            return String("sun")
//        case "01n":
//            return String("moon")
//        case "02d":
//            return String("cloudSun")
//        case "02n":
//            return String("cloudMoon")
//        case "03d":
//            return String("cloud")
//        case "03n":
//            return String("cloudMoon")
//        case "04d":
//            return String("cloudMax")
//        case "04n":
//            return String("cloudMoon")
//        case "09d":
//            return String("rainy")
//        case "09n":
//            return String("rainy")
//        case "10d":
//            return String("rainySun")
//        case "10n":
//            return String("rainyMoon")
//        case "11d":
//            return String("thunderstormSun")
//        case "11n":
//            return String("thunderstormMoon")
//        case "13d":
//            return String("snowy")
//        case "13n":
//            return String("snowy-2")
//        case "50d":
//            return String("tornado")
//        case "50n":
//            return String("tornado")
//        default:
//            return String("sun")
//        }
//
//    }
//
//}
