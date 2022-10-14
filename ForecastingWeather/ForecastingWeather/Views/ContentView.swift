//
//  ContentView.swift
//  ForecastingWeather
//
//  Created by john.adrian.de.claro on 8/17/22.
//
//Test Github

import SwiftUI


struct ContentView: View {
//MARK: - Properties
//MARK: - Body
    var body: some View {
        TabView {
            AboutView()
                .tabItem() {

                    Image(systemName: "person.circle.fill")
                    Text("About")
                        .foregroundColor(Color("textColor"))
                }
            CurrentWeatherView()
                .tabItem() {
                    
                    Image(systemName: "magnifyingglass.circle.fill")
                    Text("Weather")
                        .foregroundColor(Color("textColor"))
                }
        } //Tabview
    }
}

extension UITabBarController {
    override open func viewDidLoad() {
        
        let standardApperance = UITabBarAppearance()
        
        standardApperance.backgroundImage = UIImage (named: "tabColor")
        
        tabBar.standardAppearance = standardApperance
    }
} //extension
 


//MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
