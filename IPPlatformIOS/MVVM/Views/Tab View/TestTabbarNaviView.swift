//
//  TestTabbarNaviView.swift
//  IPPlatformIOS
//
//  Created by Chr1s on 2021/8/23.
//

import SwiftUI

struct TestTabbarNaviView: View {
    var body: some View {
        
        NavigationView {
        ZStack {
            Color.green.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack {
                Text("top")
                
                Spacer()
                NavigationLink(
                    destination: testviewLB(),
                    label: {
                        /*@START_MENU_TOKEN@*/Text("Navigate")/*@END_MENU_TOKEN@*/
                    })
                    .navigationTitle("fuck title")
                
                Spacer()
                
                Text("bottom")
            }
        }
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(
                    leading: Button(action : {
        
                    }){
                        Image(systemName: "arrow.left")
                            .foregroundColor(.orange)
                    },
                    trailing: Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "gearshape")
                    }) )
             //   .navigationBarHidden(true)
                .navigationTitle("test tabr")
        }
        
    }
}

struct testviewLB: View {
    var body: some View {
        ZStack {
            Color.orange.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            Text("LB View")
        }
    }
}

struct TestTabbarNaviView_Previews: PreviewProvider {
    static var previews: some View {
        TestTabbarNaviView()
    }
}
