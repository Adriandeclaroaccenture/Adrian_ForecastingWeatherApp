//
//  NetworkManager.swift
//  ForecastingWeather
//
//  Created by john.adrian.de.claro on 11/14/22.
//

import Foundation
import Network

class NetworkConnection: ObservableObject {
    let monitor = NWPathMonitor()
    let queue = DispatchQueue(label: "NetworkManager")
    @Published var isConnected = true
    
    var imageName: String {
        return isConnected ? "wifi" : "wifi.slash"
    }
    
    var connectionDescription: String {
        if isConnected {
            return "Internet connection looks good!"
        } else {
            return "It looks like you're not connected to the internet. Make sure WiFi is enabled and try again"
        }
    }
    
    init() {
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                self.isConnected = path.status == .satisfied
            }
        }
        monitor.start(queue: queue)
    }
}
