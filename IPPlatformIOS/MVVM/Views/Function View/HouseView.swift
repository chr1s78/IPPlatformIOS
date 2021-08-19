//
//  HouseView.swift
//  IPPlatformIOS
//
//  Created by Chr1s on 2021/8/19.
//

import SwiftUI

struct HouseView: View {
    var body: some View {
        
        VStack(spacing: 20.0) {
            
            HStack(alignment: .center) {
                AvatorView(num: 2)
                
                Text("中智讯（青岛）")
                    .font(.title3).bold()
                    .foregroundColor(.white)
                    .padding(.leading, 5)
                Spacer()
                Image(systemName: "gearshape")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:24 ,height: 24)
                    .foregroundColor(.white)
            }
            .padding(.horizontal, 20)
            .padding(.top, 16)
            
            RoundedRectangle(cornerRadius: 18)
                .frame(height: 170)
                .foregroundColor(.black.opacity(0.5))
                .padding(.horizontal, 20)
            
            Spacer()
            ZStack {
                
                Image("Bubble chart")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width, height: 300)
                
            }
            Spacer()
        }
    }
}

extension HouseView {
    
    func mainBigBall() -> some View {
        Image("Bubble")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 150, height: 150)
            .compositingGroup()
            .shadow(color: Color(#colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)), radius:100, x:10, y:20)
    }
    
    func projectBall() -> some View {
        Image("MiddleBubble")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 105, height: 105)
            .compositingGroup()
            .shadow(color: Color(#colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)), radius:100, x:10, y:20)
    }
    
    func messageNumber(num: Int) -> some View {
        Text("\(num)")
            .font(.subheadline).bold()
            .foregroundColor(.white)
            .background(
                Circle()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.red)
            )
            .background(
                Circle()
                    .frame(width: 26, height: 26)
                    .foregroundColor(.white.opacity(0.3))
            )
    }
    
    func AvatorView(num: Int) -> some View {
        ZStack {
            Image("Avatar")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:40 ,height: 40)
      
            messageNumber(num: num)
                .offset(x: 14, y: -14)
            
        }
    }
}


struct HouseView_Previews: PreviewProvider {
    static var previews: some View {
        HouseView()
    }
}

