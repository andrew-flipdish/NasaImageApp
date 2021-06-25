//
//  NasaResponseViewModel.swift
//  NasaImages
//
//  Created by Andrew Teeters on 25/06/2021.
//

import Foundation

public class NasaResponseViewModel {
    
    public var results = [NasaResponse]()
    private var format: DateFormatter = DateFormatter()
    private var caller: ApiCaller = ApiCaller()
    
    private func getDate() -> String{
        self.format.dateFormat = "yyyy-MM-dd"
        let earlyDate = Calendar.current.date(
            byAdding: .day,
          value: -6,
          to: Date())
        let startDate = format.string(from: earlyDate!)
        return startDate
        
    }
    
    public func loadData(){
        let startDate = getDate()
        caller.getImagesForTheLastWeek(startDate: startDate) { response in
            guard let response = response else {
                return

            }
            self.results = response
            print(self.results)
        }
        
    }
    
}
