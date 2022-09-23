//
//  NavigationView.swift
//  ForecastingWeather
//
//  Created by john.adrian.de.claro on 9/13/22.
//

import Foundation
import SwiftUI

extension View {
    
    func embedInNavigationView() -> some View {
        return NavigationView { self }
    }
    
}
