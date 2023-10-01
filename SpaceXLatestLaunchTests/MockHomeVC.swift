//
//  MockHomeVC.swift
//  SpaceXLatestLaunchTests
//
//  Created by mehmet duran on 1.10.2023.
//

@testable import SpaceXLatestLaunch

final class MockHomeVC {
    
    private let viewModel: HomeVM
    
    var fetchSuccess: Bool = false
    var crewFetchSuccess: Bool = false
    var rocketFetchSuccess: Bool = false
    var launchpadFetchSuccess: Bool = false
    var errorMessage: String = ""
    
    init(viewModel: HomeVM) {
        self.viewModel = viewModel
        observeViewModel()
    }
    
    private func observeViewModel() {
        viewModel.subscribe { [weak self] state in
            guard let self else { return }
            switch state {
                
            case .fetchSuccess:
                self.fetchSuccess = true
            case .crewFetchSuccess:
                self.crewFetchSuccess = true
            case .rocketFetchSuccess:
                self.rocketFetchSuccess = true
            case .launchpadFetchSuccess:
                self.launchpadFetchSuccess = true
            case .showAlert(let message):
                self.errorMessage = message
            }
        }
    }
}
