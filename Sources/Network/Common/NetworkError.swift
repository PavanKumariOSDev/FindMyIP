//
//  NetworkError.swift
//  
//
//  Created by Pavan Kumar on 03/04/24.
//

import Alamofire
import Foundation

/// Enum to represent different network errors conforming to Error and Equatable protocols
public struct NetworkError: Error {
    let initialError: AFError
    let backendError: BackendError?
}

public struct BackendError: Codable, Error {
    var status: String
    var message: String
}
