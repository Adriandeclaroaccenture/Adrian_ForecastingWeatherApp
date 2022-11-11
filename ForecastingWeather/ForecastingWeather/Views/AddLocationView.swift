//
//  AddCityView.swift
//  ForecastingWeather
//
//  Created by john.adrian.de.claro on 8/19/22.
//
//Add City Module


import SwiftUI


struct AddLocationView: View {
//MARK: - Property
//    @State var currentCity = Constants.CityLocation.currentCity
    @State private var locationList: [String] = []
    @State var myWeather: ForecastViewModel!
    @StateObject private var addCityVM = AddCityViewModel()
    @AppStorage("isDarkMode") private var isDarkMode = false
    @EnvironmentObject var store: Store
    @State private var activeSheet: Sheets?
    @Environment(\.presentationMode) var presentationMode
//MARK: - Body
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    HStack {
                        Text("Location").foregroundColor(Color("textColor"))
                            .fontWeight(.bold)
                            .font(.title)
                        Spacer().frame(width: 200)
                    }.padding(.horizontal) //Hstack
//MARK: - Search
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color("circleColor"))
                            .frame(width: 350, height: 60)
                        HStack {
                            Spacer()
                            Image(systemName: "magnifyingglass.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 35, height: 35)
                                .padding()
                            Spacer()
                            TextField("Enter City", text: $addCityVM.city)
//                            TextField("Enter City Name")
                                .padding(.leading, 10)
                                .font(.title)
                            Spacer()
                        }//Hstack
                    }.foregroundColor(Color("textColor"))
                        .padding(.horizontal)
                    //Zstack
//MARK: - List Adding City
                    List {
//                        ForEach(locationList, id: \.self) { location in
                        //                            NavigationLink {
                        //                                CurrentWeatherView()
                        ForEach(store.forecastList, id: \.cityName) { myWeather in
                            NavigationLink(destination: DetailScreen(myWeather: myWeather)) {
                                WeatherCell(myWeather: myWeather)
                            }
//                            }//Navigation
//                        label: { LocationList(locationCityName: location)
//                        label: { LocationList(myWeather: myWeather)
//                                .frame(height: 50)
//                                .cornerRadius(10)
                        } .onDelete(perform: store.deleteWeather)
                        .listRowBackground(Color.clear)
//                                .frame(width: 350, height: 50)
                    }
//                        .onDelete(perform: store.deleteWeather)
//                        .onDelete(perform: store.deleteWeather) //delete add city
                        //ForEach End
                    }.listStyle(PlainListStyle()).padding(.horizontal)
                
                }//Vstack
                .padding(.horizontal)
            //MARK: - Navigation
                        .navigationBarItems(leading: Button(action: {}, label: {
                            NavigationLink(destination: CurrentWeatherView()) {
                                TopNavigationBar(title: "Return").padding()
                            } //NavigationLink
                        }))
            //MARK: - Add Button
                        .navigationBarItems(trailing: Button(action: {
                            addCityVM.getCity { myWeather in
                                store.addWeather(myWeather)
                            }
            //                Constants.CityLocation.currentCity = currentCity
            //                locationList.append(currentCity)
                        }) { //Button
                            TopNavigationBar(title: "Add City").padding()
                        })//Add Button Nav
        }.navigationBarHidden(true)//Navigation

            .background(
            Image("bgImage")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea(.all))
        }//Navigation
//        .preferredColorScheme(isDarkMode ? .dark : .light)
//        .navigationBarHidden(true)
    }//Body
//}// End View
//MARK: - Preview
struct AddLocationView_Previews: PreviewProvider {
    static var previews: some View {
        AddLocationView().environmentObject(Store())
    }
}
