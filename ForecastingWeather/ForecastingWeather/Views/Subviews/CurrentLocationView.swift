//
//  FetchLocationView.swift
//  ForecastingWeather
//
//  Created by john.adrian.de.claro on 8/19/22.
//
// Display Coordinates on a Physical Device


import SwiftUI

struct CurrentLocationView: View {
//MARK: - Property
    @ObservedObject var weatherVM = WeatherViewModel()
    @AppStorage ("isDarkMode") private var isDarkMode = false
//MARK: - Body
    var body: some View {
        VStack {
            Text("\(weatherVM.city)")
                .font(.largeTitle)
                .fontWeight(.semibold)
            Text("\(weatherVM.currentDate)")
        }//Vstack
//            .foregroundColor(Color("textcolor"))
            .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}
//MARK: - Preview
struct CurrentLocationView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentLocationView()
    }
}
