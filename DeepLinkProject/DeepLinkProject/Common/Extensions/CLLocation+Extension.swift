//
//  CLLocation+Extension.swift
//  DeepLinkProject
//
//  Created by Achid Farooq on 22/05/2023.
//

import Foundation
import MapKit

extension CLLocation {
    func placemark(completion: @escaping (_ placemark: CLPlacemark?, _ error: Error?) -> ()) {
        CLGeocoder().reverseGeocodeLocation(self) { completion($0?.first, $1) }
    }
}
