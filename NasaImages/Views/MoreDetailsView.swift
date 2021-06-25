//
//  MoreDetailsView.swift
//  NasaImages
//
//  Created by Andrew Teeters on 25/06/2021.
//

import Foundation
import SwiftUI

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
