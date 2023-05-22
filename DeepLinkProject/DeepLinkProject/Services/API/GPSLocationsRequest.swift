//
//  GPSLocationsRequest.swift
//  DeepLinkProject
//
//  Created by Achid Farooq on 21/05/2023.
//

import Foundation
import Moya

public enum GPSLocationsRequest {
    case getLocationsFromServer
}

extension GPSLocationsRequest: TargetType {
    public var baseURL: URL { return URL(string: "https://raw.githubusercontent.com/")! }
    
    public var path: String {
        switch self {
        case .getLocationsFromServer:
            return "abnamrocoesd/assignment-ios/main/locations.json"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .getLocationsFromServer:
            return .get
        }
    }
    
    public var sampleData: Data { Data() }
    
    public var task: Task {
        switch self {
        case .getLocationsFromServer:
            return .requestPlain
        }
    }
    
    public var headers: [String : String]? {
        switch self {
        case .getLocationsFromServer:
            return ["Accept": "application/json", "Cache-Control": "no-store", "Content-Type": "application/json"]
        }
    }
    
    public var validationType: ValidationType { return .successCodes }
}
