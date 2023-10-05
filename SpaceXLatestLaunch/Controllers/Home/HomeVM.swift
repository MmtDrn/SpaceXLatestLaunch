//
//  HomeVM.swift
//  SpaceXLatestLaunch
//
//  Created by mehmet duran on 29.09.2023.
//

import Foundation

enum HomeVMStateChange: StateChange {
    case fetchSuccess
    case crewFetchSuccess
    case rocketFetchSuccess
    case launchpadFetchSuccess
    case showAlert(String)
}

class HomeVM: StatefulVM<HomeVMStateChange> {
    let dataSource = HomeDS()
    var networking: NetworkingProtocol
    var latestLaunchManager: LatestLaunchManagerProtocol
    
    var launchesModel = LatestLaunchesModel()
    private var crewArray = [CrewModel]()
    private var capsuleArray = [CapsuleModel]()
    
    init(networking: NetworkingProtocol, latestLaunchManager: LatestLaunchManagerProtocol) {
        self.networking = networking
        self.latestLaunchManager = latestLaunchManager
    }
    
    func fetchLatestLaunches() {
        networking.request(router: Routers.latestLaunches, shouldShowLoading: true) { [weak self]
            (response: LatestLaunchesModel?, error) in
            guard let self else { return }
            
            if let error {
                self.emit(.showAlert(error.errorMessage))
            } else if let response {
                self.launchesModel = response
                self.dataSource.launchesModel = response
                self.latestLaunchManager.latestLaunch = response
                LiveActivityManager.shared.startActivity(endDate:response.dateUtc)
                self.fetchCrew()
                self.emit(.fetchSuccess)
            }
        }
    }
    
    func fetchCrew() {
        guard let crews = self.launchesModel.crew else { return }
        let dispatchGroup = DispatchGroup()
        self.crewArray.removeAll()

        for crew in crews {
            dispatchGroup.enter()
            networking.request(router: Routers.crew(id: crew)) { [weak self]
                (response: CrewModel?, error) in
                guard let self else { return }

                if let error {
                    self.emit(.showAlert(error.errorMessage))
                } else if let response {
                    self.crewArray.append(response)
                    self.emit(.crewFetchSuccess)
                }
                dispatchGroup.leave()
            }
        }
        dispatchGroup.notify(queue: .main) {
            self.fetchRocket()
            self.fetchLaunchpad()
            self.dataSource.crewArray = self.crewArray
            self.emit(.crewFetchSuccess)
        }
    }
    
    func fetchRocket() {
        guard let rocket = self.launchesModel.rocket else { return }
        
        networking.request(router: Routers.rocket(id: rocket)) { [weak self]
            (response: RocketModel?, error) in
            guard let self else { return }
            
            if let error {
                self.emit(.showAlert(error.errorMessage))
            } else if let response {
                self.dataSource.rocketModel = response
                self.emit(.rocketFetchSuccess)
            }
        }
    }
    
    func fetchLaunchpad() {
        guard let launchpad = self.launchesModel.launchPad else { return }
        
        networking.request(router: Routers.launchPads(id: launchpad)) {[weak self]
            (response: LaunchPadsModel?, error) in
            guard let self else { return }
            
            if let error {
                self.emit(.showAlert(error.errorMessage))
            } else if let response {
                self.dataSource.launchpadModel = response
                self.emit(.launchpadFetchSuccess)
            }
        }
    }
}
