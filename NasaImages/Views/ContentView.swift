//
//  ContentView.swift
//  NasaImages
//
//  Created by Andrew Teeters on 15/06/2021.
//

import SwiftUI
import URLImage

        
struct NasaImageView: View {
    let nasaImage: NasaResponse
    
    
    var body: some View {
        
            GeometryReader { geometry in
                ZStack{
                    URLImage(URL(string: nasaImage.url)!) { image in
                        image
                            .resizable()
                            .aspectRatio(geometry.size, contentMode: .fill)
                            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    }
                }
                ScrollView{
                    VStack{
                        Text(String(nasaImage.title))
                            .font(.largeTitle)
                            .bold()
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                        Text(String(nasaImage.date))
                            .foregroundColor(.white)
                            .italic()
                            .font(.title)
                        Text(String(nasaImage.explanation))
                            .font(.title2)
                            .kerning(2.0)
                            .foregroundColor(.white)
                            
                    }
                }
            }
        
    }

}

struct ContentView_Previews: PreviewProvider {
    
    let image: NasaResponse = NasaResponse()
    static var previews: some View {
        Group {
            NasaImageView(nasaImage: NasaResponse())
        }
    }
}
