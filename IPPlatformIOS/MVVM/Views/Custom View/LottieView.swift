//
//  LottieView.swift
//  myGitHub
//
//  Created by 吕博 on 2021/8/19.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    
    typealias UIViewType = UIView
    var filename: String
    let animationView2 = AnimationView()
    
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView(frame: .zero)
        
     //   let animationView = AnimationView()
        let animation = Animation.named(filename)
        animationView2.animation = animation
        animationView2.contentMode = .scaleAspectFit
        animationView2.play()
        
        animationView2.translatesAutoresizingMaskIntoConstraints = false
        // 循环播放
      //  animationView2.loopMode = .loop
        
        view.addSubview(animationView2)
        
        NSLayoutConstraint.activate([
            animationView2.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView2.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {
         print("Lottie updateUIView")
        animationView2.play()
    }
}
    
   
    
    
    


