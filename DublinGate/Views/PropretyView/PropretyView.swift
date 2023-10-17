//
//  PropretyView.swift
//  DublinGate
//
//  Created by Horacio Mota on 16/10/2023.
//

import SwiftUI

struct PropretyView: View {
    @StateObject private var vm = PropretyViewModel()
    
    var body: some View {
        ScrollView {
            ForEach(vm.dublinResults) { property in
                LazyVStack {
                    AsyncImage(url: URL(string: property.xl_picture_url ?? "")) { phase in
                        switch phase {
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(20)
                                .frame(maxWidth: .infinity)
                        case .failure:
                            ProgressView()
                        default:
                            ProgressView()
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text(property.name)
                            .font(.system(size: 18, weight: .bold))
                        Text(property.street ?? "")
                            .font(.system(size: 18, weight: .medium))
                            .foregroundColor(.gray)
                        Text("Price: €\(property.price ) / night")
                            .font(.system(size: 18, weight: .medium))
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                }
            }
        }
        .onAppear {
            vm.fetchPropertyData()
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
