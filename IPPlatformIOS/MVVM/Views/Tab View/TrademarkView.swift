//
//  TrademarkView.swift
//  IPPlatformIOS
//
//  Created by Chr1s on 2021/8/21.
//

import SwiftUI

struct TrademarkView: View {
    var body: some View {
        ZStack {
            
            Color.purple.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
          //  NavigationView {
                
                ZStack {
                    Color.yellow.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    Text("Trademark View")
                }
        //        .navigationBarHidden(true)
        //    }
        }
    }
}

struct TrademarkView_Previews: PreviewProvider {
    static var previews: some View {
        TrademarkView()
    }
}
