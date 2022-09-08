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
                
                ForEach(store.weatherList, id: \.id) { weather in
                    
                    WeatherCell(weather:weather)
                 
                    
                }
                
            }.listStyle(PlainListStyle())
            
                .sheet(item: $activeSheet, content: { (item) in
               
                    switch item {
                    case .addNewCity:
                        AddCityView().environmentObject(store)
                    case .currentView:
                        CurrentWeatherView()
                    }
            })
            
                .navigationBarItems(leading: Button(action: {
                    activeSheet = .currentView
                }) {
                    
                    Image(systemName: "magnifyingglass.circle.fill")
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

struct WeatherCell: View {
    
    let weather: WeatherView
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 15) {
                Text(weather.city)
                    .fontWeight(.bold)
                HStack {
                    Image(systemName: "sunrise")
                    Text("\(weather.sunrise.formatAsString())")
                }
                HStack {
                    Image(systemName: "sunset")
                    Text("\(weather.sunset.formatAsString())")
                }
            }
            Spacer()
            URLImage(url: Constants.Urls.weatherURLAsStringByIcon(icon: weather.icon))
                .frame(width: 50, height: 50)
            
            Text("\(Int(weather.temperature)) °C")
        }
        .padding()
        .background(Color(#colorLiteral(red: 0.9133135676, green: 0.9335765243, blue: 0.98070997, alpha: 1)))
        .clipShape(RoundedRectangle(cornerRadius: 10, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))

    }
}
