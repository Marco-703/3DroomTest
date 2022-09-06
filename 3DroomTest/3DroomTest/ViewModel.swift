//
//  ViewModel.swift
//  3DroomTest
//
//  Created by Marco Rapp on 04.09.22.
//

import Foundation



struct Data{
    var selectedRoom:String
}


class ViewModel: ObservableObject{
    
    static let main = ViewModel()
    
    @Published var data = Data(selectedRoom: "none")
}
