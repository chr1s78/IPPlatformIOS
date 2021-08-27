//
//  PatentsView.swift
//  IPPlatformIOS
//
//  Created by Chr1s on 2021/8/20.
//

import SwiftUI

struct PatentsView: View {
    
    @Binding var showTabbar: Bool
    
    var body: some View {
        ZStack {
            Color.orange.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            BlurView(style: .dark)
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct PatentsView_Previews: PreviewProvider {
    static var previews: some View {
        PatentsView(showTabbar: .constant(true))
    }
}
