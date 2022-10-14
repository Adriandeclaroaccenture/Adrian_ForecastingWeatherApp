//
//  WeatherStoreView.swift
//  ForecastingWeather
//
//  Created by john.adrian.de.claro on 8/19/22.
//

//Shows Weather Information

import SwiftUI

struct WeatherDays: View {
//MARK: - Property
    var days: Int
    @EnvironmentObject var store: Store
    @ObservedObject var weatherVM = WeatherViewModel()
    @AppStorage ("isDarkMode") private var isDarkMode = false
//MARK: - Body
    var body: some View {
        HStack (alignment: .center) {
            Spacer().frame(width: 80)
            VStack (alignment: .leading, spacing: 0) {
                HStack {
                    Text("\(weatherVM.weeklyDays[days])")
                        .fontWeight(.semibold)
                    Text("\(weatherVM.dailyDates[days])")
                        .fontWeight(.light)
                }//Hstack
                Text("\(weatherVM.getTempByUnit(unit: store.tempUnit)[days])°\(String(store.tempUnit.displayText.prefix(1)))")
                    .fontWeight(.bold)
                    .font(.title2)
                Text("\(weatherVM.weeklyConditions[days].uppercased())")
                    .fontWeight(.light)
                    .font(.footnote)
            }//Vstack
            Spacer()
            weatherVM.getWeatherIconFor(icon: weatherVM.weatherDayIcons[days])
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60, alignment: .trailing)
            Spacer().frame(width: 70)
        }//Hstack
    }
}
//MARK: - Preview
struct WeatherDays_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDays(days: 0)
            .environmentObject(Store())
            .previewLayout(.sizeThatFits)
    }
}
