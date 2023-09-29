//
//  LoadingManager.swift
//  SpaceXLatestLaunch
//
//  Created by mehmet duran on 29.09.2023.
//

import Lottie
import UIKit
import SnapKit

class LoadingManager: UIViewController {
    
    let loadingVC = LoadingVC()
    static let shared = LoadingManager()
    
    func getRootViewController() -> UIViewController? {
        
        let sceneDelegate = UIApplication.shared.delegate as? SceneDelegate
        sceneDelegate?.window?.makeKeyAndVisible()
        
        return (UIApplication.shared.delegate as? SceneDelegate)?.window?.rootViewController
    }

    
    func showLoading(fromVC: UIViewController?, lottieType: LottieType,
                            completionHandler: @escaping () -> Void) {
        loadingVC.lottieType = lottieType
        loadingVC.modalPresentationStyle = .overFullScreen
        loadingVC.modalTransitionStyle = .crossDissolve
        fromVC?.present(loadingVC, animated: true) {
            completionHandler()
        }
    }
    
    func dismissLoading(completionHandler: (() -> Void)? = nil) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.loadingVC.dismiss(animated: true) {
                completionHandler?()
            }
        }
    }
}
