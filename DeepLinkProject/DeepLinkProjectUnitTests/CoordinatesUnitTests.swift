//
//  DeepLinkProjectUnitTests.swift
//  DeepLinkProjectUnitTests
//
//  Created by Achid Farooq on 22/05/2023.
//

import XCTest
import Moya
import Alamofire
@testable import DeepLinkProject

final class CoordinatesUnitTests: XCTestCase {
    
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
    
    func testRightCityNameToSucceed() {
        let coordinatesLat = 52.160114
        let coordinatesLong = 4.497010
        
        let expectation = self.expectation(description: "CityName")

        var cityName = ""
        viewmodel.getLocationFromCoordinates(lat: coordinatesLat, long: coordinatesLong) { cityResult in
            cityName = cityResult!
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
        
        XCTAssertEqual(cityName, "Leiden")
    }
    
    func testRightCityNameToFail() {
        let coordinatesLat = 62.160114
        let coordinatesLong = 4.497010
        
        let expectation = self.expectation(description: "CityName")

        var cityName = ""
        viewmodel.getLocationFromCoordinates(lat: coordinatesLat, long: coordinatesLong) { cityResult in
            cityName = cityResult!
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
        
        XCTAssertNotEqual(cityName, "Leiden")
    }
}
