//
//  IPPlatformIOSApp.swift
//  IPPlatformIOS
//
//  Created by Chr1s on 2021/8/19.
//

import SwiftUI

@main
struct IPPlatformIOSApp: App {
    
    @StateObject var appVM = AppPageServerViewModel()
    
    var body: some Scene {
        WindowGroup {
            /// 使用SwiftUI的视图生命周期来设定页面的"跳转"
            if appVM.isLogin {
                /// 登录成功后显示主页面
                 HomeView()
                    .environmentObject(appVM)
            } else {
                /// 否则根据AppStoreage中key为"IP_FirstLaunch"的字段
                /// 判断显示引导页 或是 Login页面
                 ContentView()
                    .environmentObject(appVM)
            }
        }
    }
}
