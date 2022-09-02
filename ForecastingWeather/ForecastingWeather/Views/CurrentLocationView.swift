//
//  CurrentLocationView.swift
//  ForecastingWeather
//
//  Created by john.adrian.de.claro on 8/19/22.
//
// Current Location Button


import SwiftUI
import CoreLocationUI



struct CurrentLocationView: View {
//MARK: - Property
    
    @EnvironmentObject var locationManager: LocationManager
    
//MARK: - Body
    var body: some View {
        VStack {
                        
        }//Vstack
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        LocationButton(.shareCurrentLocation) {
            locationManager.requestLocation()
        }
        .cornerRadius(20)
        .symbolVariant(.fill)
        .foregroundColor(.white)
    }
}
//MARK: - Preview
struct CurrentLocationView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentLocationView()
            .previewLayout(.fixed(width: 300, height: 80))
            .padding()
    }
}
