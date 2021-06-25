//
//  MediaVideoView.swift
//  NasaImages
//
//  Created by Andrew Teeters on 25/06/2021.
//

import Foundation
import SwiftUI

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
