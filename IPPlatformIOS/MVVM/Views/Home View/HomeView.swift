//
//  HomeView.swift
//  IPPlatformIOS
//
//  Created by Chr1s on 2021/8/19.
//

import SwiftUI

/// 主页面，包含四个TabView
struct HomeView: View {
    
    /// 当前选择的tabView页面
    @State private var selection = "主页"
    /// 显示或隐藏tabbar
    /// ```
    /// true  : 显示
    /// false : 隐藏
    /// ```
    @State var showTabbar: Bool = true
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {

           // VStack(spacing: -50) {
            /// TabView
            TabView(selection: $selection) {
                
                NavigationView {
                    HouseView(showTabbar: $showTabbar)
                        .navigationBarHidden(true)
                }
                .tag("主页")
                .gesture(DragGesture())

                PatentsView(showTabbar: $showTabbar).tag("专利管理")
                    .gesture(DragGesture())

                TrademarkView().tag("商标管理")
                    .gesture(DragGesture())

                CopyrightView().tag("版权管理")
                    .gesture(DragGesture())
            }
           /// DefaultTabViewStyle需要为每个TabView单独设置背景色
            .tabViewStyle(DefaultTabViewStyle())
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            /// 自定义TabBar
            HStack(spacing: 0) {
                TabButton(title: "主页", image: "house.fill", selected: $selection)
                
                Spacer(minLength: 0)
                
                TabButton(title: "专利管理", image: "pencil.tip.crop.circle", selected: $selection)
                
                Spacer(minLength: 0)
                
                TabButton(title: "商标管理", image: "bag.fill", selected: $selection)
                
                Spacer(minLength: 0)
                
                TabButton(title: "版权管理", image: "leaf", selected: $selection)
                
                
            }
            .padding(.bottom, 10)
            .padding(.vertical, 22)
            .padding(.horizontal)
            .background(Color.black)
            .clipShape(RoundedRectangle(cornerRadius: 40))
            .offset(y: showTabbar ? 35 : 130)

        }
        .background(
            BackgroundView(animateCircle: false)
        )
        .onAppear {
            print("Home View Appear")
            self.showTabbar = true
        }
        .onDisappear {
            print("Home View Disappear")
        }
        .preferredColorScheme(.dark)

    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            
    }
}
