//
//  ContentView.swift
//  ForecastingWeather
//
//  Created by john.adrian.de.claro on 8/17/22.
//
//Test Github

import SwiftUI


struct ContentView: View {
//MARK: - Properties
//    @EnvironmentObject var store: Store
    @State private var isActive: Bool = false
    
    
    
//MARK: - Body
    var body: some View {

    
        
        NavigationView {
            VStack {

                NavigationLink(destination: CurrentWeatherView(), isActive: self.$isActive ) {

                }

                NavigationLink(destination: WeatherListScreenView(), isActive: self.$isActive ) {

                }

                Button("Go to Current Weather") {
                    self.isActive = true
                }
                Button("Add Cities") {
                    self.isActive = true
                }
            }


        }
     
    }
}
//MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
