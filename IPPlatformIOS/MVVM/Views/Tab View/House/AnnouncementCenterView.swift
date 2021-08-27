//
//  AnnouncementCenterView.swift
//  IPPlatformIOS
//
//  Created by Chr1s on 2021/8/22.
//

import SwiftUI
import ActivityIndicatorView

/// 公告列表页
struct AnnouncementCenterView: View {
    
    /// Environment
    @Environment(\.colorScheme) var currentMode
    @Environment(\.presentationMode) var mode//: Binding<PresentationMode>

    /// StateObject
    @StateObject var vm = AnnouncementViewModel()
    
    /// Binding
    @Binding var showTabbar: Bool
    
    /// State
    @State var currentMenu: String = "时间升序"
    @State var showModalView: Bool = false
    @State var navigationBarHidden: Bool = false
    @State var scopeSelection: Int = 0
    @State var text: String = ""

    
    init(showTabbar: Binding<Bool>) {
        // 设置list背景色
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
        
        self._showTabbar = showTabbar
    }
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
      
            // 公告列表
            List {
                ForEach(vm.data) { data in
                    HStack(spacing: 20) {
                        Group {
                            switch data.type {
                            case 0:
                                Image(systemName: "exclamationmark.circle.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(.green)
                            case 1:
                                
                                Image(systemName: "exclamationmark.square.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(.yellow)
                            case 2:
                                Image(systemName: "exclamationmark.shield.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(.red)
                            default:
                                Image(systemName: "bookmark.circle.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(.gray)
                            }
                        }
                        
                        VStack(alignment: .leading, spacing: 2) {
                            Text(DateUtils.stringFromDate(date: data.date, format: "yyyy年MM月dd日 HH:mm"))
                                .font(.footnote).opacity(0.6)
                                .blendMode(.darken)
                            
                            Text(data.title)
                                .font(.subheadline).bold()
                            Text(data.description)
                                .font(.caption2).opacity(0.8)
                                .lineLimit(1)
                            
                            Text(data.author + " · " + data.authorLevel)
                                .font(.caption2).opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                        }
                    }
                   // .padding(.leading, 1)//23)
                    .padding(.trailing, 10)
                    .listRowBackground(Color.clear)
                    // .padding()
                }
            }
            .navigationBarTitle("公告列表")
            // 隐藏原始返回按钮
            .navigationBarBackButtonHidden(true)
            .navigationSearchBar(
              //  searchControllerIsPresented: $searchControllerIsPresented,
                placeholder: "搜索公告标题",
                searchTerm: $vm.searchText,//$searchTerm,
               // searchScopes: scopes,
              //  selectedSearchScope: $selectedScope,
                hidesWhenScrolling: true
            )
            // 导航栏返回菜单和排序菜单
            .navigationBarItems(
                leading: Button(action : {
                    self.mode.wrappedValue.dismiss()
                }){
                    Image(systemName: "arrow.left")
                        .foregroundColor(.orange)
                },
                trailing: OrderMenu() )
            .background(
                BackgroundView(animateCircle: false)
            )
            .onAppear {
                vm.fetchData()
                DispatchQueue.main.async {
                    withAnimation(.easeOut) {
                        self.showTabbar = false
                    }
                }
            }
            .onDisappear {
                DispatchQueue.main.async {
                    withAnimation(.easeOut) {
                        self.showTabbar = true
                    }
                }
            }
                
                LoadingView(show: $vm.isLoadingShow)
            }
            
        }
    }
}

extension AnnouncementCenterView {
    func OrderMenu() -> some View {
        HStack {
            Spacer()
            Menu {
                Button(action: {
                    self.currentMenu = "时间升序"
                    self.vm.sortStyle = .DateRise
                }) { Label("时间升序", systemImage: "timer") }
                Button(action: {
                    self.currentMenu = "时间降序"
                    self.vm.sortStyle = .DateDrop
                }) { Label("时间降序", systemImage: "clock.arrow.circlepath") }
                Button(action: {
                    self.currentMenu = "重要度从高到低"
                    self.vm.sortStyle = .PriorityRise
                }) { Label("重要度从高到低", systemImage: "arrow.up.circle") }
                Button(action: {
                    self.currentMenu = "重要度从低到高"
                    self.vm.sortStyle = .PriorityDrop
                }) { Label("重要度从低到高", systemImage: "arrow.down.circle") }
                
            } label: {
                HStack {
                    Text(currentMenu)
                        .foregroundColor(.white)
                        .font(.footnote)
                        .opacity(0.8)
                        .fixedSize(horizontal: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, vertical: false)
                    Image(systemName: "ellipsis.circle")
                        .foregroundColor(Color("main-color"))
                }
                .fixedSize(horizontal: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, vertical: false)
            
            }
            
        }
    }
}

struct testOrderMenu: View {
    @State var currentMenu: String = "时间升序"
    var body: some View {
        HStack {
         //   Spacer()
            Menu {
                Button(action: {
                    self.currentMenu = "时间升序"
                   // self.vm.sortStyle = .DateRise
                }) { Label("时间升序", systemImage: "timer") }
                Button(action: {
                    self.currentMenu = "时间降序"
                 //   self.vm.sortStyle = .DateDrop
                }) { Label("时间降序", systemImage: "clock.arrow.circlepath") }
                Button(action: {
                    self.currentMenu = "重要度从高到低"
                 //   self.vm.sortStyle = .PriorityRise
                }) { Label("重要度从高到低", systemImage: "arrow.up.circle") }
                Button(action: {
                    self.currentMenu = "重要度从低到高"
                 //   self.vm.sortStyle = .PriorityDrop
                }) { Label("重要度从低到高", systemImage: "arrow.down.circle") }
                
            } label: {
                HStack {
                    Text(currentMenu)
                        .foregroundColor(.black)
                        .font(.footnote)
                        .opacity(0.8)
                        
                    Image(systemName: "ellipsis.circle")
                        .foregroundColor(Color("main-color"))
                }
                .frame(alignment: .trailing)
                .fixedSize(horizontal: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, vertical: true)
            
            }
            
        }
    }
}

struct AnnouncementCenterView_Previews: PreviewProvider {
    static var previews: some View {
     //   AnnouncementCenterView(showTabbar: .constant(true))
        testOrderMenu()
    }
}
