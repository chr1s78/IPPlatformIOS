//
//  BubbleView.swift
//  IPPlatformIOS
//
//  Created by Chr1s on 2021/8/20.
//

import SwiftUI

struct LittleBubble: View {
    @State var animated = false
    var body: some View {
        ZStack {
            Circle()
                .fill(RadialGradient(
                    gradient:
                        Gradient(stops: [
                        .init(color: Color(#colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)), location: 0),
                        .init(color: Color(#colorLiteral(red: 0, green: 0.006250008941, blue: 0.0625, alpha: 0.7393990385)), location: 1)]),
                    center: UnitPoint(x: 0.7040000056915308, y: 0.31200003788375924),
                    startRadius: 2.056233505669263,
                    endRadius: 205.62335056692632
                ))
                .frame(width: 70, height: 70)

            Circle()
                .frame(width: 60, height: 60)
                .foregroundColor(Color(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)))
                .blur(radius: 30)
                .offset(x: 10, y: 5)
            
            Text("项目产品")
                .font(.footnote).bold()
                .foregroundColor(.white)
                .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 1, x: 1, y: 1)
        }
        .compositingGroup()
        .shadow(color: Color(#colorLiteral(red: 0.9708333611488342, green: 0, blue: 0.4660000205039978, alpha: 0.47999998927116394)), radius:30, x:0, y:4)
        .offset(x: animated ? 3 : 0)
        .offset(y: animated ? 3 : 0)
        .animation(Animation.default.repeatForever().speed(0.1))
        .onAppear {
                self.animated.toggle()
            }
    }
}

struct NormalBubble: View {
    
    @State var animated = false
    
    var title: String
    
    var body: some View {
        ZStack {
            Circle()
                .fill(RadialGradient(
                    gradient:
                        Gradient(stops: [
                        .init(color: Color(#colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)), location: 0),
                        .init(color: Color(#colorLiteral(red: 0, green: 0.006250008941, blue: 0.0625, alpha: 0.7393990385)), location: 1)]),
                    center: UnitPoint(x: 0.7040000056915308, y: 0.31200003788375924),
                    startRadius: 2.056233505669263,
                    endRadius: 205.62335056692632
                ))
                .frame(width: 105, height: 105)

            Circle()
                .frame(width: 80, height: 80)
                .foregroundColor(Color(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)))
                .blur(radius: 30)
                .offset(x: 10, y: 5)
            
            Text(title)
                .font(.subheadline).bold()
                .foregroundColor(.white)
                .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 1, x: 1, y: 1)
        }
        .compositingGroup()
        .shadow(color: Color(#colorLiteral(red: 0.9708333611488342, green: 0, blue: 0.4660000205039978, alpha: 0.47999998927116394)), radius:30, x:0, y:4)
        .offset(x: animated ? 3 : 0)
        .offset(y: animated ? 3 : 0)
        .animation(Animation.default.repeatForever().speed(0.1))
        .onAppear {
                self.animated.toggle()
            }
    }
}

/// 星云图
/// 大图: 专利、商标、版权
struct PrimaryBubble: View {
    
    @State var animated = false
    
    var body: some View {
        
        ZStack {
            
            Circle()
                .fill(RadialGradient(
                    gradient: Gradient(stops: [
                                        .init(color: Color(#colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)), location: 0),
                                        .init(color: Color(#colorLiteral(red: 0, green: 0.006250008941, blue: 0.0625, alpha: 0.7393990385)), location: 1)]),
                    center: UnitPoint(x: 0.7040000056915308, y: 0.31200003788375924),
                    startRadius: 2.056233505669263,
                    endRadius: 205.62335056692632
                ))
                .frame(width: 150, height: 150)

            Circle()
                .frame(width: 100, height: 100)
                .foregroundColor(Color(#colorLiteral(red: 1, green: 0, blue: 0.01215168143, alpha: 0.5621875)))
                .blur(radius: 30)
                .offset(x: 10, y: 5)
            
            Circle()
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)
                .blur(radius: 40)
                .offset(x: 10, y: 5)
            
            Circle()
                .frame(width: 100, height: 100)
                .foregroundColor(Color(#colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 0.72828125)))
                .blur(radius: 40)
                .offset(x: 10, y: 5)
            
            VStack(spacing: 5.0) {
                Text("专利、商标、版权")
                    .font(.footnote)
                Text("121件")
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            }
            .foregroundColor(.white)
            .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 1, x: 1, y: 1)
        }
        .compositingGroup()
        .shadow(color: Color(#colorLiteral(red: 0.9708333611488342, green: 0, blue: 0.4660000205039978, alpha: 0.47999998927116394)), radius:30, x:0, y:4)
        .offset(x: animated ? -10 : 0)
        .offset(y: animated ? -10 : 0)
        .animation(Animation.default.repeatForever().speed(0.1))
        .onAppear {
                self.animated.toggle()
            }
    }
}


struct PrimaryBubble_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryBubble()
    }
}
