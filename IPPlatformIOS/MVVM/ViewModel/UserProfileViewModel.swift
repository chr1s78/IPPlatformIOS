//
//  UserProfileViewModel.swift
//  PlaygroundCollection
//
//  Created by 吕博 on 2021/7/29.
//

import Foundation

// View Model
// 通过数据仓库获取数据
final class UserProfileViewModel: ObservableObject {
    @Published var username = ""
    @Published var user: templateModelData = templateModelData()
    
    /// 初始化数据仓库
    private let repository: UserRepositoryProtocol
    init(repository: UserRepositoryProtocol = UserRepository()) {
        self.repository = repository
    }
    
    func onAppear() {
        /// 调用数据仓库获取数据
        repository.fetchUser(id: 1) { result in
            switch result {
            case .success(let data):
                self.user = data
            case .failure(let error):
                print("View error: " + error.localizedDescription)
            }
        }
    }
}
