//
//  ContentView.swift
//  DublinGate
//
//  Created by Horacio Mota on 16/10/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var dublinResults: [DublinGateResponse] = []
        var body: some View {
            NavigationView {
                List {
                    ForEach(dublinResults, id: \.id) { result in
                        Text(result.description ?? "Sem descricao")

                    }
                }
                .onAppear {
                    Task {
                        do {
                            let results = try await ApiService()
                            dublinResults = results
                        } catch {
                            print("Erro ao chamar ApiService: \(error)")
                        }
                    }
                }
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
