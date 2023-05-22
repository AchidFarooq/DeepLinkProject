//
//  ServiceUnitTests.swift
//  DeepLinkProjectUnitTests
//
//  Created by Achid Farooq on 22/05/2023.
//

import XCTest
import Moya
import Alamofire
@testable import DeepLinkProject

final class ServiceUnitTests: XCTestCase {
    
    var viewmodel: GPSLocationViewModel!

    override func setUpWithError() throws {
        let session = Session(delegate: SessionDelegate(fileManager: .default))
        let service = GPSLocationsService(provider: MoyaProvider<GPSLocationsRequest>(session: session))
        viewmodel = GPSLocationViewModel(MoyaProvider<GPSLocationsRequest>(stubClosure: MoyaProvider.immediatelyStub), service: service)
    }

    override func tearDownWithError() throws {
        viewmodel = nil
    }

    func testExample() throws {
    }

    func testPerformanceExample() throws {
    }
    
    func testInitialisationViewModel() {
        XCTAssertNotNil(viewmodel, "The view model should not be nil.")
    }
    
    func testGetCoordinatesAPIToSucceed() {
        // to return 200 from cloud
        let data = SampleData.jsonFromCloudReal
        
        let customEndpointClosure = { (target: GPSLocationsRequest) -> Endpoint in
            return Endpoint(url: URL(target: target).absoluteString,
                            sampleResponseClosure: { .networkResponse(200 , data) },
                            method: target.method,
                            task: target.task,
                            httpHeaderFields: target.headers)
        }
        
        var service: IGPSLocationsService!
        service = GPSLocationsService(provider: MoyaProvider<GPSLocationsRequest>(endpointClosure: customEndpointClosure, stubClosure: MoyaProvider<GPSLocationsRequest>.immediatelyStub))

        service.getGpsLocations { result in
            switch result {
                case .failure(_):
                XCTFail()
                case .success(let result):
                XCTAssertEqual(result.locations.count, 4)
            }
        }
    }
    
    func testGetCoordinatesAPIToFail() {
        // to return 401 from cloud
        let data = SampleData.jsonFromCloudReal
        
        let customEndpointClosure = { (target: GPSLocationsRequest) -> Endpoint in
            return Endpoint(url: URL(target: target).absoluteString,
                            sampleResponseClosure: { .networkResponse(401 , data) },
                            method: target.method,
                            task: target.task,
                            httpHeaderFields: target.headers)
        }
        
        var service: IGPSLocationsService!
        service = GPSLocationsService(provider: MoyaProvider<GPSLocationsRequest>(endpointClosure: customEndpointClosure, stubClosure: MoyaProvider<GPSLocationsRequest>.immediatelyStub))

        service.getGpsLocations { result in
            switch result {
                case .failure(_):
                XCTAssert(true)
                case .success(_):
                XCTFail()
            }
        }
    }
}
