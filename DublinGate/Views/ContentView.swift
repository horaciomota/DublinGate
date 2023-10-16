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
                        Text(String(result.price))
//                        Text(result.name )
//                        Text(result.description ?? "Sem descricao")

                        AsyncImage(url: URL(string: result.xl_picture_url ?? "no pic")) { phase in
                            if let image = phase.image {
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .cornerRadius(20)
                                        .frame(width: 150, height: 200)
                                        
                                } else {
                                    Rectangle()
                                        .frame(width: 150, height: 200)
                                        .cornerRadius(20)                }
                            }

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
