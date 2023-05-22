//
//  GPSLocationsAssembly.swift
//  DeepLinkProject
//
//  Created by Achid Farooq on 21/05/2023.
//

import Foundation
import Moya

public protocol IGPSLocationsAssembly {
    func assemble() -> IGPSLocationsService
}

public final class GPSLocationsAssembly: IGPSLocationsAssembly {
    
    private lazy var session = Session()
    private lazy var provider = MoyaProvider<GPSLocationsRequest>(session: session)

    public init() {}
    
    public func assemble() -> IGPSLocationsService {
        let service = GPSLocationsService(provider: provider)
        return service
    }
}
