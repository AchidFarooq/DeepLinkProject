//
//  GPSLocationsService.swift
//  DeepLinkProject
//
//  Created by Achid Farooq on 21/05/2023.
//

import Foundation
import Moya


public protocol IGPSLocationsService: AnyObject {
    func getGpsLocations(completion: @escaping(Result<Coordinates, Error>) -> Void)
}

public final class GPSLocationsService: IGPSLocationsService {
    
    private let provider: MoyaProvider<GPSLocationsRequest>
    
    public init(provider: MoyaProvider<GPSLocationsRequest>) {
        self.provider = provider
    }
    
    private lazy var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    // MARK: - GPSLocationsService
    
    public func getGpsLocations(completion: @escaping (Result<Coordinates, Error>) -> Void) {
        provider.request(.getLocationsFromServer) { result in
            switch result {
            case .success(let response):
                do {
                    let model = try self.decoder.decode(Coordinates.self, from: response.data)
                    completion(.success(model))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
