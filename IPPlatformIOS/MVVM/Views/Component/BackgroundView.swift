//
//  BackgroundView.swift
//  IPPlatformIOS
//
//  Created by Chr1s on 2021/8/19.
//

import SwiftUI

struct BackgroundView: View {
    
    @State var radius1: CGFloat = 700//352.0
    @State var radius2: CGFloat = 800//500.0
    @State var radius3: CGFloat = 900//630.0
    @State var radius4: CGFloat = 1000//780.0
    
    var animateCircle: Bool
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9019607843, green: 0.3333333333, blue: 0.7490196078, alpha: 1)), Color(#colorLiteral(red: 0.1921568627, green: 0.03529411765, blue: 0.8156862745, alpha: 1)), Color(#colorLiteral(red: 0.4392156863, green: 0.1568627451, blue: 0.6823529412, alpha: 1))]), startPoint: .topTrailing, endPoint: .bottomLeading)
            
            Image("BGImage")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
      
            Color.black.opacity(0.3)
                .background(
                    BlurView(style: .systemUltraThinMaterialDark)
                )
   
            
            ZStack {
                Circle()
                    .stroke(Color.white.opacity(0.1), lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                    .frame(width: radius1, height: radius1)
                    .foregroundColor(.clear)
                
                Circle()
                    .stroke(Color.white.opacity(0.1), lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                    .frame(width: radius2, height: radius2)
                    .foregroundColor(.clear)
              
                Circle()
                    .stroke(Color.white.opacity(0.1), lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                    .frame(width: radius3, height: radius3)
                    .foregroundColor(.clear)
               
                Circle()
                    .stroke(Color.white.opacity(0.1), lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                    .frame(width: radius4, height: radius4)
                    .foregroundColor(.clear)
                  
            }.offset(x: 254, y: -303)
            
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        .onAppear {
            if animateCircle {
                DispatchQueue.main.asyncAfter(deadline: .now()) {
                    withAnimation(.easeIn(duration: 1.0)) {
                        self.radius1 = 352
                        self.radius2 = 500
                        self.radius3 = 630
                        self.radius4 = 780
                    }
                }
            }
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(animateCircle: true)
    }
}
