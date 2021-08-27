//
//  TabBarView.swift
//  IPPlatformIOS
//
//  Created by Chr1s on 2021/8/19.
//

import SwiftUI

struct TabBarView: View {
    
    @Binding var selection: Int
    @Namespace private var currentTab
    
    var body: some View {
        HStack(alignment: .bottom) {
            // views
            ForEach(tabs.indices) { index in
                GeometryReader { geometry in
                    VStack(spacing: 4) {
                        if selection == index {
                            Color("main-color")
                                .frame(height: 2)
                                .offset(y: -8)
                                .matchedGeometryEffect(id: "currentTab", in: currentTab)
                        }
                                      
                        Image(systemName: tabs[index].image)
                            .frame(height: 20)
                        
                        Text(tabs[index].label)
                            .font(.caption2)
                            .fixedSize()
                    }
                    .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                    .frame(width: geometry.size.width / 2, height: 44, alignment: .bottom)
                    .padding(.horizontal)
                    .foregroundColor(selection == index ? Color("main-color") : .secondary)
                    .onTapGesture {
                        withAnimation {
                            selection = index
                        }
                    }
                }
                .frame(height: 44, alignment: .bottom)
            }
        }
        .frame(height: 94)
        .edgesIgnoringSafeArea(.all)
        .background(
            RoundedRectangle(cornerRadius: 30)
                .foregroundColor(.black.opacity(0.5))
        )
        .edgesIgnoringSafeArea(.all)
       
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(selection: .constant(1))
            .previewLayout(.sizeThatFits)
    }
}

struct Tab {
    let image: String
    let label: String
}

let tabs = [
    Tab(image: "house.fill", label: "主页"),
    Tab(image: "pencil.tip.crop.circle", label: "专利管理"),
    Tab(image: "bag.fill", label: "商标管理"),
    Tab(image: "leaf", label: "版权管理"),
    Tab(image: "magnifyingglass", label: "搜索"),
]
