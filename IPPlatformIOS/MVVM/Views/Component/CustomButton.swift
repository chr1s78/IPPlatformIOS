//
//  CustomButton.swift
//  IPPlatformIOS
//
//  Created by Chr1s on 2021/8/19.
//

import SwiftUI

enum WaitButtonStyle {
    case progress
    case animation
    case stroke
}

/// 初始化Button
/// ```
/// title      :  按钮显示文字, 默认 title
/// bkColor    :  按钮背景色, 默认 blue
/// fgColor    :  按钮文字颜色, 默认 white
/// width      :  按钮宽度, 默认150
/// height     :  按钮高度, 默认50
/// cornerRadius: 圆角角度
/// loadingText:  Loading时显示的文字, 默认 Loading
/// style      :  Loading样式, 默认progressView
/// isLoading  :  Binding自父视图，true表示loading状态
/// action     :  父视图处理闭包
struct CustomButton: View {
    
    var title, loadingText: String
    var bkColor, fgColor: Color
    var width, height, cornerRadius: CGFloat
    var style: WaitButtonStyle
    
    @Binding var isLoading: Bool
    
    var action: () -> () = {}
    
    @State var point: CGPoint = CGPoint(x: 0, y: 0)
    
    /// 初始化Button
    /// ```
    /// title      :  按钮显示文字, 默认 title
    /// bkColor    :  按钮背景色, 默认 blue
    /// fgColor    :  按钮文字颜色, 默认 white
    /// width      :  按钮宽度, 默认150
    /// height     :  按钮高度, 默认50
    /// cornerRadius: 圆角角度
    /// loadingText:  Loading时显示的文字, 默认 Loading
    /// style      :  Loading样式, 默认progressView
    /// isLoading  :  Binding自父视图，true表示loading状态
    /// action     :  父视图处理闭包
    init(title: String = "title",
         bkColor: Color = Color.blue,
         fgColor: Color = Color.white,
         width: CGFloat = 150,
         height: CGFloat = 50,
         cornerRadius: CGFloat = 12,
         loadingText: String = "Loading",
         style: WaitButtonStyle = .progress,
         isLoading: Binding<Bool>,
         action: @escaping () -> Void) {
        
        self.title = title
        self.bkColor = bkColor
        self.fgColor = fgColor
        self.width = width
        self.height = height
        self.cornerRadius = cornerRadius
        self.loadingText = loadingText
        self.style = style
        self._isLoading = isLoading
        self.action = action
    }
    var body: some View {
        Button(action: {
            if !isLoading {
                self.action()
            }
        }, label: {
            ZStack {
                
                if isLoading {
                    
                    switch style {
                    
                    case WaitButtonStyle.progress:
                        Color.gray
                            .frame(width: self.width, height: self.height)
                            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                        
                        ProgressView()
                            .foregroundColor(fgColor)
                    default:
                        Color.orange
                    }
                   
                } else {
                    
                    bkColor
                        .frame(width: self.width, height: self.height)
                        .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                    
                    Text(title)
                        .foregroundColor(fgColor)
                }
            }
        })
        .disabled(isLoading)
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(isLoading: .constant(true), action: {
            
        })
        .previewLayout(PreviewLayout.sizeThatFits)
    }
}
