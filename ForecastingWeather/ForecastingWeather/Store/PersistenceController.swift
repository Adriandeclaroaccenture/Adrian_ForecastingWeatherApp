//
//  PersistenceController.swift
//  ForecastingWeather
//
//  Created by john.adrian.de.claro on 10/19/22.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "WeatherData")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Erroe: \(error.localizedDescription)")
            }//if let
        }//load persistence
    }//init
} //struct
