//
//  ContentView.swift
//  3DroomTest
//
//  Created by Marco Rapp on 04.09.22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ViewModel = ViewModel.main
    
    var body: some View {
        HStack(spacing:0){
            ZStack{
                Color.gray
                Text(viewModel.data.selectedRoom)
            }
            ScenekitView()
                .frame(width: 800)
        }
    }
}

struct ContentView_Previews: PreviewProvider {

    static var previews: some View {
        ContentView()
    }
}
