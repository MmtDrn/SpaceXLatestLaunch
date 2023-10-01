//
//  MockNetworking.swift
//  SpaceXLatestLaunchTests
//
//  Created by mehmet duran on 1.10.2023.
//

import XCTest
@testable import SpaceXLatestLaunch

final class MockNetworking: NetworkingProtocol {
    var result: (Decodable?, NetworkError?)?
    
     func request<T: Decodable>(router: EndpointConfiguration,
                                thread: DispatchQoS.QoSClass? = nil,
                                shouldShowLoading: Bool = false,
                                lottieType: LottieType = .loading,
                                completion: @escaping (T?, NetworkError?) -> Void) {
         if let result {
             completion(result.0 as? T, result.1)
         }
     }
    
}

struct MockDecodableModel: Decodable { }
