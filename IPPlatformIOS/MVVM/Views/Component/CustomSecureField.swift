//
//  CustomSecureField.swift
//  IPPlatformIOS
//
//  Created by Chr1s on 2021/8/19.
//

import SwiftUI

struct SecureInputView: View {
    
    @Binding private var text: String
    @State private var isSecured: Bool = true
    private var title: String
    
    init(_ title: String = "请输入密码", text: Binding<String>) {
        self.title = title
        self._text = text
    }
    
    var body: some View {
        ZStack(alignment: .trailing) {
            if isSecured {
                SecureField(title, text: $text)
            } else {
                TextField(title, text: $text)
            }
            Button(action: {
                isSecured.toggle()
            }) {
                Image(systemName: self.isSecured ? "eye.slash" : "eye")
                    .accentColor(.gray)
            }
        }
        .padding(.horizontal, 30)
        .frame(height: 50)
        .background(
            RoundedRectangle(cornerRadius: 100)
                .foregroundColor(Color("tf-color"))
        )
      
    }
}

struct SecureInputView_Previews: PreviewProvider {
    static var previews: some View {
        SecureInputView("请输入密码", text: .constant(""))
    }
}
