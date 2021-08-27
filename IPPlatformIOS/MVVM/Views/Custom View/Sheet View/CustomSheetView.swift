//
//  FingerPrintView.swift
//  OnlineDoctor
//
//  Created by 吕博 on 2021/7/19.
//

import SwiftUI
import Combine

fileprivate enum Constants {
    static let radius: CGFloat = 16
    static let indicatorHeight: CGFloat = 6
    static let indicatorWidth: CGFloat = 60
    static let snapRatio: CGFloat = 0.25
    static let minHeightRatio: CGFloat = 0.1
}

struct CustomSheetView<Content: View>: View {
    
    @Binding var fingerShow: Bool
    @Binding var navigateToHome: Bool
    
    let maxHeight: CGFloat
    let minHeight: CGFloat
    let content: Content
    
    init(fingerShow: Binding<Bool>, navigateToHome: Binding<Bool>,maxHeight: CGFloat, @ViewBuilder content: () -> Content) {
        self.minHeight = maxHeight * Constants.minHeightRatio
        self.maxHeight = maxHeight
        self.content = content()
        self._fingerShow = fingerShow
        self._navigateToHome = navigateToHome
    }
    
    @GestureState private var translation: CGFloat = 0

    private var offset: CGFloat {
        fingerShow ? 0 : maxHeight - minHeight
    }

    private var indicator: some View {
        RoundedRectangle(cornerRadius: Constants.radius)
            .fill(Color.white)
            .frame(
                width: Constants.indicatorWidth,
                height: Constants.indicatorHeight
        ).onTapGesture {
            self.fingerShow.toggle()
        }
    }
    
    var body: some View {
        
        GeometryReader { geometry in
            VStack(alignment: .center, spacing: 0) {
                self.indicator.padding(.bottom, 5)
                FingerBodyView(fingerShow: $fingerShow, navigateToHome: $navigateToHome)
                    .frame(height: self.maxHeight-20)
                    .clipShape(RoundedRectangle(cornerRadius: 38))
                    
                
            }
            .frame(width: geometry.size.width, height: self.maxHeight, alignment: .top)
            .background(Color.clear)
            .cornerRadius(Constants.radius)
            .frame(height: geometry.size.height , alignment: .bottom)
            .offset(y: fingerShow ? 0 : self.offset + self.translation + 100)
            
            .animation(.interactiveSpring())
            .gesture(
                DragGesture().updating(self.$translation) { value, state, _ in
                    state = value.translation.height
                }.onEnded { value in
                    let snapDistance = self.maxHeight * Constants.snapRatio
                    guard abs(value.translation.height) > snapDistance else {
                        return
                    }
                    self.fingerShow = value.translation.height < 0
                }
            )
            
        }
    }
}

struct FingerPrintView_Previews: PreviewProvider {
    static var previews: some View {
        CustomSheetView(fingerShow: .constant(true), navigateToHome: .constant(false), maxHeight: 600) {
            Rectangle().fill(Color.red)
        }.edgesIgnoringSafeArea(.all)
    }
}

struct FingerBodyView: View {
    
    @Binding var fingerShow: Bool
    @Binding var navigateToHome: Bool
  
    var body: some View {
        ZStack {
           
            VStack {
                Text("title")
                
                Text("content")
            }
            .frame(width: UIScreen.main.bounds.width - 40, height: 700, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(Color.white)
        }
    }
}
