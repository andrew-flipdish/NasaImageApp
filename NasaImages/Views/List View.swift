//
//  List View.swift
//  NasaImages
//
//  Created by Andrew Teeters on 18/06/2021.
//

import SwiftUI

struct ListView: View {
    
    @State private var results = [NasaResponse]()
    @State private var format: DateFormatter = DateFormatter()
    @State private var startDate: String = String("")
    @State var caller: ApiCaller = ApiCaller()
    @State var screenSize = UIScreen.main.bounds
    
    var body: some View {
        
        NavigationView{
            List{
                ForEach(results, id: \.date) { item in
                    NavigationLink(
                        destination: NasaImageView(nasaImage: item),
                        label: {
                            Text(String("\(item.date)"))
                                .font(.body)
                                .foregroundColor(.black)
                                .frame(width: screenSize.width, height: 30, alignment: .leading)
                        })
                }
            }.navigationTitle(String("Nasa APOD"))
        }.onAppear(perform: getDate)
        
        
    }
    
    func getDate(){
        self.format.dateFormat = "yyyy-MM-dd"
        let earlyDate = Calendar.current.date(
            byAdding: .day,
          value: -6,
          to: Date())
        startDate = format.string(from: earlyDate!)
        loadData()
    }
    
    func loadData(){
        caller.callAPIWeek(startDate: startDate) { response in
            guard let response = response else {
                return

            }
            results = response
        }
    }
    
}


struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ListView()
        }
    }
}
