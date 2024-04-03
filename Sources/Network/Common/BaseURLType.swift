//
//  BaseURLType.swift
//  
//
//  Created by Pavan Kumar on 03/04/24.
//

import Foundation

/// Enum to represent different types of base URLs
public enum BaseURLType {
    case ipaddress
    
    var value: String {
        switch self {
        case .ipaddress:
            return "https://ipapi.co/json/"
        }
    }
}
