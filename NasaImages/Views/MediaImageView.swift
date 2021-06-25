//
//  MediaImageView.swift
//  NasaImages
//
//  Created by Andrew Teeters on 25/06/2021.
//

import Foundation
import SwiftUI

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
