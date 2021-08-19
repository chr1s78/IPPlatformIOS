//
//  LaunchView.swift
//  IPPlatformIOS
//
//  Created by Chr1s on 2021/8/19.
//

import SwiftUI
import Lottie

struct LaunchView: View {
    
    @State var imageWidth: CGFloat = 30.0
    @State var isUserLogin: Bool = false
    
    @State var userName: String = ""
    @State var password: String = ""
    
    @State var isRememberMe: Bool = false
    @State var isLoading: Bool = false
    
    @State var isActive: Bool = false
    
    var body: some View {
        
        NavigationView {
            ZStack {
                BackgroundView(animateCircle: true)
                VStack {

                    HStack {
                        VStack(alignment: .leading) {
                            Text(Localization.appWelcome1)
                                .foregroundColor(.white)
                                .font(.custom("Montserrat", size: 30)).bold()
                            Text(Localization.appWelcome2)
                                .foregroundColor(.white)
                                .font(.custom("Montserrat", size: 30)).bold()
                            Text(Localization.appTipInfo)
                                .foregroundColor(.white.opacity(0.4))
                                .font(.custom("Montserrat", size: 12))
                        }
                        Spacer()
                    }
                    .padding(.leading,40)
                    .padding(.top, 100)
                    .opacity( self.isUserLogin ? 1.0 : 0.0 )

                    LogoView()
                        .padding(.top, 30)
                }
            }
            .onAppear {
                // 异步进行动画处理，否则初始页面动画会异常
                DispatchQueue.main.asyncAfter(deadline: .now()) {
                    withAnimation(.easeIn(duration: 0.7)) {
                        self.imageWidth = 260.0
                    }
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation(.easeIn(duration: 0.2)) {
                        self.isUserLogin = true
                    }
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
        
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}

extension LaunchView {
    
    func LogoView() -> some View {
        VStack(spacing: 10.0) {
            Image("home")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: self.imageWidth)
            
            Group {
                
                if !isUserLogin {
                    Text(Localization.appName)
                        .font(.custom("Montserrat", size: 40))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 1, x: 1, y: 1)
                        .padding(.top, 100)
                    
                    HStack {
                        Image("logo")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 20, height: 20)
                        
                        Text(Localization.appNameEn)
                            .font(.custom("Montserrat", size: 24)).bold()
                            .foregroundColor(.white.opacity(0.62))
                            .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 1, x: 1, y: 1)
                    }
                } else {
                    VStack {
                        TextField("请输入用户名", text: $userName)
                            .frame(height: 50)
                            .padding(.leading, 30)
                            .background(
                                RoundedRectangle(cornerRadius: 100)
                                    .foregroundColor(Color("tf-color"))
                            )
                            .padding(.top, 50)
                        
                        SecureInputView(text: $password)
                            .frame(height: 50)
                            .padding(.top, 15)
                        
                        HStack {
                            Image(systemName: "checkmark.square.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 24, height: 24)
                                .foregroundColor(isRememberMe ? .red : .gray)
                                .onTapGesture {
                                    self.isRememberMe.toggle()
                                }
                            Text("记住我的账号")
                            
                            Spacer()
                            
                            Text("忘记密码?")
                        }
                        .font(.custom("Montserrat", size: 13))
                        .foregroundColor(.white.opacity(0.8))
                        .padding(5)
                        
                        NavigationLink(
                            destination: HomeView().navigationBarHidden(true),
                            isActive: $isActive,
                            label: {
                                CustomButton(title: "登录", bkColor: Color("main-color"), fgColor: Color.white,width: 305, height: 50, cornerRadius: 100,isLoading: $isLoading) {
                                    self.isActive.toggle()
                                }
                            }
                        )
                        .padding(.top, 30)
                        
                        HStack {
                            Text("注册账号请在PC端访问")
                                .font(.custom("Montserrat", size: 13))
                                .foregroundColor(.white.opacity(0.6))
                            Text("ai-ip.cn")
                                .font(.custom("Montserrat", size: 13)).bold()
                                .foregroundColor(Color("main-color"))
                        }
                        .padding(.top, 10)
                        
                    }
                    .frame(width: 305)
                   
                }
            }
            
            Spacer()
        }
    }
}

