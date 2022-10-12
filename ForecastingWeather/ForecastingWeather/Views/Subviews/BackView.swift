//
//  DailyRow.swift
//  ForecastingWeather
//
//  Created by john.adrian.de.claro on 10/5/22.
//

import SwiftUI

struct BackView: View {
//MARK: - Property
    @AppStorage ("isDarkMode") private var isDarkMode = false
//MARK: - Body
    var body: some View {
        Group {
            Circle()
                .opacity( 0.2 )
                .scaleEffect( 1 )
                .frame(width: 68, height: 68, alignment: .center)
            Circle()
                .opacity( 0.15 )
                .scaleEffect( 1 )
                .frame(width: 88, height: 88, alignment: .center)
        }//Group
        .foregroundColor(Color("circleColor"))
        .preferredColorScheme(isDarkMode ? .dark : .light)
        
    }
}
//MARK: - Preview
struct BackView_Previews: PreviewProvider {
    static var previews: some View {
        BackView()
            .previewLayout(.sizeThatFits)
    }
}
