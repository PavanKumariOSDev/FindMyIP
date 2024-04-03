//
//  MockNetworkService.swift
//
//
//  Created by Pavan Kumar on 03/04/24.
//

@testable import FindMyIp
import Alamofire
import Combine
import Foundation

struct MockNetworkService: NetworkServiceProvider {
    typealias URNType = URN
    private let delayInSeconds = 0.5
    
    func execute<URNType>(with urnType: URNType) -> AnyPublisher<DataResponse<URNType.Derived, NetworkError>, Never> where URNType : URN {
        let subject = PassthroughSubject<DataResponse<URNType.Derived, NetworkError>, Never>()
        
        DispatchQueue.global().asyncAfter(deadline: .now() + delayInSeconds) {
            
            let result: Result<URNType.Derived, NetworkError> = getMockResult(mockData: urnType)
            let response = DataResponse<URNType.Derived, NetworkError>(
                request: urnType.getMockURLRequest(),
                response: HTTPURLResponse(),
                data: urnType.getURNMockEncodedData(),
                metrics: nil,
                serializationDuration: 0.0,
                result: result
            )
            subject.send(response)
            subject.send(completion: .finished)
        }
        
        return subject.eraseToAnyPublisher()
    }
    
    private func getMockResult<T: URN>(mockData: T) -> Result<T.Derived, NetworkError>{
        if let data = mockData.getURNMockData() {
            return .success(data)
        } else {
            return .failure(NetworkError(initialError: .explicitlyCancelled, backendError: BackendError(status: "404", message: "No Data Found")))
        }
    }
}
