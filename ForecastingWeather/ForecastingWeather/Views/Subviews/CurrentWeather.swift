//
//  WeatherListScreenView.swift
//  ForecastingWeather
//
//  Created by john.adrian.de.claro on 8/19/22.
//

//Displaying Cities


import SwiftUI

struct CurrentWeather: View {
//MARK: - Property
    @EnvironmentObject var store: Store
    @ObservedObject var weatherVM = WeatherViewModel()
    @AppStorage ("isDarkMode") private var isDarkMode = false
//MARK: - Body
    var body: some View {
        VStack (alignment: .center) {
            HStack (alignment: .center) {
                Spacer()
                weatherVM.getWeatherIconFor(icon: weatherVM.weatherDayIcons[0])
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80, alignment: .trailing)
                Spacer()
                VStack (alignment: .trailing) {
                    Text("\(weatherVM.getTempByUnit(unit: store.tempUnit)[0])°\(String(store.tempUnit.displayText.prefix(1)))")
                        .fontWeight(.semibold)
                        .font(.largeTitle)
                    Text("\(weatherVM.weeklyConditions[0].uppercased())")
                        .fontWeight(.thin)
                        .font(.title2)
                }//Vstack
                Spacer()
            }.padding() //Hstack
            HStack{
                WeatherPanel(image: "wind", value: "\(weatherVM.currentWind) m/s")
                    .padding(.horizontal)
                WeatherPanel(image: "humidity", value: "\(weatherVM.currentHumidity) %")
                    .padding(.horizontal)
                WeatherPanel(image: "umbrella", value: "\(weatherVM.currentRain) %")
                    .padding(.horizontal)
            }.padding() //Hstack
        }//Vstack
        .foregroundColor(Color("textColor"))
        .background(
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Color("tColor"))
                .frame(width: 350, height: 250)
        )//Background
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}
//MARK: - Preview
struct CurrentWeather_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeather()
            .environmentObject(Store())
    }
}
