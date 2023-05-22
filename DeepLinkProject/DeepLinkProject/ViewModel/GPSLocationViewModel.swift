//
//  GPSLocationViewModel.swift
//  DeepLinkProject
//
//  Created by Achid Farooq on 21/05/2023.
//

import Foundation
import Moya
import Alamofire
import UIKit
import MapKit

class GPSLocationViewModel: ObservableObject{
    
    private var provider: MoyaProvider<GPSLocationsRequest>?
    private var service: GPSLocationsService?
    @Published var allLocations: Coordinates?
    
    init(_ provider: MoyaProvider<GPSLocationsRequest>, service: GPSLocationsService) {
        self.provider = provider
        self.service = service
    }
    
    func getListOfCoordinates() {
        service?.getGpsLocations(completion: { result in
            switch result {
            case .success(let response):
                self.allLocations = response
            case .failure(let error):
                // Handle error
                print(error)
            }
        })
    }
    
    func handleDeepLink(_ gps: GPSLocation) {
        var city: String = ""
        
        // If GPS location has a link send cityname to wikipedia app
        if let cityName = gps.name {
            city = cityName
            openURLCustom(city)
        } else {
            // If GPS location does not have a cityname -> look up coordinates and send closest city name
            getLocationFromCoordinates(lat: gps.lat, long: gps.long) { result in
                if let cityName = result {
                    if !cityName.isEmpty {
                        self.openURLCustom(cityName)
                    }
                }
            }
        }
    }
    
    func getLocationFromCoordinates(lat: Double, long: Double, completion: @escaping (String?) -> Void) {
        let location = CLLocation(latitude: lat, longitude: long)
        location.placemark { placemark, error in
            guard let placemark = placemark else {
                completion(nil)
                return
            }
            completion(placemark.city ?? "")
        }
    }
    
    func openURLCustom(_ city: String) {
        UIApplication.shared.open(URL(string: "wikipedia://places=$$$\(city)$$$")!)
    }
    
    func getRightCityName(_ name: String?) -> String {
        return name ?? "- No name -"
    }
}
