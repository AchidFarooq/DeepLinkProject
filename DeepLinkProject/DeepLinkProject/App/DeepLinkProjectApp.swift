//
//  DeepLinkProjectApp.swift
//  DeepLinkProject
//
//  Created by Achid Farooq on 21/05/2023.
//

import SwiftUI
import Moya
import Alamofire

@main
struct DeepLinkProjectApp: App {
    
    private var session = Session(delegate: SessionDelegate(fileManager: .default))
    @StateObject var viewModel: GPSLocationViewModel

    init() {
        let session = Session(delegate: SessionDelegate(fileManager: .default))
        let provider = MoyaProvider<GPSLocationsRequest>(session: session)
        let service = GPSLocationsService(provider: MoyaProvider<GPSLocationsRequest>(session: session))
        _viewModel = StateObject(wrappedValue: GPSLocationViewModel(provider, service: service))
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
