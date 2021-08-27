//
//  Enum.swift
//  IPPlatformIOS
//
//  Created by Chr1s on 2021/8/21.
//
import UIKit
import SwiftUI

/// BottomSheet高度
/// ```
/// middle  :  0.6
/// bottom  :  0.125
/// hidden  :  0
/// higher  :  0.74
enum BookBottomSheetPosition: CGFloat, CaseIterable {
    case middle = 0.6, bottom = 0.125, hidden = 0 , higher = 0.74
}

/// 图表类型
/// ```
/// PTCPie              专利,商标,版权占比        饼状图
/// IUAYearColumn       发明,实新,外观分年统计     柱状图
/// PersonTotal         人均发明数               柱状图
/// IUAPie              发明,实新,外观占比        饼状图
/// IPPColumn           项目/产品专利数及占比。    柱状图
/// ```
/// getValue            获得各项的title文字（中文、英文）
/// ```
enum ChartSheetStyle {
    case PTCPie             // 专利,商标,版权占比        饼状图
    case IUAYearColumn      // 发明,实新,外观分年统计     柱状图
    case PersonTotal        // 人均发明数               柱状图
    case IUAPie             // 发明,实新,外观占比        饼状图
    case IPPColumn          // 项目/产品专利数及占比。    柱状图
    
    func getValue() -> ChartTitleData {
        switch self {
        
        case .PTCPie:
            return ChartTitleData("专利、商标、版权占比", "Patents & Trademark & Copyright")
            
        case .IUAYearColumn:
            return ChartTitleData("发明、实新、外观分年统计", "Invention & Utility & Appearance")
            
        case .PersonTotal:
            return ChartTitleData("人均发明数", "Invention per capita")
            
        case .IUAPie:
            return ChartTitleData("发明、实新、外观占比", "Invention & Utility & Appearance")
            
        case .IPPColumn:
            return ChartTitleData("项目/产品专利数及占比", "Products Percentage")
        }
    }
}

// 图表窗口显示的中文标题与英文标题
struct ChartTitleData {
    let titleCh: String
    let titleEn: String
    
    init(_ ch: String, _ en: String) {
        titleCh = ch
        titleEn = en
    }
}

