//
//  NetworkServiceProvider.swift
//  
//
//  Created by Pavan Kumar on 03/04/24.
//

import Alamofire
import Combine
import Foundation

public protocol NetworkServiceProvider {
    
    associatedtype URNType

    func execute<URNType: URN>(with urnType: URNType) -> AnyPublisher<DataResponse<URNType.Derived, NetworkError>, Never>
}
