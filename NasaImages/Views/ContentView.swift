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

struct MoreDetailsView: View {
    var nasaImage: NasaResponse
    
    var body: some View {
        Text(String(nasaImage.title))
            .font(.title)
            .kerning(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
            .bold()
            .multilineTextAlignment(.center)
            .foregroundColor(.white)
        Text(String(nasaImage.date))
            .foregroundColor(.white)
            .italic()
            .font(.title2)
            .kerning(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
        ScrollView{
            Text(String(nasaImage.explanation))
                .foregroundColor(.white)
                .font(.headline)
                .kerning(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
        }
    }
}

struct LessDetailsView: View {
    var nasaImage: NasaResponse
    
    var body: some View {
            Text(String(nasaImage.title))
                .font(.title)
                .bold()
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
            Text(String(nasaImage.date))
                .foregroundColor(.white)
                .italic()
                .font(.title2)
    }
}

struct MediaImageView: View {
    var nasaImage: NasaResponse
    
    @State var displayMore: Bool = false
    
    var body: some View {
        VStack{
            if displayMore {
                Group{
                    Button("Show Less") {
                        withAnimation{
                            displayMore.toggle()
                        }
                    }.foregroundColor(.white)
                    MoreDetailsView(nasaImage: nasaImage)
                }
                    } else {
                        Group{
                            LessDetailsView(nasaImage: nasaImage)
                            Button("Show More") {
                                withAnimation{
                                    displayMore.toggle()
                                }
                            }.foregroundColor(.white)
                        }
                }
            LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            }.transition(.slide)
    }
}

struct MediaVideoView: View {
    var nasaVideo: NasaResponse
    
    var body: some View {
        VStack{
                        Group{
                            MoreDetailsView(nasaImage: nasaVideo)
                            Link("View Video", destination: URL(string: nasaVideo.url)!)
                                .font(.title)
                                .foregroundColor(.white)
                            }.foregroundColor(.white)
            LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            }.transition(.slide)
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

