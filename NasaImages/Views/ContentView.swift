//
//  ContentView.swift
//  NasaImages
//
//  Created by Andrew Teeters on 15/06/2021.
//

import SwiftUI
import URLImage

        
struct NasaImageView: View {
    var nasaImage: NasaResponse
    
    @State var displayMore: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                Image(systemName: "placeholder image")
                    .data(url: URL(string: nasaImage.url)!)
                        .resizable()
                        .aspectRatio(geometry.size, contentMode: .fill)
                        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
            }
            if displayMore {
                    VStack{
                        Button("Show Less") {
                            withAnimation{
                                displayMore.toggle()
                            }
                        }.foregroundColor(.white)
                        MoreDetailsView(nasaImage: nasaImage)
                    }.transition(.move(edge: .bottom))
                        
                    } else {
                        VStack{
                            LessDetailsView(nasaImage: nasaImage)
                            Button("Show More") {
                                withAnimation{
                                    displayMore.toggle()
                                }
                            }.foregroundColor(.white)
                        }.transition(.move(edge: .top)).offset(y: 330.0)
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
            NasaImageView(nasaImage: NasaResponse())
        }
    }
}
