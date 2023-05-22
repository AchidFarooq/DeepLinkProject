//
//  GpsLocationList.swift
//  DeepLinkProject
//
//  Created by Achid Farooq on 22/05/2023.
//

import SwiftUI

struct GpsLocationList: View {
    @EnvironmentObject private var viewModel: GPSLocationViewModel
    @State private var showSpinner: Bool = false
    
    var body: some View {
        List {
            if let coordinates = viewModel.allLocations {
                ForEach(coordinates.locations, id: \.self) { location in
                    Text(viewModel.getRightCityName(location.name))
                        .onTapGesture {
                            viewModel.handleDeepLink(location)
                        }
                }
            }
        }.scrollContentBackground(.hidden)
    }
}

struct GpsLocationList_Previews: PreviewProvider {
    static var previews: some View {
        GpsLocationList()
    }
}
