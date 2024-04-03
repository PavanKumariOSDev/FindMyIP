//
//  File.swift
//  
//
//  Created by Pavan Kumar on 03/04/24.
//
@testable import FindMyIp
import Foundation

extension URN {
    func getURNMockEncodedData() -> Data? {
        switch self {
        case let dataModel as AbstractMockIPAModel:
            dataModel.getMockEncodedData()
        default:
            nil
        }
    }
    
    func getURNMockData() -> Derived? {
        if let data = self.getURNMockEncodedData() {
            try? JSONDecoder().decode(Derived.self, from: data)
        } else {
            nil
        }
    }
}
