//
//  _DroomTestApp.swift
//  3DroomTest
//
//  Created by Marco Rapp on 04.09.22.
//

import SwiftUI

@main
struct _DroomTestApp: App {
    //@StateObject var viewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .navigationViewStyle(StackNavigationViewStyle())
                .statusBar(hidden: true)
               // .environmentObject(viewModel)
        }
    }
}
