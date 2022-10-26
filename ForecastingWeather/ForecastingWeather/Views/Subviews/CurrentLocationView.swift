//
//  FetchLocationView.swift
//  ForecastingWeather
//
//  Created by john.adrian.de.claro on 8/19/22.
//
// Display Current Location City


import SwiftUI

struct CurrentLocationView: View {
//MARK: - Property
    @ObservedObject var weatherVM = WeatherViewModel()
//      var weatherr: WeatherViews
//    let weatherr = WeatherViews(weathers: <#WeatherResponse#>)
//    var city: String
    @AppStorage ("isDarkMode") private var isDarkMode = false
//MARK: - Body
    var body: some View {
        VStack {
//            Text("\(weatherr.city)")
            Text("\(weatherVM.city)")
                .font(.largeTitle)
                .fontWeight(.semibold)
            Text("\(weatherVM.currentDate)")
//            Text("\(weatherr.currentDate)")
        }//Vstack
            .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}
//MARK: - Preview
struct CurrentLocationView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentLocationView()
//        CurrentLocationView(weatherr: WeatherViews(), city: "San Pablo City")
//        CurrentLocationView(weatherr: WeatherViews())
//        CurrentLocationView(weatherVM: WeatherViews(from: WeatherResponse as! Decoder))
    }
}
