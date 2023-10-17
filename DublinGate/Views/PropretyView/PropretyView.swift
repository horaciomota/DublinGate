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
                LazyVStack(alignment: .leading, spacing: 24) {
                    AsyncImage(url: URL(string: property.xl_picture_url ?? "")) { phase in
                        switch phase {
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(20)
                                .frame(maxWidth: .infinity, idealHeight: 250)
                        case .failure:
                            ProgressView()
                        default:
                            Rectangle()
                                .foregroundColor(.gray)
                                .cornerRadius(20)
                                .frame(maxWidth: .infinity, idealHeight: 250)
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text(property.name)
                            .font(.system(size: 18, weight: .bold))
                            .fixedSize(horizontal: false, vertical: true)
                        Text(property.street ?? "")
                            .font(.system(size: 18, weight: .medium))
                            .foregroundColor(.gray)
                            .fixedSize(horizontal: false, vertical: true)
                        Text("Price: €\(property.price ) / night")
                            .font(.system(size: 18, weight: .medium))
                            .foregroundColor(.gray)
                            .fixedSize(horizontal: false, vertical: true)
                    }
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
