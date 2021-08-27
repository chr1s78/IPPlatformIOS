//
//  LoadingView.swift
//  IPPlatformIOS
//
//  Created by Chr1s on 2021/8/25.
//

import SwiftUI
import ActivityIndicatorView

/// Loading View 
struct LoadingView: View {
    
    @Binding var show: Bool
    var text: String = "数据加载中..."

    var body: some View {
        VStack {
            ActivityIndicatorView(isVisible: $show, type: .arcs)
                .frame(width: 50.0, height: 50.0)
                    
            Text(text).bold().opacity( show ? 1.0 : 0.0)
        }
        .foregroundColor(.orange)
        .shadow(color: .black.opacity(0.2), radius: 1, x: 1, y: 1)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(show: .constant(true), text: "数据加载中...")
    }
}
