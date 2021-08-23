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
        
        self.loadAnimation()
        animationView.contentMode = .scaleAspectFit
        animationView.backgroundBehavior = .pauseAndRestore
        animationView.loopMode = .loop
        animationView.animationSpeed = playbackSpeed
        
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
        
        if self.name != PracticeVideoQueue.shared.videoName {
            DispatchQueue.global(qos: .background).async {
                let newAnimation = Animation.named(self.name)
                
                DispatchQueue.main.async {
                    context.coordinator.parent.animationView.animation = newAnimation
                    context.coordinator.parent.animationView.play()
                }
            }

            PracticeVideoQueue.shared.videoName = self.name
        }
    }
    
    private func loadAnimation() {
        DispatchQueue.global(qos: .background).async {
            let loadedAnimation = Animation.named(self.name)
            
            DispatchQueue.main.async {
                self.animationView.animation = loadedAnimation
                self.animationView.play()
            }
        }
    }
    
    // MARK: - UIRepresentable Coordinator
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject {
        var parent: LottieView
        
        init(_ parent: LottieView) {
            self.parent = parent
        }
    }
}

