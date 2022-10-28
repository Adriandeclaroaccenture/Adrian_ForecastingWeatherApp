//
//  LoadingView.swift
//  ForecastingWeather
//
//  Created by john.adrian.de.claro on 8/19/22.
//


import SwiftUI

struct TopNavigationBar: View {
//MARK: - Property
    @AppStorage ("isDarkMode") private var isDarkMode = false
    let title: String
//MARK: - Body
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Color("circleColor"))
                .frame(width: 80, height: 30)
            Text(title)
                .foregroundColor(Color("textColor"))
        }//Zstack
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}
//MARK: - Preview
struct TopNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        TopNavigationBar(title: "Add City")
    }
}
