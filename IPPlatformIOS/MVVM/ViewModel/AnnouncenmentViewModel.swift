//
//  AnnouncenmentViewModel.swift
//  IPPlatformIOS
//
//  Created by Chr1s on 2021/8/22.
//

import Foundation
import Combine

/// 公告列表 View Model
/// - 通过数据仓库获取数据
final class AnnouncementViewModel: ObservableObject {
    
    // 公告原数据，用于搜索或排序时过滤
    var originData: AnnouncementModelData = []
    // 公告数据，View使用
    @Published var data: AnnouncementModelData = []
    // 搜索栏内容
    @Published var searchText: String = ""
    // Loading标志
    @Published var isLoadingShow: Bool = true
    
    // 排序方式
    var sortStyle: AnnounceSortStyle = .DateRise {
        didSet {
            switch sortStyle {
            case .DateRise:
                self.data = originData.sorted(by: { d, b in
                    d.date < b.date
                })
            //    print(self.data)
            case .DateDrop:
                self.data = originData.sorted(by: { d, b in
                    d.date > b.date
                })
            //    print(self.data)
                
            case .PriorityRise:
                self.data = originData.sorted(by: { d, b in
                    d.type > b.type
                })
             //   print(self.data)
                
            case .PriorityDrop:
                self.data = originData.sorted(by: { d, b in
                    d.type < b.type
                })
             //   print(self.data)
            }
        }
    }
    
    // Combine
    var cancellable = Set<AnyCancellable>()
    var clb: AnyCancellable?
    
    /// 初始化数据仓库
    private let repository: UserRepositoryProtocol
    init(repository: UserRepositoryProtocol = UserRepository()) {
        self.repository = repository
        subscripSearchText()
    }
    
    deinit {
        clb?.cancel()
    }
    
    func fetchData() {
        /// 调用数据仓库获取数据
        repository.fetchAnnounment { result in
            switch result {
            case .success(let data):
                self.isLoadingShow = false
                self.data = data
                self.originData = data
            case .failure(let error):
                print("View error: " + error.localizedDescription)
            }
        }
    }
}

/// Combine
/// 根据搜索栏输入内容过滤公告数据
extension AnnouncementViewModel {
    func subscripSearchText() {
      
       clb = $searchText
            .dropFirst()
            .removeDuplicates()
            .sink { [weak self] text in

                if text == "" {
                    self?.data = self!.originData
                } else {
                    self?.data = (self?.originData.compactMap {
                        $0.title.contains(text) ? $0 : nil
                    })!
                }

            }
          //  .store(in: &cancellable)
    }
}
