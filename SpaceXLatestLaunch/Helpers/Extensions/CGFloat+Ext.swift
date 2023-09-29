//
//  CGFloat+Ext.swift
//  SpaceXLatestLaunch
//
//  Created by mehmet duran on 29.09.2023.
//

import UIKit

extension CGFloat {
    
    ///414 -> template design device width
    ///896 -> template design device height
    
    static func setPadding(_ paddingType: PaddingType) -> CGFloat {
        switch paddingType {
        case .witdh(let value):
            let padding = UIScreen.main.bounds.width * (value/414)
            return padding
        case .height(let value):
            let padding = UIScreen.main.bounds.height * (value/896)
            return padding
        }
    }
}
