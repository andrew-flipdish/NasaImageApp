//
//  LessDetailsView.swift
//  NasaImages
//
//  Created by Andrew Teeters on 25/06/2021.
//

import Foundation
import SwiftUI

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
