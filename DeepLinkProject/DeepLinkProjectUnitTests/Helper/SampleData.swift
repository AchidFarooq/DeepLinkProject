//
//  SampleData.swift
//  DeepLinkProjectUnitTests
//
//  Created by Achid Farooq on 22/05/2023.
//

import Foundation

class SampleData {
    
    static var jsonFromCloudReal = """
        {
            "locations":
            [
              {
                "name": "Amsterdam",
                "lat": 52.3547498,
                "long": 4.8339215
              },
              {
                "name": "Mumbai",
                "lat": 19.0823998,
                "long": 72.8111468
              },
              {
                "name": "Copenhagen",
                "lat": 55.6713442,
                "long": 12.523785
              },
              {
                "lat": 40.4380638,
                "long": -3.7495758
              }
            ]
          }
        """.data(using: .utf8)!
    
    static var jsonFromCloudCustom = """
        {
            "locations":
            [
              {
                "name": "Kabul",
                "lat": 34.5553,
                "long": 69.2075
              },
              {
                "name": "Hawaii",
                "lat": 19.8987,
                "long": 155.6659
              },
              {
                "name": "New York",
                "lat": 40.7128,
                "long": 74.0060
              },
              {
                "lat": 55.7558,
                "long": -3.7495758
              },
              {
                "name": "Amsterdam",
                "lat": 52.3547498,
                "long": 4.8339215
              },
              {
                "name": "Mumbai",
                "lat": 19.0823998,
                "long": 72.8111468
              },
              {
                "name": "Copenhagen",
                "lat": 55.6713442,
                "long": 12.523785
              },
              {
                "lat": 40.4380638,
                "long": -3.7495758
              }
            ]
          }
        """.data(using: .utf8)!
}
