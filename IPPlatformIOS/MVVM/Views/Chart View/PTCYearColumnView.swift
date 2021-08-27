//
//  PTCYearColumnView.swift
//  IPPlatformIOS
//
//  Created by Chr1s on 2021/8/21.
//

import SwiftUI
import AAInfographics

struct IUAYearColumnView: View {
    var body: some View {
        IUAYearColumnChartView()
    }
}

struct IUAYearColumnChartView: UIViewRepresentable {
    
    let chartModel = AAChartModel()
        .chartType(.column)
        .backgroundColor(AAColor.clear)
        .colorsTheme(["#1e90ff","#ef476f","#ffd066","#04d69f","#25547c",])//Colors theme
        .dataLabelsEnabled(false)
        .tooltipValueSuffix("件")
        .animationType(.bounce)
        .touchEventEnabled(true)
        .categories(["2017","2018","2019","2020","2021"])
        .legendEnabled(false)
        .yAxisAllowDecimals(false)
        .zoomType(AAChartZoomType.xy)
        .series([
            AASeriesElement()
                .name("实新")
                .data([7, 6, 9, 14, 18])
                .color(AAColor.orange)
                ,
            AASeriesElement()
                .name("发明")
                .data([4, 3, 5, 11, 17])
                ,
            AASeriesElement()
                .name("外观")
                .data([20, 6, 3, 8, 13])
                ,
     
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


struct IUAYearColumnView_Previews: PreviewProvider {
    static var previews: some View {
        IUAYearColumnView()
    }
}
