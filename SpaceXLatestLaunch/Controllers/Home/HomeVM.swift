//
//  HomeVM.swift
//  SpaceXLatestLaunch
//
//  Created by mehmet duran on 29.09.2023.
//

import Foundation

enum HomeVMStateChange: StateChange {
    case fetchSuccess
    case showAlert(String)
}

class HomeVM: StatefulVM<HomeVMStateChange> {
    let dataSource = HomeDS()
    var networking: NetworkingProtocol
    
    init(networking: NetworkingProtocol) {
        self.networking = networking
    }
    
    func fetchLatestLaunches() {
        networking.request(router: Routers.latestLaunches) { [weak self]
            (response: LatestLaunchesModel?, error) in
            guard let self else { return }
            
            if let error {
                self.emit(.showAlert(error.errorMessage))
            } else if let response {
                self.dataSource.launchesModel = response
                self.emit(.fetchSuccess)
            }
        }
    }
}
