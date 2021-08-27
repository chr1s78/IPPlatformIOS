//
//  Naivgation+BackButtonStyle.swift
//  IPPlatformIOS
//
//  Created by Chr1s on 2021/8/22.
//

import SwiftUI

extension View {
    func CustomNavigationButtonStyle() -> ModifiedContent<Self, CustomNavigationButton> {
        return modifier(CustomNavigationButton())
    }
}

struct CustomNavigationButton: ViewModifier {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    func body(content: Content) -> some View {
        content
            .ignoresSafeArea()
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button(action : {
                self.mode.wrappedValue.dismiss()
            }){
                Image(systemName: "arrow.backward")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 20)
                    .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
            }, trailing: SortMenuView()
            
            )
    }
    
    struct SortMenuView: View {
        
        var body: some View {
            Menu {
                Button(action: {
                   // self.currentMenu = "时间升序"
                }) { Label("时间升序", systemImage: "timer") }
                Button(action: {
                 //   self.currentMenu = "时间降序"
                }) { Label("时间降序", systemImage: "clock.arrow.circlepath") }
                Button(action: {
                 //   self.currentMenu = "重要度从高到低"
                }) { Label("重要度从高到低", systemImage: "arrow.up.circle") }
                Button(action: {
                //    self.currentMenu = "重要度从低到高"
                }) { Label("重要度从低到高", systemImage: "arrow.down.circle") }
                
            } label: {
                HStack {
                    Text("排序")
                        .foregroundColor(.white)
                        .font(.footnote)
                        .opacity(0.8)
                    Image(systemName: "ellipsis.circle")
                        .foregroundColor(Color("main-color"))
                }
            }
        }
    }
}
