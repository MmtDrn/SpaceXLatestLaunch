//
//  HomeDS.swift
//  SpaceXLatestLaunch
//
//  Created by mehmet duran on 29.09.2023.
//

import UIKit

enum HomeDSStateChange: StateChange {
    
}

class HomeDS: StatefulDS<HomeDSStateChange> {
    let allCase = LaunchCases.allCases
    var launchesModel = LatestLaunchesModel()
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
        default:
            let cell = UITableViewCell()
            
            cell.backgroundColor = .red
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let currentCase = allCase[indexPath.section]
        switch currentCase {
        case .main:
            return 250
        default: return 100
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return allCase[section].title
    }
}
