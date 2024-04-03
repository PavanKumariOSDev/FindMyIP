//
//  Mock URN.swift
//
//
//  Created by Pavan Kumar on 03/04/24.
//

@testable import FindMyIp
import Foundation

protocol MockURN: URN {
    func mockData() -> Derived?
    func getMockEncodedData() -> Data?
}

extension URN {
    func getMockURLRequest() -> URLRequest? {
        return getURLRequest()
    }
}
