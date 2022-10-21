////
////  ForecastModel.swift
////  ForecastingWeather
////
////  Created by john.adrian.de.claro on 10/20/22.
////
//
//
//
//import Foundation
//import CoreLocation
//import SwiftUI
//
//struct ForecastModel: Identifiable,Codable {
////MARK: - Properties
//    var id = UUID()
//    @EnvironmentObject var store: Store
//    @Published var weather = WeatherResponse.empty()
//    @Published var city = Constants.CityLocation.city {
//        didSet {
//            getLocation()
//        }
//    }
////MARK: - Geo Location / Current Location
//
//    init() {
//        getLocation()
//    }
//    func getLocation() {
//        CLGeocoder().geocodeAddressString(city) { (placemarks, error) in
//            if let places = placemarks,
//               let place = places.first {
//                self.getWeather(coord: place.location?.coordinate)
//            }
//        }
//    }
//    func getWeather(coord: CLLocationCoordinate2D?) {
//        var urlString = ""
//        if let coord = coord {
//            urlString = forecastAPI.getUrlForecast(latitude: coord.latitude, longitude: coord.longitude)
//        } else {
//            urlString = forecastAPI.getUrlForecast(latitude: 14.0642108, longitude: 121.32333689999996) //San Pablo City
//        }
//        getWeatherStatic(city: city, for: urlString)
//    }
//    func getWeatherStatic(city: String, for urlString: String) {
//        guard let url = URL (string: urlString) else { return }
//        NetworkManager<WeatherResponse>.fetchForecast(for: url) { (result) in
//            switch result {
//            case .success(let response):
//                DispatchQueue.main.async {
//                    self.weather = response
//                }
//            case . failure(let error):
//                print(error)
//            }
//        }
//    }
//}
