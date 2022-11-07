//
//  WeatherCell.swift
//  ForecastingWeather
//
//  Created by john.adrian.de.claro on 11/7/22.
//

import SwiftUI

struct WeatherCell: View {
//MARK: - Property
    let city: String
    @ObservedObject var addCityVM = DetailedViewModel()
//MARK: - Body
    var body: some View {
        ZStack {
            Image("bgImage")
                .resizable()
                .ignoresSafeArea(.all)
            VStack {
                if addCityVM.loadingState == .loading {
                    LoadingView()
                } else if addCityVM.loadingState == .success {
                    ForecastList(myWeather: addCityVM)
                } else if addCityVM.loadingState == .failed {
                    FailedView()
                }
            }//Vstack
            .onAppear {
                self.addCityVM.getByCity(city: self.city)
            }
        }//Zstack
        .navigationBarHidden(true)
    }
}
//MARK: - Preview
struct WeatherCell_Previews: PreviewProvider {
    static var previews: some View {
        WeatherCell(city: "San Pablo City")
            .environmentObject(Store())
    }
}
