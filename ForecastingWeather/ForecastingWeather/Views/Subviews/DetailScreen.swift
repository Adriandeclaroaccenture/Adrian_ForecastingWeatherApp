//
//  DetailScreen.swift
//  ForecastingWeather
//
//  Created by john.adrian.de.claro on 11/8/22.
//

import SwiftUI

struct DetailScreen: View {
//MARK: - Property
    @State var myWeather: ForecastViewModel!
//MARK: - Body
    var body: some View {
        ZStack {
            Image("bgImage")
                .resizable()
                .ignoresSafeArea(.all)
            VStack {
                ForecastList(myWeather: myWeather)
            }//Vstack
        }//Zstack
    }
}
//MARK: - Preview
struct DetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddLocationView()
            .environmentObject(Store())
    }
}
