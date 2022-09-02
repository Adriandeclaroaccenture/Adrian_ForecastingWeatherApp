//
//  FetchLocationView.swift
//  ForecastingWeather
//
//  Created by john.adrian.de.claro on 8/19/22.
//
// Display Coordinates on a Physical Device


import SwiftUI

struct FetchLocationView: View {
//MARK: - Property
    @State var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
//MARK: - Body
    var body: some View {
        VStack {
            if let location = locationManager.location {
                if let weather = weather {
                    Text("Weather Data Fetch")
                } else {
                    
                    LoadingView()
                        .task {
                            do {
                                
                                weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longtitude: location.longitude)
                                
                            } catch {
                                
                                print("Error Getting Data \(error)")
                            }
                        }
                }
                
            } else {
                
                if locationManager.isLoading {
                    
                    LoadingView()
                }
            }

            CurrentLocationView()
                .environmentObject(locationManager)
            
        }
    }
}

//MARK: - Preview
struct FetchLocationView_Previews: PreviewProvider {
    static var previews: some View {
        FetchLocationView()
    }
}
