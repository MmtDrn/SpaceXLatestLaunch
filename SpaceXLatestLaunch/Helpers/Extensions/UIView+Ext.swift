//
//  UIView+Ext.swift
//  SpaceXLatestLaunch
//
//  Created by mehmet duran on 1.10.2023.
//

import UIKit

extension UIView {
    
    public func removeSubviews() {
        subviews.forEach({ $0.removeFromSuperview() })
    }
}
