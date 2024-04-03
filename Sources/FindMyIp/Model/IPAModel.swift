//
//  IPAModel.swift
//  
//
//  Created by Pavan Kumar on 03/04/24.
//

import Foundation

/// Struct to represent IP address information conforming to Codable protocol
public struct IPAModel: Codable {
    
    // Properties representing different aspects of IP address information
    let city: String
    let region: String
    let countryName: String
    let countryCapital: String
    let organization: String
    let latitude: Double
    let longitude: Double
    let postal: String
    
    // CodingKeys enum to customize the decoding/encoding of properties
    enum CodingKeys: String, CodingKey {

        // Regular properties
        case city, region, latitude, longitude, postal
        
        // Customized coding keys for certain properties
        case countryName = "country_name"
        case countryCapital = "country_capital"
        case organization = "org"
    }
}

public struct AbstractIPAModel: URN {
    public typealias Derived = IPAModel
}
