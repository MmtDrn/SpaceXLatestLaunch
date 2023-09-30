//
//  Date+Ext.swift
//  SpaceXLatestLaunch
//
//  Created by mehmet duran on 30.09.2023.
//

import Foundation

extension Date {
    
    public func stringValue(dateFormat: String = "YYYY-MM-dd'T'HH:mm:ss") -> String {
        var string : String = ""
        let formatter : DateFormatter = DateFormatter()
        formatter.dateFormat = dateFormat
        string = formatter.string(from: self)
        return string
    }
}
