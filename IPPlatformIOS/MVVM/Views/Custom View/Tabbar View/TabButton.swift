//
//  TabButton.swift
//  InnerShadowTest
//
//  Created by Chr1s on 2021/8/20.
//

import SwiftUI

struct TabButton: View {
    
    var title: String
    var image: String
    
    @Binding var selected: String
    
    var body: some View {
        
        Button(action: {
            withAnimation(.spring()) {
                selected = title
            }
        }, label: {
            
            HStack(spacing: 10) {
                
                Image(systemName: image)
                    .resizable()
                 //   .renderingMode(.template)
                    .frame(width: 25, height: 25)
                    .foregroundColor(.white)
                
                if selected == title {
                    
                    Text(title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                       // .foregroundColor(.orange)
                }
            }
            .padding(.vertical, 10)
            .padding(.horizontal)
       //     .background(Color.white.opacity(selected == title ? 0.5 : 0))
            .background( selected == title ? Color.orange : Color.white.opacity(0))
            .clipShape(Capsule())
        })
    }
}


