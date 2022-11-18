//
//  FailedView.swift
//  ForecastingWeather
//
//  Created by john.adrian.de.claro on 11/7/22.
//

import SwiftUI

struct FailedView: View {
//MARK: - Property
    @AppStorage ("isDarkMode") private var isDarkMode = false
//MARK: - Body
    var body: some View {
        Image(systemName: "questionmark.square.fill")
    }
}
//MARK: - Preview
struct FailedView_Previews: PreviewProvider {
    static var previews: some View {
        FailedView()
    }
}
