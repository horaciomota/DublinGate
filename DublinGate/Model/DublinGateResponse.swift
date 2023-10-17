//
//  DublinGateResponse.swift
//  DublinGate
//
//  Created by Horacio Mota on 16/10/2023.
//

import Foundation

struct DublinGateResponse: Codable, Identifiable {
    
    //Basic Info Model
    let id: String
    let name: String
    let sumary: String?
    let space: String?
    let description: String?
    let neighborhood_overview: String?
    let notes: String?
    let xl_picture_url: String? //Main picture of the apartment
    let thumbnail_url: String?
    let thumbnailURL, mediumURL: String?
    let xlPictureURL: String?
    let price: Int
    
    //HostModel
    let host_name: String?
    let host_since: String?
    let host_about: String?
    let host_response_rate: Int?
    let host_thumbnail_url: String?
    let host_picture_url: String?
    
    //Apt info
    let street: String?
    let city: String?
    let zipcode: String?
    let latitude: String?
    let longitude :String?
    
    //About the proprety
    let property_type: String?
    let room_type: String?
    let accommodates: Int?
    let bathrooms: Double?
    let bedrooms: Int?
    let beds: Int?
   
}
