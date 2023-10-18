//
//  PropretyView.swift
//  DublinGate
//
//  Created by Horacio Mota on 16/10/2023.
//

import SwiftUI

struct PropretyView: View {
    @StateObject private var vm = PropretyViewModel()
    @State private var isFavorited = false
    
    var body: some View {
        
        NavigationStack {
            ScrollView(showsIndicators: false) {
                LazyVStack(alignment: .leading, spacing: 12) {
                    ForEach(vm.dublinResults) { property in
                        NavigationLink(destination: PropretyPage(property: property)) {
                            VStack(alignment: .leading) {
                                AsyncImage(url: URL(string: property.xl_picture_url ?? "")) { phase in
                                    switch phase {
                                    case .success(let image):
                                        ZStack {
                                            // Card that goes below the pic
                                            Rectangle()
                                                .foregroundColor(.gray.opacity(0.3))
                                                .cornerRadius(20)
                                                .frame(maxWidth: .infinity, idealHeight: 250)
                                            image
                                                .resizable()
                                                .scaledToFit()
                                                .cornerRadius(20)
                                                .frame(maxWidth: .infinity, idealHeight: 250)
                                        }
                                    case .failure:
                                        ZStack {
                                            Rectangle()
                                                .foregroundColor(.gray.opacity(0.3))
                                                .cornerRadius(20)
                                                .frame(maxWidth: .infinity, idealHeight: 250)
                                            ProgressView()
                                        }
                                    default:
                                        Rectangle()
                                            .foregroundColor(.gray.opacity(0.3))
                                            .cornerRadius(20)
                                            .frame(maxWidth: .infinity, idealHeight: 250)
                                    }
                                }
                                
                                VStack(alignment: .leading, spacing: 8) {
                                    Text(property.name)
                                        .font(.system(size: 18, weight: .bold))
                                        .multilineTextAlignment(.leading)
                                    
                                    Text(property.street ?? "")
                                        .font(.system(size: 18, weight: .medium))
                                        .foregroundColor(.gray)
                                        .fixedSize(horizontal: false, vertical: true)
                                        .multilineTextAlignment(.leading)
                                    
                                    Text("Price: €\(property.price ?? 0) / night")
                                        .font(.system(size: 18, weight: .medium))
                                        .foregroundColor(.gray)
                                        .fixedSize(horizontal: false, vertical: true)
                                        .multilineTextAlignment(.leading)
                                }
                                .padding(.bottom, 14) // Distance between the cards
                                
                            }
                            // Favorite/Heart
                            .overlay(
                                Button(action: {
                                    isFavorited.toggle()
                                }) {
                                    Image(systemName: isFavorited ? "heart.fill" : "heart")
                                        .font(.title)
                                        .foregroundColor(isFavorited ? .red : .gray)
                                }
                                    .padding(10)
                                    .background(Color.white)
                                    .clipShape(Circle())
                                    .shadow(radius: 3)
                                    .offset(x: -20, y: 20)
                                , alignment: .topTrailing
                            )
                        }
                    }
                }
            }
            .onAppear {
                vm.fetchPropertyData()
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
