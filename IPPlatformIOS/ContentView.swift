//
//  ContentView.swift
//  IPPlatformIOS
//
//  Created by Chr1s on 2021/8/19.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var appVM: AppPageServerViewModel
    // 持久化存储 : 初次打开App时显示引导页
    @AppStorage("IP_FirstLaunch") var Apps_firstLaunch: Bool?

    var data = OnboardingDataModel.data
    
    var body: some View {
        Group {
            if !(Apps_firstLaunch ?? false) {
                OnboardingViewPure(data: data, doneFunction: {
                    Apps_firstLaunch = true
                })
            } else {
                LaunchView()
                    .environmentObject(appVM)
                  //  .navigationBarHidden(true)
            }
        }
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
