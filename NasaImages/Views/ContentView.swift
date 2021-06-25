//
//  ContentView.swift
//  NasaImages
//
//  Created by Andrew Teeters on 15/06/2021.
//

import SwiftUI
        
struct NasaImageView: View {
    var nasaResponse: NasaResponse
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                ZStack{
                if nasaResponse.media_type == String("image") {
                        Image(systemName: "placeholder image")
                            .data(url: URL(string: nasaResponse.url)!)
                                .resizable()
                                .aspectRatio(geometry.size, contentMode: .fill)
                            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    } else {
                        Color.black.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    }
                }
                if nasaResponse.media_type == String("image"){
                    MediaImageView(nasaImage: nasaResponse)
                } else {
                    MediaVideoView(nasaVideo: nasaResponse)
                }
                
            }
        }
        

    }
}

extension Image {
    func data(url:URL) -> Self {
        if let data = try? Data(contentsOf: url) {
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
    }
    return self
        .resizable()
    }
}

struct ContentView_Previews: PreviewProvider {
    
    let image: NasaResponse = NasaResponse()
    static var previews: some View {
        Group {
            NasaImageView(nasaResponse: NasaResponse())
        }
    }
}

