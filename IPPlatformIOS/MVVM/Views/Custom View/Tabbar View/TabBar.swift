//
//  TabBar.swift
//  InnerShadowTest
//
//  Created by Chr1s on 2021/8/20.
//

import SwiftUI

struct TabBar: View {
    
    @State var current = "Home"
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
        
            TabView(selection: $current) {
                
                Text("Home").tag("主页")
                Text("Messages").tag("专利管理")
                Text("Account").tag("商标管理")
                Text("other").tag("版权管理")
            }
            
            HStack(spacing: 0) {
                TabButton(title: "主页", image: "house.fill", selected: $current)
                
                Spacer(minLength: 0)
                
                TabButton(title: "专利管理", image: "message.fill", selected: $current)
                
                Spacer(minLength: 0)
                
                TabButton(title: "商标管理", image: "person.crop.circle", selected: $current)
                
                Spacer(minLength: 0)
                
                TabButton(title: "版权管理", image: "bag.circle", selected: $current)
            }
            .padding(.vertical, 18)
            .padding(.horizontal)
            .background(Color.black)
            .clipShape(Capsule())
          //  .padding(.horizontal, 25)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
