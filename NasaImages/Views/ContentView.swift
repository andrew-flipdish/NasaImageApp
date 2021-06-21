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
    @State var displayMore: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            if displayMore {
                ZStack{
                    URLImage(URL(string: nasaImage.url)!) { image in
                        image
                            .resizable()
                            .aspectRatio(geometry.size, contentMode: .fill)
                            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    }
                }
                    VStack{
                        Button("Show Less") {
                            withAnimation{
                                displayMore.toggle()
                            }
                        }.foregroundColor(.white)
                        Text(String(nasaImage.title))
                            .font(.largeTitle)
                            .bold()
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                        Text(String(nasaImage.date))
                            .foregroundColor(.white)
                            .italic()
                            .font(.title)
                            .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                        ScrollView{
                            Text(String(nasaImage.explanation))
                                .foregroundColor(.white)
                                .font(.headline)
                                .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                        }
                        
                    }.transition(.move(edge: .bottom))
                        
                    } else {
                    ZStack{
                        URLImage(URL(string: nasaImage.url)!) { image in
                            image
                                .resizable()
                                .aspectRatio(geometry.size, contentMode: .fill)
                                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        }
                    }
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
                                .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
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

struct ContentView_Previews: PreviewProvider {
    
    let image: NasaResponse = NasaResponse()
    static var previews: some View {
        Group {
            NasaImageView(nasaImage: NasaResponse())
        }
    }
}
