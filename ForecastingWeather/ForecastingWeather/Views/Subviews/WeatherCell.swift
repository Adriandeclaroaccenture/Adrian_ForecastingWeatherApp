//
//  WeatherCell.swift
//  ForecastingWeather
//
//  Created by john.adrian.de.claro on 11/7/22.
//

import SwiftUI

struct WeatherCell: View {
//MARK: - Property
//    let weather: WeatherResponse
    let myWeather: ForecastViewModel
    @EnvironmentObject var store: Store
//MARK: - Body
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                VStack(alignment: .leading, spacing: 0) {
                    Text(myWeather.cityName)
                        .font(.title)
                        .fontWeight(.bold)
                }//Vstack
            }//Vstack
            VStack {
                HStack {
                Spacer()
                myWeather.getWeatherIconForCity(icon: myWeather.icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 35, height: 35)
                Text("\(myWeather.getTempByUnit(unit: store.tempUnit))° \(String(store.tempUnit.displayText.prefix(1)))")
                        .font(.title)
                }//Hstack
                Spacer()
                Text(myWeather.description.capitalized)
                    .font(.system(size: 15))
            }//Vstack
        }//Hstack
    }
}
//MARK: - Preview
//struct WeatherCell_Previews: PreviewProvider {
//    static var previews: some View {
//        WeatherCell()
//    }
//}
