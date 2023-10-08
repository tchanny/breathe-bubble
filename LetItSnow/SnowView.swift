//
//  SnowView.swift
//  breathe
//
//  Created by Tchannikov Daniil on 03/10/2023.
//

import UIKit
import Lottie

class SnowView: UIView {
    
    let animationURL = URL(string: "https://assets-v2.lottiefiles.com/a/6710c6f0-1189-11ee-972b-6fc82e93974c/EvsVORj19i.json")!
    
    lazy var animationView: AnimationView = {
        let animationView = AnimationView()
        animationView.contentMode = .scaleAspectFill
        animationView.loopMode = .loop
        animationView.isUserInteractionEnabled = false // so that we don't cancel touches on the background
        return animationView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // so that we don't cancel touches on the background
        isUserInteractionEnabled = false
        
        // add animation view and constraint to self
        addSubview(animationView)
        animationView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            animationView.leadingAnchor.constraint(equalTo: leadingAnchor),
            animationView.trailingAnchor.constraint(equalTo: trailingAnchor),
            animationView.topAnchor.constraint(equalTo: topAnchor),
            animationView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        // load and play animation
        Animation.loadedFrom(url: animationURL, closure: { [weak self] (animation) in
            self?.animationView.animation = animation
            self?.animationView.play()
        }, animationCache: LRUAnimationCache.sharedCache)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension UIView {
    /// Adds snow view and constraint to self
    func startSnowing() {
        stopSnowing()
        
        let snowView = SnowView(frame: .zero)
        addSubview(snowView)
        snowView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            snowView.leadingAnchor.constraint(equalTo: leadingAnchor),
            snowView.trailingAnchor.constraint(equalTo: trailingAnchor),
            snowView.topAnchor.constraint(equalTo: topAnchor),
            snowView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    /// Remove snow view
    func stopSnowing() {
        subviews
            .filter({ $0 is SnowView })
            .forEach({ $0.removeFromSuperview() })
    }
}
