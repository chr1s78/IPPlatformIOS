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
    @Published var password = ""
    @Published var user: User = User(username: "unknown")
    
    /// 初始化数据仓库
    private let repository: UserRepositoryProtocol
    init(repository: UserRepositoryProtocol = UserRepository()) {
        self.repository = repository
    }
    
    func Login(completion: @escaping (Bool) -> Void)  {
        /// 调用数据仓库获取数据
        repository.fetchUser(username: username, password: password) { [weak self] result in
            switch result {
            case .success(let data):
                self?.user = data
                completion(true)
            case .failure(let error):
                print("View error: " + error.localizedDescription)
                completion(false)
            }
        }
    }
}
