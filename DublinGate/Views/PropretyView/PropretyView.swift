//
//  PropretyView.swift
//  DublinGate
//
//  Created by Horacio Mota on 16/10/2023.
//

import SwiftUI

struct PropretyView: View {
    @State private var dublinResults: [DublinGateResponse] = []
    
    var body: some View {
        VStack {
            Rectangle()
                .foregroundColor(.blue)
                .frame(maxWidth: .infinity, maxHeight: 350)
            
            VStack(alignment: .leading) {
                Text("Nome da propriedade")
                Text("Endereco da propriedade")
                Text("Preco da propriedade")
            }   
            
            Spacer()
        }
        .onAppear {
            Task {
                do {
                    dublinResults = try await ApiService()
                } catch {
                    print("Error fetching data: \(error)")
                }
            }
        }

      
        


    }
}

struct PropretyView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            PropretyView()
        }.padding(.horizontal)
            
    }
}
