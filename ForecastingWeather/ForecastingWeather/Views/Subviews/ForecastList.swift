//
//  ForecastList.swift
//  ForecastingWeather
//
//  Created by john.adrian.de.claro on 11/7/22.
//

import SwiftUI

struct ForecastList: View {
//MARK: - Property
    let myWeather: ForecastViewModel
    @EnvironmentObject var store: Store
    @ObservedObject var weatherVM = WeatherViewModel()
//MARK: - Body
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
//MARK: - Main Weather
                Text(myWeather.cityName)
                    .font(.title)
                    .bold()
            HStack {
                myWeather.getWeatherIconForCity(icon: myWeather.icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 35, height: 35)
                Text("\(myWeather.getTempByUnit(unit: store.tempUnit))° \(String(store.tempUnit.displayText.prefix(1)))")
                    .font(.system(size: 35))
                }//Hstack
                Text(myWeather.description.capitalized)
            }//ScrollView
        }//Vstack
//MARK: - 5Days Forecast
        ScrollView (.vertical) {
            Text("5 Days Forecast")
            ForEach((1...5), id:\.self) { day in
                WeatherDays(days: day)
            }//ForEach
        }
    }
}
//MARK: - Preview
//struct ForecastList_Previews: PreviewProvider {
//    static var previews: some View {
//        AddLocationView().environmentObject(Store())
////        WeatherCell(city: "San Pablo City")
//    }
//}
