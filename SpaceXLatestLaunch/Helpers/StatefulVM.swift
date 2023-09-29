//
//  StatefulVM.swift
//  SpaceXLatestLaunch
//
//  Created by mehmet duran on 29.09.2023.
//

import Foundation

protocol StateChange { }

protocol ValidationProtocol {
    func validate()
}

class StatefulVM<StateChange>: NSObject {
    var dispatchGroup = DispatchGroup()
    
    typealias StateChangeHandler = ((StateChange) -> Void)
    
    private var stateChangeHandler: StateChangeHandler?
    
    final func subscribe(_ handler: @escaping StateChangeHandler) {
        stateChangeHandler = handler
    }
    
    final func emit(_ change: StateChange) {
        stateChangeHandler?(change)
    }
    
}
