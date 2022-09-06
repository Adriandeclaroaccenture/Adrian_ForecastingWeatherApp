////
////  AddCityView.swift
////  ForecastingWeather
////
////  Created by john.adrian.de.claro on 8/19/22.
////
////Add City Module
//
//
//import SwiftUI
//
//struct AddCityView: View {
////MARK: - Property
//    @EnvironmentObject var store: Store
//    @Environment(\.presentationMode) private var presentationMode
//    @StateObject private var addWeatherVM = AddWeatherViewModel()
////MARK: - Body
//    var body: some View {
//        VStack {
//            VStack {
//                
//                TextField("Enter City Name:", text: $addWeatherVM.city)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                Button("Save City") {
//                    
//                    addWeatherVM.save { weather in
//                        
//                        store.addWeather(weather)
//                        presentationMode.wrappedValue.dismiss()
//                        
//                    }
//                    
//                } .padding(10)
//                    .frame(maxWidth: UIScreen.main.bounds.width/4)
//                    .foregroundColor(Color.white)
//                    .background(Color.blue)
//                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
//                
//            }//Vstack
//            .padding()
//            .frame(maxWidth: .infinity, maxHeight: 250)
//            .background(Color.white)
//            .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
//            Spacer()
//        }// Vstack
//        .padding()
//        .navigationTitle("Add City")
//    }
//}
////MARK: - Preview
//struct AddCityView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddCityView().environmentObject(Store())
//    }
//}
