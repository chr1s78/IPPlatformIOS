//
//  OnboardingViewPure.swift
//  Onboarding
//
//  Created by Augustinas Malinauskas on 06/07/2020.
//  Copyright © 2020 Augustinas Malinauskas. All rights reserved.
//

import SwiftUI

struct OnboardingViewPure: View {
    var data: [OnboardingDataModel]
    var doneFunction: () -> ()
    
    @State var slideGesture: CGSize = CGSize.zero
    @State var curSlideIndex = 0
    var distance: CGFloat = UIScreen.main.bounds.size.width
    
    
    func nextButton() {
        if self.curSlideIndex == self.data.count - 1 {
            doneFunction()
            return
        }
        
        if self.curSlideIndex < self.data.count - 1 {
            withAnimation {
                self.curSlideIndex += 1
            }
        }
    }
    
    var body: some View {
        ZStack {
           // Color(.systemBackground).edgesIgnoringSafeArea(.all)
            BackgroundView(animateCircle: false)
            
            ZStack(alignment: .center) {
                ForEach(0..<data.count) { i in
                    OnboardingStepView(data: self.data[i])
                        .offset(x: CGFloat(i) * self.distance)
                        .offset(x: self.slideGesture.width - CGFloat(self.curSlideIndex) * self.distance)
                        .animation(.spring())
                        .gesture(DragGesture().onChanged{ value in
                            self.slideGesture = value.translation
                        }
                        .onEnded{ value in
                            if self.slideGesture.width < -50 {
                                if self.curSlideIndex < self.data.count - 1 {
                                    withAnimation {
                                        self.curSlideIndex += 1
                                    }
                                }
                            }
                            if self.slideGesture.width > 50 {
                                if self.curSlideIndex > 0 {
                                    withAnimation {
                                        self.curSlideIndex -= 1
                                    }
                                }
                            }
                            self.slideGesture = .zero
                        })
                }
            }
            
            
            VStack {
                Spacer()
                VStack {
                    
                    // Bottom button : skip step & login
                    HStack {
                        if self.curSlideIndex != self.data.count - 1 {
                            Button(action: doneFunction) {
                                Text("Skip")
                                    .font(.callout)
                                    .foregroundColor(.white)
                            }
                            .padding(.leading, 25)
                        }
                        
                        Spacer()
                        self.progressView()
                        Spacer()
                        
                        Button(action: nextButton) {
                            self.arrowView()
                        }
                    }
                    .offset(y: -20)
                }
            }
            .padding(20)
        }
    }
    
    func arrowView() -> some View {
        Group {
            if self.curSlideIndex == self.data.count - 1 {
                HStack(spacing: 0.0) {
                    Text("进入智产家")
                        .font(.footnote)
                        .foregroundColor(.white)
                    Image(systemName: "arrow.right")
                        .font(.footnote)
                        .foregroundColor(.white)
                }
                .frame(width: 160, height: 50)
                .background(Color("main-color"))
                .cornerRadius(25)
            } else {
                Image(systemName: "arrow.right.circle.fill")
                    .resizable()
                    .foregroundColor(Color("main-color"))
                    .scaledToFit()
                    .frame(width: 50)
            }
        }
    }
    
    func progressView() -> some View {
        HStack {
            ForEach(0..<data.count) { i in
                if i == self.curSlideIndex {
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: 50,height: 10)
                        .foregroundColor(Color("main-color"))
                } else {
                    Circle()
                        .scaledToFit()
                        .frame(width: 10)
                        .foregroundColor(Color("main-color").opacity(0.6))
                }
            }
        }
    }
    
}

struct OnboardingViewPure_Previews: PreviewProvider {
    static let sample = OnboardingDataModel.data
    static var previews: some View {
        OnboardingViewPure(data: sample, doneFunction: { print("done") })
    }
}
