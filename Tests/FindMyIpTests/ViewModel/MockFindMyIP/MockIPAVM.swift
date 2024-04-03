//
//  File.swift
//  
//
//  Created by Pavan Kumar on 03/04/24.
//

@testable import FindMyIp
import Combine
import XCTest

class MockIPAVM: XCTestCase {
    var viewModel: IPAViewModel<MockNetworkService>?
    var cancellable: AnyCancellable?
    
    override func setUp() {
        super.setUp()
        viewModel = IPAViewModel(service: MockNetworkService())
    }
    
    override func tearDown() {
        viewModel = nil
        cancellable = nil
        super.tearDown()
    }
    
    func testFindMyIpSuccessService() {
        var ipaDetails: IPAModel?
        var failureError: NetworkError?
        
        let expectation = XCTestExpectation(description: "Fetch IP details")
        cancellable = viewModel?.service.execute(with: AbstractMockIPAModel(with: IPAModelBuilder.hyderabdIPA())).sink { response in
            switch response.result {
            case .success(let data):
                ipaDetails = data
            case .failure(let error):
                failureError = error
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
        
        XCTAssertNotNil(ipaDetails)
        XCTAssertNil(failureError)
    }
    
    func testFindMyIpEmptyService() {
        var ipaDetails: IPAModel?
        var failureError: NetworkError?
        
        let expectation = XCTestExpectation(description: "Failure fetching IP details")
        cancellable = viewModel?.service.execute(with: AbstractMockIPAModel()).sink { response in
            switch response.result {
            case .success(let data):
                ipaDetails = data
            case .failure(let error):
                failureError = error
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
        
        XCTAssertNotNil(failureError)
        XCTAssertNil(ipaDetails)
    }
}
