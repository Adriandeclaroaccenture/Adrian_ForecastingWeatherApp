//
//  SettingsView.swift
//  ForecastingWeather
//
//  Created by john.adrian.de.claro on 9/12/22.
//

//Change Temperature 

import SwiftUI

struct SettingsView: View {
//MARK: - Property
    @AppStorage ("unit") private var temperatureUnit: TemperatureUnit = .celsius
    @AppStorage ("isDarkMode") private var isDarkMode = false
    @Environment(\.presentationMode) var presentationMode
    @State private var unitChanged: Bool = false
    @EnvironmentObject var store: Store
    
//MARK: - Body
    var body: some View {
        NavigationView {
            VStack (alignment: .center, spacing: 0) {
                Form {
//MARK: - Change Theme Mode
                Section(header:
                        HStack{
                    Text("Change Mode")
                        .foregroundColor(Color("textColor"))
                })  {//Header and Hstack
                    Picker("Change", selection: $isDarkMode) {
                        Text("Light Mode")
                            .preferredColorScheme(.light)
                            .tag(false)
                        Text("Dark Mode")
                            .preferredColorScheme(.dark)
                            .tag(true)
                        }//Picker
                    .padding(.vertical, 4)
                    }//Picker End
//MARK: - Change Temperature
                    Section(header:
                        HStack {
                            Text("Change Temperature Unit")
                            .foregroundColor(Color("textColor"))
                    }) {
                        VStack (alignment: .leading) {
                            Text("Temperature Unit")
                            Picker(selection: $temperatureUnit, label: Text ("Select Temperature Unit")) {
                                ForEach(TemperatureUnit.allCases, id:\.self) {
                                    Text("\($0.displayText)" as String)
                                }//For Each
                            }//Condtion
                            .pickerStyle(SegmentedPickerStyle())
                            Spacer()
                        }//Vstack
                    }//Picker
                }//Form
            }//Vstack
            .navigationBarItems(trailing: Button(action: {
                self.presentationMode.wrappedValue.dismiss()
                store.tempUnit = temperatureUnit
            }) {
                Image(systemName: "return")
            }
            )
            .navigationBarTitle("Settings", displayMode: .inline)
        }//NavigationView
    }
}
//MARK: - Preview
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(Store())
    }
}

