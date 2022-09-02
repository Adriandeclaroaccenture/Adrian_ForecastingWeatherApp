//
//  WeatherStoreView.swift
//  ForecastingWeather
//
//  Created by john.adrian.de.claro on 8/19/22.
//

//Storing saved Cities

import SwiftUI


struct WeatherStoreView: App {
    
    var body: some Scene {
        
        WindowGroup {
            
            WeatherListScreenView().environmentObject(Store())
        }
    }
}
