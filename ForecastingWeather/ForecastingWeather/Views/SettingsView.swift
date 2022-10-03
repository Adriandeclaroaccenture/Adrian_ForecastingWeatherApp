//
//  SettingsView.swift
//  ForecastingWeather
//
//  Created by john.adrian.de.claro on 9/12/22.
//

//Change Temperature 

import SwiftUI

enum TemperatureUnit: String, CaseIterable, Identifiable {
    
    var id: String {
        return rawValue
    }
    case celsius
    case fahrenheit
}

extension TemperatureUnit {
    
    var displayText: String {
        switch self {
            case .celsius:
                return "Celsius"
            case .fahrenheit:
                return "Fahrenheit"
        }
    }
}

struct SettingsView: View {
//MARK: - Property
    @EnvironmentObject var store: Store
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @AppStorage ("unit") private var selectedUnit: TemperatureUnit = .celsius
//MARK: - Body
    var body: some View {
        VStack {
            Picker(selection: $selectedUnit, label: Text("Select temperature unit?")) {
                ForEach(TemperatureUnit.allCases, id: \.self) {
                    Text("\($0.displayText)" as String)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            
            Spacer()
        }
        .padding()
        .navigationTitle("Settings")
        .navigationBarItems(trailing: Button("Done") {
            
           
            
            mode.wrappedValue.dismiss()
            store.selectedUnit = selectedUnit
            
        })
        
        .embedInNavigationView()
    }
}
//MARK: - Preview
struct SettingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
