//
//  List View.swift
//  NasaImages
//
//  Created by Andrew Teeters on 18/06/2021.
//

import SwiftUI

struct ListView: View {
    
    @State var viewModel = NasaResponseViewModel()
    @State var screenSize = UIScreen.main.bounds
    
    var body: some View {
        
        NavigationView{
            List{
                ForEach(viewModel.results, id: \.date) { item in
                    NavigationLink(
                        destination: NasaImageView(nasaResponse: item),
                        label: {
                            Text(String("\(item.date)"))
                                .font(.body)
                                .foregroundColor(.black)
                                .frame(width: screenSize.width, height: 30, alignment: .leading)
                        })
                }
            }.navigationTitle(String("Nasa APOD"))
        }.onAppear(perform: viewModel.loadData)
    }
}


struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ListView()
        }
    }
}
