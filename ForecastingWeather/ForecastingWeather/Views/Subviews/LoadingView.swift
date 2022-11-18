//
//  LoadingView.swift
//  ForecastingWeather
//
//  Created by john.adrian.de.claro on 11/7/22.
//

import SwiftUI

struct LoadingView: View {
//MARK: - Property
    @AppStorage ("isDarkMode") private var isDarkMode = false
//MARK: - Body
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .white))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
//MARK: - Preview
struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
