//
//  PatentsView.swift
//  IPPlatformIOS
//
//  Created by Chr1s on 2021/8/20.
//

import SwiftUI

struct PatentsView: View {
    
    @Binding var showTabbar: Bool
    
    let data = Array(1...1000).map { "Item \($0)"}
    let layout = [
      //  GridItem(.adaptive(minimum: 180, maximum: 200)),
        GridItem(.fixed(UIScreen.main.bounds.width / 3))
    ]
    
    var body: some View {
        ZStack {
         //   Color.orange.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        //    BlurView(style: .dark)
            BackgroundView(animateCircle: false)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            ScrollView {
                LazyVGrid(columns: layout, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 20) {
                    ForEach(data, id: \.self) { item in
                        Text(item)
                    }
                }
                .foregroundColor(.white)
                .padding()
            }
        }
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct PatentsView_Previews: PreviewProvider {
    static var previews: some View {
        PatentsView(showTabbar: .constant(true))
    }
}
