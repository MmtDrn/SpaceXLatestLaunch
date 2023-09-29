//
//  HomeVM.swift
//  SpaceXLatestLaunch
//
//  Created by mehmet duran on 29.09.2023.
//

import Foundation

enum HomeVMStateChange: StateChange {
    
}

class HomeVM: StatefulVM<HomeVMStateChange> {
    let dataSource = HomeDS()
    var networking: NetworkingProtocol
    
    init(networking: NetworkingProtocol) {
        self.networking = networking
    }
}
