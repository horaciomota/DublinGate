//
//  ApiService.swift
//  DublinGate
//
//  Created by Horacio Mota on 16/10/2023.
//

import Foundation


func ApiService() async throws -> [DublinGateResponse] {
  
        guard let url = URL(string: "https://public.opendatasoft.com/api/explore/v2.1/catalog/datasets/airbnb-listings/records?limit=100&refine=city%3A%22Dublin%22&refine=country%3A%22Ireland%22&refine=room_type%3A%22Entire%20home%2Fapt%22") else {
            throw URLError(.badURL)
        }
    
        let (data, response) = try await URLSession.shared.data(from: url)
        if let httpResponse = response as? HTTPURLResponse {
            print("Status Code: \(httpResponse.statusCode)")

         }
    
        let apiResponse = try JSONDecoder().decode(DublinGateResults.self, from: data)
        print("Api conected.")
        return apiResponse.results
    
}

// URL COMPONENTS
//
//    var urlComponents = URLComponents()
//    urlComponents.scheme = "https"
//    urlComponents.host = "public.opendatasoft.com"
//    urlComponents.path = "/api/explore/v2.1/catalog/datasets/airbnb-listings/records"
//    urlComponents.queryItems = [
//        URLQueryItem(name: "limit", value: "100"),
//        URLQueryItem(name: "refine", value: "city:\"Dublin\""),
//        URLQueryItem(name: "refine", value: "country:\"Ireland\""),
//        URLQueryItem(name: "refine", value: "room_type:\"Entire home/apt\"")
//    ]
//
//    guard let url = urlComponents.url else {
//        throw URLError(.badURL)
//    }
