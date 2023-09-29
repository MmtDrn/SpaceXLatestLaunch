//
//  NetworkingProtocol.swift
//  SpaceXLatestLaunch
//
//  Created by mehmet duran on 29.09.2023.
//

import Foundation

protocol NetworkingProtocol {
    func request<T: Decodable>(router: EndpointConfiguration,
                               thread: DispatchQoS.QoSClass?,
                               shouldShowLoading: Bool,
                               lottieType: LottieType,
                               completion: @escaping (T?, NetworkError?) -> Void)
}

extension NetworkingProtocol {
    func request<T: Decodable>(router: EndpointConfiguration,
                               thread: DispatchQoS.QoSClass? = nil,
                               shouldShowLoading: Bool = false,
                               lottieType: LottieType = .loading,
                               completion: @escaping (T?, NetworkError?) -> Void) {
        
        request(router: router,
                thread: thread,
                shouldShowLoading: shouldShowLoading,
                lottieType: lottieType,
                completion: completion)
    }
}
