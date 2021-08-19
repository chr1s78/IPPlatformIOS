//
//  LazyView.swift
//  SwiftUITemplate
//
//  Created by 吕博 on 2021/8/2.
//

import SwiftUI

struct LazyView<Content: View>: View {
    let content: () -> Content

    init(@ViewBuilder _ content: @escaping () -> Content) {
        self.content = content
    }
    var body: some View {
        content()          // << everything is created here
    }
}
