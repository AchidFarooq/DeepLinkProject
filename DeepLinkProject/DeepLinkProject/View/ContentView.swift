//
//  ContentView.swift
//  DeepLinkProject
//
//  Created by Achid Farooq on 21/05/2023.
//

import SwiftUI
import Moya

struct ContentView: View {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @EnvironmentObject private var viewModel: GPSLocationViewModel
    @State var showList: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                if !showList {
                    Button {
                        viewModel.getListOfCoordinates()
                        showList = true
                    } label: {
                        Text(AppTitles.getListCities.rawValue)
                    }.padding(.top)
                } else {
                    GpsLocationList()
                }
            }
            .padding()
            .navigationTitle(AppTitles.navigationTitle.rawValue)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
