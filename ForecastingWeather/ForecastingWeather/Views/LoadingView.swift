//
//  LoadingView.swift
//  ForecastingWeather
//
//  Created by john.adrian.de.claro on 8/19/22.
//
//Loading Current Location Coordinates

import SwiftUI

struct LoadingView: View {
//MARK: - Property
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
