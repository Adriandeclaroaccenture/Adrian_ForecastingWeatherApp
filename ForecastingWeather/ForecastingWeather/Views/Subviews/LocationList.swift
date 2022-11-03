//
//  CurrentLocationView.swift
//  ForecastingWeather
//
//  Created by john.adrian.de.claro on 8/19/22.
//


import SwiftUI

struct LocationList: View {
//MARK: - Property
    @EnvironmentObject var store: Store
    let myWeather: ForecastViewModel
    @AppStorage ("isDarkMode") private var isDarkMode = false
    
//    let locationCityName: String
    let id = UUID()
    
//MARK: - Body
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            Text("\(myWeather.cityName)")
//            Text("\(weatherVM.city), \(weatherVM.currentCountry)")
                .font(.title)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            myWeather.getWeatherIconForCity(icon: myWeather.icon)
//            weatherVM.getWeatherIconFor(icon: weatherVM.weatherDayIcons[0])
                .resizable()
                .scaledToFit()
                .frame(width: 35, height: 35)
            VStack(alignment: .leading) {
                Text("\(myWeather.getTempByUnit(unit: store.tempUnit))° \(String(store.tempUnit.displayText.prefix(1)))")
//                Text("\(weatherVM.getTempByUnit(unit: store.tempUnit)[0])°\(String(store.tempUnit.displayText.prefix(1)))")
//                Text("\(weatherVM.weeklyConditions[0].uppercased())")
            }//Vstack
            .font(.footnote)
            .frame(width: 100, alignment: .topTrailing)
        }//Hstack
        .padding(.vertical)
        .foregroundColor(Color("textColor"))
        .background(RoundedRectangle(cornerRadius: 10)
        .foregroundColor(Color("tColor"))
        .frame(width: 350, height: 45))
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}
//MARK: - Preview
struct LocationList_Previews: PreviewProvider {
    static var previews: some View {
        AddLocationView().environmentObject(Store())
//        LocationList(weatherVM: WeatherViewModel(), locationCityName: "San Pablo City")
    }
}
