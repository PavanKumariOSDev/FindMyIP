//
//  FindMyIp.swift
//  
//
//  Created by Pavan Kumar on 03/04/24.
//

import SwiftUI

public struct FindMyIp: View {
    @ObservedObject var ipaViewModel = IPAViewModel()
    
    public init() {}
    
    public var body: some View {
        VStack {
            conditionalListView()
        }
        .onAppear {
            ipaViewModel.getIPADetails()
        }
    }
    
    @ViewBuilder
    public func conditionalListView() -> some View {
        if ipaViewModel.isLoading {
            // Loading state
            ProgressView("Loading...")
        } else if let ipaDetails = ipaViewModel.ipaDetails {
            Text("IP Details: \(ipaDetails.city), \(ipaDetails.countryName)")
        } else if let errorDescription = ipaViewModel.errorDescription {
            // Error state
                Text("Error: \(errorDescription)")
        } else {
            Text("No Data")
        }
    }
}

#Preview {
    FindMyIp()
}
