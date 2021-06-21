//
//  ApiCaller.swift
//  NasaImages
//
//  Created by Andrew Teeters on 17/06/2021.
//

import Foundation

class ApiCaller {
    
    let api: String = "https://api.nasa.gov/planetary/apod"
    private let apiKey: String = "?api_key=kpWcz70K1HKjXNnvfiTXnJ8P5Z8pOkWEMy5hxOgO"
    
    func callAPIWeek(startDate: String, completion: @escaping (([NasaResponse]?) -> Void)){
        guard let url = URL(string: "\(api)\(apiKey)&start_date=\(startDate)") else {
            print("Invalid URL")
            completion(nil)
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) {data, response, error in
            guard let data = data, let decodedResponse = try? JSONDecoder().decode([NasaResponse].self, from: data) else {
                print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
                completion(nil)
                return
            }
            DispatchQueue.main.async {
                completion(decodedResponse)
            }
        }.resume()
        
    }
    
}
