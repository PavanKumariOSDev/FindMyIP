//
//  File.swift
//  
//
//  Created by Pavan Kumar on 03/04/24.
//

@testable import FindMyIp
import Foundation

struct IPAModelBuilder {
    
    //MARK: Properties
    private(set) var city: String = ""
    private(set) var region: String = ""
    private(set) var countryName: String = ""
    private(set) var countryCapital: String = ""
    private(set) var organization: String = ""
    private(set) var latitude: Double = 0.0
    private(set) var longitude: Double = 0.0
    private(set) var postal: String = ""
    
    private init() {}
    
    static func model() -> IPAModelBuilder {
        return IPAModelBuilder()
    }
    
    static func hyderabdIPA() -> IPAModel {
        return model()
            .make()
    }
    
    func make() -> IPAModel {
        return IPAModel(
            city: "Hyderabad",
            region: "Telangana",
            countryName: "India",
            countryCapital: "New Delhi",
            organization: "Reliance Jio Infocomm Limited",
            latitude: 17.3724,
            longitude: 78.4378,
            postal: "500090"
        )
    }
}

struct AbstractMockIPAModel: MockURN {
    typealias Derived = IPAModel
    
    var mockDataModel: IPAModel?
    
    func getMockEncodedData() -> Data? {
        try? JSONEncoder().encode(mockDataModel)
    }
    
    func mockData() -> Derived? {
        return mockDataModel
    }
}

extension AbstractMockIPAModel {
    init(with data: IPAModel) {
        mockDataModel = data
    }
}
