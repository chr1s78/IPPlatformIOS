//
//  HouseView.swift
//  IPPlatformIOS
//
//  Created by Chr1s on 2021/8/19.
//

import SwiftUI

struct HouseView: View {
    
    @State var isPresented: Bool = false
    @State var isChartShow: Bool = false
    @State var navigateToHome: Bool = false
    @State var chartStyle: ChartSheetStyle = ChartSheetStyle.PTCPie
    
    @State var bottomSheetPosition: BookBottomSheetPosition = BookBottomSheetPosition.hidden
    
    @Binding var showTabbar: Bool
    
    @State var navBarHidden: Bool = true
    
    var body: some View {
        
        ZStack {
        
            BackgroundView(animateCircle: false)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack(spacing: 20.0) {
              
                // 用户和设置
                HeaderView()

                // 公告摘要
                PostAbstractView()
                
                // 功能星云图
                ZStack {
                    Image("Bubble chart")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width, height: 300)

                    BubbleView()
                }
                .padding(.top, 80)
                
                Spacer()
            }
            .offset(y: 60)
            .edgesIgnoringSafeArea(.all)

            // 显示图表的弹出窗口
            ChartSheetView(style: self.chartStyle, bottomSheetPosition: $bottomSheetPosition, showTabbar: $showTabbar)
                .edgesIgnoringSafeArea(.all)
               
        }
        .frame(maxWidth: .infinity)
        .frame(maxHeight: .infinity)
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)

    }
}

/// 显示各种Chart的Sheet窗口
struct ChartSheetView: View {
 
    var style: ChartSheetStyle
    @Binding var bottomSheetPosition: BookBottomSheetPosition
    @Binding var showTabbar: Bool

    var body: some View {
        
        ZStack {
            Color.clear.blur(radius: 100).edgesIgnoringSafeArea(.all)
                .bottomSheet(
                    bottomSheetPosition: self.$bottomSheetPosition,
                    options: [
                        .animation(.linear.speed(1)),
                        .background(AnyView(Color.black.opacity(0.8))),
                        .backgroundBlur(effect: .regular),
                        .noDragIndicator,
                        .notResizeable,
                        .showCloseButton(
                            action: {
                                withAnimation(.easeIn) {
                                showTabbar = true
                                }
                        }),
                        .cornerRadius(30),
                        .shadow(color: .white),
                    ],
                    headerContent: {
                        VStack(alignment: .leading) {
        
                            Text(style.getValue().titleCh)
                                .font(.title2).bold()
                            
                            Text(style.getValue().titleEn)
                                .font(.subheadline).foregroundColor(.white.opacity(0.8))
                            
                            Divider()
                                .padding(.trailing, -30)
                        }
                    }) {
                    //The list of the most popular songs of the artist.
                    VStack {
                        switch style {
                        case ChartSheetStyle.PTCPie:
                            PTCPeiChartView()
                        case .IUAYearColumn:
                            IUAYearColumnView()
                        case .PersonTotal:
                            PercapitaChartView()
                        case .IUAPie:
                            IUAPieChartView()
                        case .IPPColumn:
                            IUAChartView()
                        }
                        
                    }
                    
                }
                .foregroundColor(.white)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

/// 可点击的星云图总图
extension HouseView {
    func BubbleView() -> some View {
        ZStack {
            PrimaryBubble().offset(x: 20, y: 10)
                .onTapGesture {
                    chartStyle = .PTCPie
                    withAnimation(.easeIn) {
                        showTabbar = false
                        self.bottomSheetPosition = .higher
                    }
                }
            
            NormalBubble(title: "分年统计").offset(x: -125, y: -83)
                .onTapGesture {
                    chartStyle = .IUAYearColumn
                    withAnimation(.easeIn) {
                        showTabbar = false
                        self.bottomSheetPosition = .higher
                    }
                }
            
            NormalBubble(title: "人均发明").offset(x: 50, y: -133)
                .onTapGesture {
                    chartStyle = .PersonTotal
                    withAnimation(.easeIn) {
                        showTabbar = false
                        self.bottomSheetPosition = .higher
                    }
                }
            
            NormalBubble(title: "专利占比").offset(x: -100, y: 100)
                .onTapGesture {
                    chartStyle = .IUAPie
                    withAnimation(.easeIn) {
                        showTabbar = false
                        self.bottomSheetPosition = .higher
                    }
                }
            
            LittleBubble().offset(x: 80, y: 113)
                .onTapGesture {
                    chartStyle = .IPPColumn
                    withAnimation(.easeIn) {
                        showTabbar = false
                        self.bottomSheetPosition = .higher
                    }
                }
        }
    }
}

/// 功能星云图
extension HouseView {
    
    func mainBigBall() -> some View {
        Image("Bubble")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 150, height: 150)
            .compositingGroup()
            .shadow(color: Color(#colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)), radius:100, x:10, y:20)
    }
    
    func projectBall() -> some View {
        Image("MiddleBubble")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 105, height: 105)
            .compositingGroup()
            .shadow(color: Color(#colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)), radius:100, x:10, y:20)
    }
    
    func messageNumber(num: Int) -> some View {
        Text("\(num)")
            .font(.subheadline).bold()
            .foregroundColor(.white)
            .background(
                Circle()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.red)
            )
            .background(
                Circle()
                    .frame(width: 26, height: 26)
                    .foregroundColor(.white.opacity(0.3))
            )
    }
    
    func AvatorView(num: Int) -> some View {
        ZStack {
            Image("Avatar")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:40 ,height: 40)
      
            messageNumber(num: num)
                .offset(x: 14, y: -14)
            
        }
    }
}

/// 公告摘要
extension HouseView {
    
    struct NoticeRowView: View {
        var title: String
        var briefing: String
        var body: some View {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.callout)
                Text(briefing)
                    .font(.subheadline)
                    .lineLimit(1)
                    .opacity(0.7)
            }
            .foregroundColor(.white)
        }
    }
    
    func PostAbstractView() -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 18)
                .frame(height: 170)
                .foregroundColor(.black.opacity(0.5))
                .padding(.horizontal, 20)

            VStack {
                HStack {
                    Text("公告")
                        .font(.title3)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                    Spacer()
                    
                    NavigationLink(
                        destination:
                            AnnouncementCenterView(showTabbar: $showTabbar)
                            .navigationBarHidden(true)
                            .environment(\.colorScheme, .dark),
                        label: {
                            Text("更多")
                                .font(.subheadline)
                                .foregroundColor(Color("main-color"))
                                .fontWeight(.semibold)
                        })
                }
                .padding(.bottom, 10)


                NoticeRowView(title: "出售专利技术", briefing: "有效期至2021年11月13日，有意者请联系工作人员（扫描二维码）")
                Divider()
                    .foregroundColor(.white)
                NoticeRowView(title: "出售专利技术", briefing: "有效期至2021年11月13日，有意者请联系工作人员（扫描二维码）")

            }
            .padding(.horizontal, 40)
        }
    }
}

/// 用户和设置
extension HouseView {
    func HeaderView() -> some View {
        HStack(alignment: .center) {
            AvatorView(num: 2)

            Text("中智讯（青岛）")
                .font(.title3).bold()
                .foregroundColor(.white)
                .padding(.leading, 5)
            Spacer()
            Image(systemName: "gearshape")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:24 ,height: 24)
                .foregroundColor(.white)
        }
        .edgesIgnoringSafeArea(.all)
        .padding(.horizontal, 20)
        .padding(.top, 16)
    }
}

struct HouseView_Previews: PreviewProvider {
    static var previews: some View {
        HouseView(showTabbar: .constant(true))
    }
}

