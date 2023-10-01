//
//  HomeDS.swift
//  SpaceXLatestLaunch
//
//  Created by mehmet duran on 29.09.2023.
//

import UIKit

enum HomeDSStateChange: StateChange {
    case presentToggle
}

class HomeDS: StatefulDS<HomeDSStateChange> {
    let allCase = LaunchCases.allCases
    var launchesModel = LatestLaunchesModel()
    var crewArray = [CrewModel]()
    var rocketModel = RocketModel()
    var capsuleArray = [CapsuleModel]()
    var launchpadModel = LaunchPadsModel()
}

extension HomeDS: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return allCase.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentCase = allCase[indexPath.section]
        
        switch currentCase {
        case .main:
            let cell = tableView.dequeueReusableCell(withIdentifier: MainCell.description(), for: indexPath) as! MainCell
            
            cell.configViews(model: launchesModel)
            
            return cell
        case .crew:
            let cell = tableView.dequeueReusableCell(withIdentifier: CommonCell.description(), for: indexPath) as! CommonCell
            
            cell.delegate  = self
            cell.configViews(launchesCases: currentCase, crewArray: crewArray)
            
            return cell
        case .rocket:
            let cell = tableView.dequeueReusableCell(withIdentifier: CommonCell.description(), for: indexPath) as! CommonCell
            
            cell.delegate  = self
            cell.configViews(launchesCases: currentCase, rocketModel: self.rocketModel)
            
            return cell
        case .launchPad:
            let cell = tableView.dequeueReusableCell(withIdentifier: CommonCell.description(), for: indexPath) as! CommonCell
            
            cell.delegate  = self
            cell.configViews(launchesCases: currentCase, launchpadModel: self.launchpadModel)
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let currentCase = allCase[indexPath.section]
        switch currentCase {
        case .main:
            return .setPadding(.height(250))
        default: return UITableView.automaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .setPadding(.height(10))
    }
}

extension HomeDS: CommonCellProtocol {
    
    func presentToggle() {
        emit(.presentToggle)
    }
}
