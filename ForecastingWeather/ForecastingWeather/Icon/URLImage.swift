//
//  URLImage.swift
//  ForecastingWeather
//
//  Created by john.adrian.de.claro on 8/19/22.
//

//Weather Icon

import SwiftUI

struct URLImage: View {
//MARK: - Property
    let url: String
    let placeholder: String
  
    
    @ObservedObject var imageLoader = ImageLoader()
    
    init(url: String, placeholder: String = "placeholder") {
        self.url = url
        self.placeholder = placeholder
        self.imageLoader.downloadImage(url: self.url)
    }
//MARK: - Body
    var body: some View {
      
        if let data = self.imageLoader.downloadedData {
            return Image(uiImage: UIImage(data: data)!).resizable()
        } else {
            return Image("placeholder").resizable()
        }
        
    }
}

struct URLImage_Previews: PreviewProvider {
    static var previews: some View {
        URLImage(url: "")
    }
}
