//
//  PropretyPage.swift
//  DublinGate
//
//  Created by Horacio Mota on 17/10/2023.
//

import SwiftUI

struct PropretyPage: View {
    let property: DublinGateResponse
    let nondescript: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, justo ac vehicula laoreet, tortor purus mattis lectus, ac malesuada metus metus nec purus. Vivamus suscipit justo sed libero hendrerit, ut fermentum erat ultrices. Nullam tristique, purus sit amet imperdiet fermentum, neque nisl scelerisque nulla, at accumsan nunc lorem a metus."
    
    var body: some View {
        //        Text(property.name)
        ScrollView (showsIndicators: false) {
            VStack(alignment: .leading) {
                
                AsyncImage(url: URL(string: property.xl_picture_url ?? "")) { pic in
                    switch pic {
                    case .success(let image):
                        ZStack {
                            //Card that go bellow pic
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
                
                
                Text(property.name)
                    .font(.system(size: 22, weight: .bold))
                    .fixedSize(horizontal: false, vertical: true)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 4)
                
                HStack (spacing: 12) {
                    VStack (alignment: .leading) {
                        HStack {
                            Image(systemName:"location.circle")
                                .foregroundColor(.pink)
                            Text(property.city ?? "")
                        }
                        HStack {
                            Image(systemName:"location.circle")
                                .foregroundColor(.pink)
                            Text(String(property.host_response_rate ?? 0))
                        }
                    }
                    Spacer()
                    VStack (alignment: .leading) {
                        
                        Text(String("\(property.beds ?? 0) Beds"))
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(22)
                        Text(String("\(property.bathrooms ?? 0) Bathrooms"))
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(22)
                    
                    }
                    VStack (alignment: .leading ,spacing: 8) {
                        Text(String("\(property.bedrooms ?? 0) Bedrooms"))
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(22)
                    }
                }
                .padding(.bottom, 4)
                .font(.footnote)

                
                //Host profile
                HStack {
                    AsyncImage(url: URL(string: property.host_picture_url ?? "")) { pic in
                        switch pic {
                        case .success(let image):
                            ZStack {
                                //Card that go bellow pic
                                Circle()
                                    .foregroundColor(.gray.opacity(0.3))
                                    .cornerRadius(30)
                                    .frame(maxWidth: 50, idealHeight: 50)
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(30)
                                    .frame(maxWidth: 50, idealHeight: 50)
                            }
                        case .failure:
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.gray.opacity(0.3))
                                    .cornerRadius(30)
                                    .frame(maxWidth: 50, idealHeight: 50)
                                ProgressView()
                            }
                        default:
                            Rectangle()
                                .foregroundColor(.gray.opacity(0.3))
                                .cornerRadius(30)
                                .frame(maxWidth: 50, idealHeight: 50)
                        }
                    }
                    .padding(.trailing, 8)
                    VStack (alignment: .leading) {
                        Text(property.host_name ?? "Host_Name")
                        Text("Host since: \(property.host_since ?? "Host_sINCE")")
                    }

                }
                .padding(.top, 8)
                .padding(.bottom, 8)
                
                Text(property.space ?? "\(nondescript)")
                    .font(.system(size: 18, weight: .regular))
                    .fixedSize(horizontal: false, vertical: true)
                    .multilineTextAlignment(.leading)
             
                Spacer()
                
                
                HStack {
                    VStack (alignment: .leading) {
                        Text("From $200 (person)")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.gray)
                        Text("Show all prices!")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.gray)
                            .underline()
                        
                    }
                    Spacer()
                    Text("Show Dates")
                        .padding()
                        .background(Color.pink)
                        .cornerRadius(32)
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .regular))
                    
                    
                }
                .padding(.top, 12)
                .padding(.bottom, 22)
            }
        }
        
        
    }
}

