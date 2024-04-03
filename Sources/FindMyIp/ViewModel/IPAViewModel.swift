//
//  IPAViewModel.swift
//
//
//  Created by Pavan Kumar on 03/04/24.
//

import Combine
import Foundation

public class IPAViewModel<T>: ObservableObject where T: NetworkServiceProvider {
    private var cancellable: AnyCancellable?
    let service: T
    
    @Published var ipaDetails: IPAModel?
    @Published var errorDescription: String?
    @Published var isLoading = false
    
    init(service: T = NetworkService()) {
        self.service = service
    }
    
    public func getIPADetails() {
        isLoading = true
       cancellable = service.execute(with: AbstractIPAModel()).sink { [weak self] dataResponse in
            guard let self else {return}
            if let error = dataResponse.error {
                self.errorHandler(error: error)
            } else {
                self.ipaDetails = dataResponse.value
            }
            self.isLoading = false
        }
    }
    
    private func errorHandler(error: NetworkError) {
        if let backendError = error.backendError {
            errorDescription = backendError.message
        } else {
            errorDescription = error.initialError.localizedDescription
        }
    }
    
    deinit {
        cancellable?.cancel()
    }
}
