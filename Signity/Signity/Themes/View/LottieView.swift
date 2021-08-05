//
//  LottieView.swift
//  Signity
//
//  Created by Andrean Lay on 05/08/21.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    var name: String
    var playbackSpeed: CGFloat
    var animationView = AnimationView()
    
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView(frame: .zero)
        
        animationView.animation = Animation.named(name)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.animationSpeed = playbackSpeed
        animationView.play()
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])

        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        uiView.subviews.forEach { subview in
            if let view = subview as? AnimationView {
                view.animationSpeed = self.playbackSpeed
            }
        }
    }
}
