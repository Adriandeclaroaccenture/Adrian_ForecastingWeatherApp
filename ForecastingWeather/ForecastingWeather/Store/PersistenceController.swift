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
//MARK: - Save Function
    func save(completion: @escaping (Error?) -> () = {_ in } ) {
        let context = container.viewContext
        if context.hasChanges {
            do {
                try context.save()
                completion(nil)
            } catch  {
                completion(error)
            }
        }//statement
    }//func save
//MARK: - Delete Function
    func delete(_ object: NSManagedObject, completion: @escaping (Error?) -> () = {_ in }) {
        
    }//func delete
} //struct
