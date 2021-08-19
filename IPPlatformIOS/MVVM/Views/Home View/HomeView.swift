//
//  HomeView.swift
//  IPPlatformIOS
//
//  Created by Chr1s on 2021/8/19.
//

import SwiftUI

struct HomeView: View {
    
    @State private var selection = 0
    
    var body: some View {
        ZStack {
            VStack {
                TabView(selection: $selection) {
                    HouseView().tag(0)
                    Text("专利管理").tag(1)
                    Text("商标管理").tag(2)
                    Text("版权管理").tag(3)
                    Text("搜索").tag(4)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
                Spacer()
                
                TabBarView(selection: $selection)
                    .foregroundColor(.blue)
            }
            .edgesIgnoringSafeArea(.all)
            .background(
                BackgroundView(animateCircle: false)
                    .edgesIgnoringSafeArea(.all)
                
            )
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
