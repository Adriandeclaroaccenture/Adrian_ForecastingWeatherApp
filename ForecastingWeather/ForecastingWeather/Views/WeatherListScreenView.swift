//
//  WeatherListScreenView.swift
//  ForecastingWeather
//
//  Created by john.adrian.de.claro on 8/19/22.
//

//Displaying Cities


import SwiftUI


enum Sheets: Identifiable {
    
    var id: UUID{
        
        return UUID()
    }
    
    case addNewCity
    case currentView
    
}
struct WeatherListScreenView: View {
//MARK: - Property
    @EnvironmentObject var store: Store
    @State private var activeSheet: Sheets?
    
//MARK: - Body
    var body: some View {
  
        NavigationView {
     
            List {
                //weather
                
//                ForEach(store.weatherList, id: \.id) {  forecastWeather in
//
                //(weather: weather)
//                    WeatherCell (forecast: forecastWeather)
//
//                }
//                .onDelete(perform: { indexSet in
//                       store.weatherList.remove(atOffsets: indexSet)
//
//                    })
        
            }.listStyle(PlainListStyle())
            
                .sheet(item: $activeSheet, content: { (item) in
               
                    switch item {
                    case .addNewCity:
                        AddCityView().environmentObject(store)
                    case .currentView:
                        SettingsView().environmentObject(store)
                    }
            })
            
                .navigationBarItems(leading: Button(action: {
                    activeSheet = .currentView
                }) {
                    
                    Image(systemName: "thermometer.sun.fill")
                }, trailing: Button(action: {
                    activeSheet = .addNewCity
                    
                }, label: {
                    Image(systemName: "plus.app")
                }))
                .navigationTitle("Cities")
        }
    }
}
//MARK: - Preview
struct WeatherListScreenView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherListScreenView().environmentObject(Store())
    }
}
//MARK: - Struct WeatherCell
struct WeatherCell: View {
//MARK: - Property
    
    @EnvironmentObject var store: Store
    let weather: WeatherView
    let forecast: MyWeather
//MARK: - Body
    var body: some View {
//            HStack {
//            
//                VStack(alignment: .leading, spacing: 15) {
//                Text(weather.city)
//                    .fontWeight(.bold)
//                HStack {
//                    Image(systemName: "sunrise")
//                    Text("\(weather.sunrise.formatAsString())")
//                }
//                HStack {
//                    Image(systemName: "sunset")
//                    Text("\(weather.sunset.formatAsString())")
//                }
//            }
//            Spacer()
//            URLImage(url: Constants.Urls.weatherURLAsStringByIcon(icon: weather.icon))
//                .frame(width: 50, height: 50)
//
//            Text("\(Int(weather.getTemperatureByUnit(unit: store.selectedUnit))) \(String(store.selectedUnit.displayText.prefix(1)))")
//MARK: - 5 Days
                HStack {
                    VStack {
                        DailyRow(logo: Constants.Urls.weatherURLAsStringByIcon(icon: weather.icon), day: "Today:", min: "Min: %.0f", max: "Max: %.0f")
                        Divider()
                        DailyRow(logo: Constants.Urls.weatherURLAsStringByIcon(icon: weather.icon), day: forecast.date1.formatAsString(), min: "Min: 0.%f", max: "Max: Max: 0.%f")
                        Divider()
                        DailyRow(logo: Constants.Urls.weatherURLAsStringByIcon(icon: weather.icon), day: forecast.date2.formatAsString(), min: "Min: 0.%f", max: "Max: Max: 0.%f")
                        Divider()
                        DailyRow(logo: Constants.Urls.weatherURLAsStringByIcon(icon: weather.icon), day: forecast.date3.formatAsString(), min: "Min: 0.%f", max: "Max: Max: 0.%f")
                        Divider()
                        DailyRow(logo: Constants.Urls.weatherURLAsStringByIcon(icon: weather.icon), day: forecast.date4.formatAsString(), min: "Min: 0.%f", max: "Max: Max: 0.%f")
                    }//Vstack
                }//Hstack
//        }//Hstack
        .padding()
        .background(Color(#colorLiteral(red: 0.9133135676, green: 0.9335765243, blue: 0.98070997, alpha: 1)))
        .clipShape(RoundedRectangle(cornerRadius: 10, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
    }
}
