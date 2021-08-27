//
//  AppPageServerViewModel.swift
//  IPPlatformIOS
//
//  Created by Chr1s on 2021/8/23.
//

import SwiftUI
import Combine

/// 控制App页面初始显示的ViewModel
class AppPageServerViewModel: ObservableObject {
    
    // 持久化存储 : 初次打开App时显示引导页
    @AppStorage("IP_FirstLaunch") var Apps_firstLaunch: Bool?
    
    /// 是否登录成功，应转入主页页面
    @Published var isLogin: Bool = false
 
    init() {
        
    }
    
 
}
