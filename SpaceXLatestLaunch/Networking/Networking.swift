//
//  Networking.swift
//  SpaceXLatestLaunch
//
//  Created by mehmet duran on 29.09.2023.
//

import Foundation
import Alamofire

class Networking {
    
    static func request<T: Decodable>(router: EndpointConfiguration,
                                      thread: DispatchQoS.QoSClass? = nil,
                                      shouldShowLoading: Bool = false,
                                      lottieType: LottieType = .loading,
                                      completion: @escaping (T?, NetworkError?) -> Void) {
        switch thread {
        case .background:
            DispatchQueue.global(qos: .background).async {
                handleRequest(router: router,
                              shouldShowLoading: shouldShowLoading,
                              lottieType: lottieType,
                              completion: completion)
            }
        default:
            handleRequest(router: router,
                          shouldShowLoading: shouldShowLoading,
                          completion: completion)
        }
    }
    
    static private func handleRequest<T: Decodable>(router: EndpointConfiguration,
                                                    shouldShowLoading: Bool = false,
                                                    lottieType: LottieType = .loading,
                                                    completion: @escaping (T?, NetworkError?) -> Void) {
        if shouldShowLoading {
            LoadingManager.shared.showLoading(fromVC: UIApplication.shared.topMostViewController, lottieType: lottieType) {
                callRequest(router: router,
                            shouldShowLoading: shouldShowLoading,
                            lottieType: lottieType,
                            completion: completion)
            }
        }
        else {
            callRequest(router: router,
                        shouldShowLoading: shouldShowLoading,
                        completion: completion)
        }
    }
    
    static private func callRequest<T: Decodable>(router: EndpointConfiguration,
                                                  shouldShowLoading: Bool = false,
                                                  lottieType: LottieType = .loading,
                                                  completion: @escaping (T?, NetworkError?) -> Void) {
        
        AF.request(router).responseDecodable(of: T.self) { response in
            
            if shouldShowLoading {
                LoadingManager.shared.dismissLoading() {
                    handleResponse(response: response, completion: completion)
                }
            } else {
                handleResponse(response: response, completion: completion)
            }
        }
    }
    
    static private func handleResponse<T: Decodable>(response: DataResponse<T, AFError>,
                                                     completion: @escaping (T?, NetworkError?) -> Void) {
        printLog(response: response)
        switch response.result {
        case .success(let data):
            guard let validatedStatusCode = response.response?.statusCode else { return }
            switch validatedStatusCode {
            case 200..<300:
                completion(data, nil)
            case 406:
                completion(nil, .notValidOtpCode)
            case 417:
                completion(nil, .redirectAuth)
            case 423:
                completion(nil, .authenticationLocked)
            default:
                completion(nil, .noError)
            }
        case .failure:
            if !ConnectionManager.isConnectedToNetwork() {
                completion(nil, .notConnectedInternet)
            }
            else {
                completion(nil, .noError)
            }
        }
    }
    
    static private func printLog<T: Decodable>(response: AFDataResponse<T>) {
        print("\n\n\n")
        print("🌐🌐🌐🌐🌐🌐🌐🌐🌐🌐🌐🌐🌐🌐🌐🌐🌐🌐🌐🌐🌐")
        debugPrint(response)
        print("🌐🌐🌐🌐🌐🌐🌐🌐🌐🌐🌐🌐🌐🌐🌐🌐🌐🌐🌐🌐🌐")
        print("\n\n\n")
    }
}
