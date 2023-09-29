//
//  LottieManager.swift
//  SpaceXLatestLaunch
//
//  Created by mehmet duran on 29.09.2023.
//

import Foundation
import Lottie

enum LottieType {
    case loading
    case splash
}

class LottieManager {
    
    static let shared = LottieManager()
    
    let animationView = LottieAnimationView()
    
    func getLottieView(toView: UIView,
                       lottieType: LottieType,
                       contentMode: UIView.ContentMode,
                       loopMode: LottieLoopMode,
                       shouldPlay: Bool = true) -> LottieAnimationView {
        animationView.animation = getLottieAnimation(for: lottieType)
        animationView.frame = toView.bounds
        animationView.contentMode = contentMode
        animationView.loopMode = .loop
        return animationView
    }
    
    private func getLottieAnimation(for lottieType: LottieType) -> LottieAnimation? {
        var resourcePath: String = ""
        switch lottieType {
            case .loading:
                resourcePath = ""
            case .splash:
                resourcePath = ""
        }
        let path = Bundle(for: type(of: self)).path(forResource: resourcePath,
                                                    ofType: "json") ?? ""
        return LottieAnimation.filepath(path)
    }
}
