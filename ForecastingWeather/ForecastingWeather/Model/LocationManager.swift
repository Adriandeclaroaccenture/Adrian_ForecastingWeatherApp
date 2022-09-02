//
//  LocationManager.swift
//  ForecastingWeather
//
//  Created by john.adrian.de.claro on 8/18/22.
//

// Coordinates

import Foundation
import CoreLocation
import MapKit

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    let manager = CLLocationManager()
   
    
    @Published var location: CLLocationCoordinate2D?
    @Published var isLoading = false
    
    
    
    override init() {
        
        super.init()
        manager.delegate = self
    }
    
    func requestLocation() {
        
        isLoading = true
        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
        isLoading = false
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Erorr Getting Location", error)
        isLoading = false
    }
    
    
}
