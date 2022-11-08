//
//  DailyRow.swift
//  ForecastingWeather
//
//  Created by john.adrian.de.claro on 11/8/22.
//

import SwiftUI

struct DailyRow: View {
//MARK: - Property
    var logo: String
    var day: String
    var temp: String
//MARK: - Body
    var body: some View {
        HStack {
            Today(day: day)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Icon(logo: logo)
                .frame(maxWidth: .infinity, alignment: .center)
            
            Temp(temp: temp)
                .frame(maxWidth: .infinity, alignment: .trailing)
        }//hstack
    }
}
//MARK: - Preview
struct DailyRow_Previews: PreviewProvider {
    static var previews: some View {
        DailyRow(logo: "sun", day: "today", temp: "30°C")
    }
}

//MARK: - Struct Today
struct Today: View {
    
    var day: String
    
    var body: some View {
        Text(day)
            .font(.title3)
    }
}
//MARK: - Struct Icon
struct Icon: View {
    
    var logo: String
    
    var body: some View {
        Image(systemName: logo)
            .resizable()
            .frame(width: 20, height: 20)
    }
}
//MARK: - Struct Temp
struct Temp: View {
    
    var temp: String
    
    var body: some View {
        Text(temp)
            .font(.title3)
    }
}
