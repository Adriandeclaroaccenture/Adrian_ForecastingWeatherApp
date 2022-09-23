//
//  TitleModifier.swift
//  ForecastingWeather
//
//  Created by john.adrian.de.claro on 9/23/22.
//

import SwiftUI

struct TitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(Color.blue)
    }
}


