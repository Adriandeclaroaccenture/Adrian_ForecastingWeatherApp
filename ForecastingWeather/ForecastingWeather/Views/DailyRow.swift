//
//  DailyRow.swift
//  ForecastingWeather
//
//  Created by john.adrian.de.claro on 10/5/22.
//

import SwiftUI

struct DailyRow: View {
//MARK: - Property
    var logo: String
    var day: String
    var min: String
    var max: String
    
//MARK: - Body
    var body: some View {
        HStack {
            Text(day)
                .font(.title)
            Spacer()
            URLImage(url: logo)
                .frame(width: 35, height: 35)
            HStack {
                Text(min)
                    .font(.title)
                Text(max)
                    .font(.title)
            }//Hstack
        }//Hstack
    }
}
//MARK: - Preview
struct DailyRow_Previews: PreviewProvider {
    static var previews: some View {
        DailyRow(logo: "", day: "", min: "", max: "")
    }
}
