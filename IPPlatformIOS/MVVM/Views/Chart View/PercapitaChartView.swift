//
//  PercapitaChartView.swift
//  IPPlatformIOS
//
//  Created by Chr1s on 2021/8/21.
//

import SwiftUI
import AAInfographics

struct PercapitaChartView: View {
    var body: some View {
        PercapitaUIChartView()
    }
}

struct PercapitaUIChartView: UIViewRepresentable {
    
    let chartModel = AAChartModel()
        .chartType(.column)
        .backgroundColor(AAColor.clear)
        .yAxisTitle("")//设置Y轴标题
        .dataLabelsEnabled(true)//是否显示值
        .tooltipEnabled(true)
        .legendEnabled(false)
        .categories(["李四","张三","王五","赵六","其他"])
        .series([
            AASeriesElement()
                .name("所有专业")
                .data([7.0, 6.9, NSNull(), 14.5, 18.2])
                .color(AAGradientColor.firebrick)
            ])
    
    func makeUIView(context: Context) -> UIView {
        
        
        let aaOptions = chartModel.aa_toAAOptions()
        aaOptions.xAxis?.labels?.style?
                   .color(AAColor.white)
                   .fontSize(18)
                   .fontWeight(.bold)
        aaOptions.yAxis?.labels?.style?
                   .color(AAColor.white)
                   .fontWeight(.bold)

        let aaChartView = AAChartView()
        aaChartView.aa_drawChartWithChartModel(chartModel)
      //  aaChartView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        aaChartView.contentHeight = 500
        aaChartView.isClearBackgroundColor = true
        aaChartView.aa_drawChartWithChartOptions(aaOptions)
     //   aaChartView.isSeriesHidden = false
        return aaChartView
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
}
struct PercapitaChartView_Previews: PreviewProvider {
    static var previews: some View {
        PercapitaChartView()
    }
}
