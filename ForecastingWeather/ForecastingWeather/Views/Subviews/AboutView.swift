//
//  AboutView.swift
//  ForecastingWeather
//
//  Created by john.adrian.de.claro on 9/20/22.
//

import SwiftUI

struct AboutView: View {
//MARK: - Property
@AppStorage ("isDarkMode") private var isDarkMode = false
//MARK: - Body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
              
                Text("Forecasting Weather")
                    .fontWeight(.black)
                    .modifier(TitleModifier())
                AboutViewExtract()//Hstack
                Text("Credits")
                    .fontWeight(.black)
                    .modifier(TitleModifier())
                HStack {
                    Text("Source").foregroundColor(Color.gray)
                    Spacer()
                    Text("Udemy & Google")
                }//Hstack
            }//Vstack
        }//ScrollView
        .frame(minWidth: 0, minHeight: 50)
        .padding(.top, 15)
        .padding(.bottom, 25)
        .padding(.horizontal, 25)
    }
}

//MARK: - Preview
struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
            .previewLayout(.sizeThatFits)
    }
}
//MARK: - Extract About View
struct AboutViewExtract: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            RowAppInfoView(ItemOne: "Application", ItemTwo: "Forecasting Weather")
            RowAppInfoView(ItemOne: "Compatibility", ItemTwo: "15.5v")
            RowAppInfoView(ItemOne: "Developer", ItemTwo: "Adrian")
            RowAppInfoView(ItemOne: "Language", ItemTwo: "SwiftUI")
            RowAppInfoView(ItemOne: "Version", ItemTwo: "1.0")

        }
    }
}

struct RowAppInfoView: View {
//MARK: - Property
    var ItemOne: String
    var ItemTwo: String
//MARK: - Body
    var body: some View {
        VStack {
            HStack {
                Text(ItemOne).foregroundColor(Color.gray)
                Spacer()
                Text(ItemTwo)
                
            }
            Divider()
        }
    }
}
