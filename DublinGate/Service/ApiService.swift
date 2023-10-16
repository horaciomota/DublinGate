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
    
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let apiResponse = try JSONDecoder().decode(DublinGateResults.self, from: data)
        print("Api conected.")
        return apiResponse.results
    
}
