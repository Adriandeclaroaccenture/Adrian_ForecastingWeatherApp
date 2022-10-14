//
//  CurrentWeatherViewModel.swift
//  ForecastingWeather
//
//  Created by john.adrian.de.claro on 8/17/22.
//

//Main View

import SwiftUI
import CoreLocation
import MapKit

struct CurrentWeatherView: View {
//MARK: - Property
    @State private var settingsView: Bool = false
    @State private var activeSheet: Sheets?
    @EnvironmentObject var store: Store
    @AppStorage ("isDarkMode") private var isDarkMode = false
//MARK: - Body
    var body: some View {
        NavigationView {
            ZStack {
                VStack (spacing: 20) {
                    CurrentLocationView()
                        .offset(x: 0, y: -20)
                    CurrentWeather()
                        .offset(x: 0, y: -20)
                    ScrollView (.vertical) {
                        ForEach((1...5), id:\.self) { day in
                            WeatherDays(days: day)
                        }//ForEach
                    }.offset(x:0 , y: -20) //ScrollView
                }//Vstack
                .padding(.horizontal)
                .background(
                Image("bgImage")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea(.all)
                    .navigationBarItems(leading: Button(action: {
                        self.settingsView.toggle()
                    }) {
                        Image(systemName: "gearshape.fill")
                            .foregroundColor(Color("textColor"))
                        }))//Image and Settings Gear
                .sheet(isPresented: $settingsView) {
                    SettingsView()
                }//sheet
            }//Zstack
            .overlay(
                NavigationLink (destination: AddLocationView()) {
                    ZStack {
                        BackView()
                        Image(systemName: "plus.square.fill")
                            .resizable()
                            .scaledToFit()
                            .background(Circle().fill(.clear))
                            .frame(width: 48, height: 48, alignment: .bottomTrailing)
                            .accentColor(Color("circleColor"))
                    }//Zstack
                    .padding(.bottom, 30)
                    .padding(.trailing, 30)
                }//NavigationLink
                , alignment: .bottom
            )//Overlay
            .preferredColorScheme(isDarkMode ? .dark : .light)
        }.navigationBarHidden(true)  //NavigationView
    }
}
//MARK: - Preview
struct CurrentWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeatherView().environmentObject(Store())
    }
}
