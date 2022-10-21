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
    @State var currentCity = Constants.CityLocation.city
    @State private var locationList: [String] = []
    @AppStorage("isDarkMode") private var isDarkMode = false
    @EnvironmentObject var store: Store
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
                        Spacer().frame(width: 235)
                    }.padding(.horizontal) //Hstack
//MARK: - Search
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color("circleColor"))
                            .frame(width: 350, height: 50)
                        HStack {
                            Spacer()
                            Image(systemName: "magnifyingglass.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 35, height: 35)
                                .padding()
                            Spacer()
                            TextField("Enter City", text: $currentCity)
                                .padding(.leading, 10)
                                .font(.title)
                            Spacer()
                        }//Hstack
                    }.foregroundColor(Color("textColor"))
                        .padding(.horizontal)
                    //Zstack
//MARK: - List
                    List {
                        ForEach(locationList, id: \.self) { location in
                            NavigationLink {
                                CurrentWeatherView()
                            }//Navigation
                        label: { LocationList(locationCityName: location)
                        } .listRowBackground(Color.clear)
                    }
                        .onDelete(perform: store.deleteWeather) //delete add city
                        //ForEach End
                    }.listStyle(PlainListStyle()).padding(.horizontal)
                }//Vstack
                .padding(.horizontal)
            }//Zstack
//MARK: - Navigation
            .navigationBarItems(leading: Button(action: {}, label: {
                NavigationLink(destination: CurrentWeatherView()) {
                    TopNavigationBar(title: "Return").padding()
                }//NavigationLink
            }))
//MARK: - Add Button
            .navigationBarItems(trailing: Button(action: {
                Constants.CityLocation.city = currentCity
                locationList.append(currentCity)
            }) { //Button
                TopNavigationBar(title: "Add City").padding()
            })//Add Button Nav
            .background(
            Image("bgImage")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea(.all))
        }//Navigation
        .preferredColorScheme(isDarkMode ? .dark : .light)
        .navigationBarHidden(true)
    }//Body
}// End View
//MARK: - Preview
struct AddLocationView_Previews: PreviewProvider {
    static var previews: some View {
        AddLocationView().environmentObject(Store())
    }
}
