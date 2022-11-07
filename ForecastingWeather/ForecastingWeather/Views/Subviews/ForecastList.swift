//
//  ForecastList.swift
//  ForecastingWeather
//
//  Created by john.adrian.de.claro on 11/7/22.
//

import SwiftUI

struct ForecastList: View {
//MARK: - Property
    let myWeather: DetailedViewModel
    @EnvironmentObject var store: Store
//MARK: - Body
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                Text(myWeather.cityName)
                    .font(.title)
                    .bold()
            HStack {
                myWeather.getWeatherIconForDetailed(detailedIcon: myWeather.icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 35, height: 35)
                Text("\(myWeather.getTempUnit(unit: store.tempUnit)[0])°\(String(store.tempUnit.displayText.prefix(1)))")
                    .font(.system(size: 35))
                
                }//Hstack
            }//ScrollView
        }//Vstack
    }
}
//MARK: - Preview
//struct ForecastList_Previews: PreviewProvider {
//    static var previews: some View {
//        AddLocationView().environmentObject(Store())
////        WeatherCell(city: "San Pablo City")
//    }
//}
