//
//  CurrentWeatherViewModel.swift
//  ForecastingWeather
//
//  Created by john.adrian.de.claro on 8/17/22.
//

//Main View

import SwiftUI
import MapKit

struct CurrentWeatherView: View {
//MARK: - Properties
    @ObservedObject private var locationManager = LocationManager()
    @StateObject var weatherVM = WeatherViewModel()
    @State private var shouldShowErrorBox = false
    @State private var city: String = ""
    @State private var isOn = false
//MARK: - Body
    
    var body: some View {
        
        
        GeometryReader { geometry in
            VStack {
              
                ZStack {
                    
                    
                    
                    Image( "bgBackground")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                        .frame(width: geometry.size.width)
                    
                    
                    AsyncImage(url: URL(string: weatherVM.backgroundImageUrl))  { image in
                        image.resizable().ignoresSafeArea()
                    } placeholder: {
                        
                        
                    }
                    VStack(spacing: 30) {
                       
                        Text("Forecasting Weather").font(.largeTitle)
                            .font(.callout)
                            .foregroundColor(.white)
                            .padding(EdgeInsets(top: 100, leading: 20, bottom: 10, trailing: 20))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(
                                .ultraThinMaterial,
                                in: RoundedRectangle.init(cornerRadius: 0)
                            ).ignoresSafeArea(.all, edges: .top) //: - Title
                        
                        
                        
                        VStack(alignment: .leading, spacing: 20) {
                   
                           //Switch Mode
                            Toggle (isOn: $isOn) {
                                Text("Switch Mode")
                            } .preferredColorScheme(isOn ? .light : .dark)
                            
                       
                            //Search City
                            TextField("", text: $city)
                                .padding(.bottom, 30)
                                .textFieldStyle(.roundedBorder)
                                .foregroundColor(.gray)
                                .onSubmit {
                                    if (!city.isEmpty) {
                                        weatherVM.fetchData(for: city)
                                    }
                          
                                }
                            
                            Text("\((weatherVM.weatherDescription ?? "").uppercased()) \(String(weatherVM.temperature ?? 0.0)) °C")
                                .font(.callout).fontWeight(.heavy).foregroundColor(.white)
                            Divider()
                            
                            Text("Minimun Temperature: \(String(weatherVM.temp_min ?? 0.0)) °C")
                                .font(.callout)
                                .foregroundColor(.black)
                            Text("Maximun Temperature: \(String(weatherVM.temp_max ?? 0.0)) °C")
                                .font(.callout)
                                .foregroundColor(.black)
                            Text("Pressure: \(String(weatherVM.pressure ?? 0.0))mbar")
                                .font(.callout)
                                .foregroundColor(.black)
                            Text("Humidity: \(String(weatherVM.humidity ?? 0.0))%")
                                .font(.callout)
                                .foregroundColor(.black)
                            
                            
//                            Text("Sunrise: \(Date(timeIntervalSince1970: weatherVM.sunrise ?? 0))")
//                                .multilineTextAlignment(.leading)
//                                .lineLimit(2)
//                                .font(.callout)
//                                .foregroundColor(.black)
//                                .fixedSize(horizontal: false, vertical: true)
//                            Text("Sunset: \(Date(timeIntervalSince1970: weatherVM.sunset ?? 0))")
//                                .multilineTextAlignment(.leading)
//                                .lineLimit(2)
//                                .font(.callout)
//                                .foregroundColor(.black)
//                                .fixedSize(horizontal: false, vertical: true)

                        }.padding().background(.ultraThinMaterial,in: RoundedRectangle(cornerRadius: 20)).foregroundColor(.black)
                        Spacer()
                        
                        //Current Location
                        CurrentLocationView()
                        
                    }
                    
                }
            }
        }
    }
    
//MARK: - Preview
    
    struct Home_Previews: PreviewProvider {
        static var previews: some View {
            CurrentWeatherView()
        }
    }
}
