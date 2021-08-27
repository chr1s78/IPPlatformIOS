//
//  PTCPeiChartView.swift
//  IPPlatformIOS
//
//  Created by Chr1s on 2021/8/21.
//

import SwiftUI
import AAInfographics


/// ````
/// 图表 - 饼状图
/// 专利、商标、版权占比
struct PTCPeiChartUIView: UIViewRepresentable {
    
    let chartModel = AAChartModel()
        .chartType(.pie)
        .backgroundColor(AAColor.clear)
        .dataLabelsEnabled(true)//是否直接显示扇形图数据
        .legendEnabled(false)
        .markerSymbolStyle(AAChartSymbolStyleType.innerBlank)
        .dataLabelsStyle(AAStyle(color: "white", fontSize: 12))
        .markerSymbol(AAChartSymbolType.diamond)
        .yAxisTitle("℃")
        .series([
            AASeriesElement()
                .name("数量")
                .innerSize("20%")//内部圆环半径大小占比(内部圆环半径/扇形图半径),
                .allowPointSelect(true)
                .states(AAStates()
                            .hover(AAHover()
                                    .enabled(false)//禁用点击区块之后出现的半透明遮罩层
                            ))
                .data([
                    ["专利"  ,67],
                    ["商标"  ,499],
                    ["版权"  ,83],
                ])
        ])
    
  
    func makeUIView(context: Context) -> UIView {
        
        let aaChartView = AAChartView()
        aaChartView.aa_drawChartWithChartModel(chartModel)
        aaChartView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        aaChartView.contentHeight = 500
        aaChartView.isClearBackgroundColor = true
        return aaChartView
    }

    func updateUIView(_ uiView: UIView, context: Context) {
     //   uiView.isClearBackgroundColor = true
    }
}

/// 专利、商标、版权占比
struct PTCPeiChartView: View {
    var body: some View {
        PTCPeiChartUIView()
    }
}

struct PTCPeiChartView_Previews: PreviewProvider {
    static var previews: some View {
        PTCPeiChartView()
    }
}
