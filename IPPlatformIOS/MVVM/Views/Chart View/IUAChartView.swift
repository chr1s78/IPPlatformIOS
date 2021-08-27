//
//  IUAChartView.swift
//  IPPlatformIOS
//
//  Created by Chr1s on 2021/8/21.
//

import SwiftUI
import AAInfographics

struct IUAChartView: View {
    var body: some View {
        IUAChartUIView()
    }
}

struct IUAChartUIView: UIViewRepresentable {
    
    let chartModel = AAChartModel()
       // .yAxisTitle("cm")
        .chartType(.column)
        .dataLabelsStyle(AAStyle(color: AAColor.white, fontSize: 10))
        .legendEnabled(false)//隐藏图例(底部可点按的小圆点)
//        .categories(["图像识别", "汽车配件", "驾驶技术","化学试剂","肥料","灭火合成物","工业用粘合剂","纸浆"])
        .categories(["一", "二", "三", "四", "五", "六", "七", "八", "九", "十", "十一", "十二"])
        .dataLabelsEnabled(true)
        .polar(true)//极地化图形
        .series([
            AASeriesElement()
             //   .data([77.0,70.0,65.0,58.0,52.0,42.0,32.0,20])
                .data([7.0, 6.9, 9.5, 9.6, 13.9, 14.5, 18.3, 18.2, 21.5, 25.2, 26.5, 23.3])
                .color(AAColor.rgbaColor(70, 142, 247))
            ])


    
    func makeUIView(context: Context) -> UIView {
        
        
        let aaOptions = chartModel.aa_toAAOptions()
        
        aaOptions.colors = [AAColor.red, AAColor.blue, AAColor.yellow]
        aaOptions.xAxis?.labels?.style?
                   .color(AAColor.white)
                   .fontSize(8)
                  // .fontWeight(.bold)
        aaOptions.yAxis?.labels?.style?
                   .color(AAColor.white)
                 //  .fontWeight(.bold)

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


struct IUAChartView_Previews: PreviewProvider {
    static var previews: some View {
        IUAChartView()
    }
}
