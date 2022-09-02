//
//  LaunchScreenSplashView.swift
//  ForecastingWeather
//
//  Created by john.adrian.de.claro on 8/17/22.
//

import SwiftUI

struct LaunchScreenSplashView: View {
//MARK: - Property
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
//MARK: - Body
    var body: some View {
        if isActive {
            ContentView()
        } else {
            VStack {
                VStack {
                    Image ("forecastingWeatherLaunch")
                        .resizable()
                        .frame(width: 50, height: 50, alignment: .center)
                        .cornerRadius(12)
                    Text ("Forecasting Weather Application")
                        .fontWeight(.semibold)
                } //Vstack
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear{
                    withAnimation(.easeIn(duration: 1)){
                        self.size = 0.9
                        self.opacity = 1.0
                    }//Animation
                }//onApper
            } //Vstack
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation() {
                        self.isActive = true
                    }//Animation
                } // Dispatch
            }//Onapper
        } //Condition
    
    }
}
//MARK: - Preview
struct LaunchScreenSplashView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenSplashView()
    }
}
