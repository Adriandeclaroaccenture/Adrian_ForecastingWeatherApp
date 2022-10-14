//
//  WeatherPanel.swift
//  ForecastingWeather
//
//  Created by john.adrian.de.claro on 10/12/22.
//

import SwiftUI

struct WeatherPanel: View {
//MARK: - Property
    var image: String
    var value: String
//MARK: - Body
    var body: some View {
        VStack (alignment: .center) {
            Image("\(image)")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
            Text("\(value)")
                .fontWeight(.semibold)
                .font(.headline)
        }//Vstack
    }
}
//MARK: - Preview
struct WeatherPanel_Previews: PreviewProvider {
    static var previews: some View {
        WeatherPanel(image: "wind", value: "12")
    }
}
