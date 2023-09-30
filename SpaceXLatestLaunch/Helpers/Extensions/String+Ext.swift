//
//  String+Ext.swift
//  SpaceXLatestLaunch
//
//  Created by mehmet duran on 30.09.2023.
//

import UIKit

extension String {
    
    public func toDate(withFormat format: String = "yyyy-MM-dd'T'HH:mm:ss.SSSZ") -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        guard let date = dateFormatter.date(from: self) else {
            return nil
        }
        return date
    }
    
    public func multiFont(_ diffChaRange: Int,
                          diffFont: UIFont = .systemFont(ofSize: 15,
                                                          weight: .bold),
                          diffColor: UIColor = .black) -> NSMutableAttributedString {
        
        let attributedString = NSMutableAttributedString(string: self)
        let diffRange = NSRange(location: self.count - diffChaRange, length: diffChaRange)
        attributedString.addAttribute(.font, value: diffFont, range: diffRange)
        attributedString.addAttribute(.foregroundColor, value: diffColor, range: diffRange)
        
        return attributedString
    }
}
