//
//  URN.swift
//  
//
//  Created by Pavan Kumar on 03/04/24.
//

import Alamofire
import Foundation

/// Protocol to represent a URN with associated properties and methods
public protocol URN {
    
    associatedtype Derived: Codable
    var baseURLType: BaseURLType { get }
    var method: HTTPMethod { get }
    // Add API endpoint, API keys, parameters, urlQueryItems of the URN etc.,
    
    func getURLRequest() -> URLRequest?
}

public extension URN {
    var baseURLType: BaseURLType {
        return .ipaddress
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    func getURLRequest() -> URLRequest? {
        let urlComponents = URLComponents(string: baseURLType.value)
        // Create a urlRequest with respect to the urlComponents, endpoints etc.,
        guard let url = urlComponents?.url else {
            return nil
        }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        return request
    }
}
