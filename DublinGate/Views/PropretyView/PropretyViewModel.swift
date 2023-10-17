//
//  PropretyViewModel.swift
//  DublinGate
//
//  Created by Horacio Mota on 16/10/2023.
//

import SwiftUI

class PropretyViewModel: ObservableObject {
    @Published var dublinResults: [DublinGateResponse] = []

    func fetchPropertyData() {
        Task {
            do {
                dublinResults = try await ApiService()
            } catch {
                print("Error fetching data: \(error)")
            }
        }
    }
    
}



