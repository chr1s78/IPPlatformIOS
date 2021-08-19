//
//  UserRepository.swift
//  PlaygroundCollection
//
//  Created by 吕博 on 2021/7/29.
//

import Foundation

protocol UserRepositoryProtocol {
    func fetchUser(id: Int, completion: @escaping (Result<templateModelData, Error>) -> Void)
}

/// 数据仓库
/// ```
/// 调用方 : ViewModel
/// 调用   : UserApiService
/// ````
final class UserRepository: UserRepositoryProtocol {
    
    /// 初始化数据服务
    private let apiService: UserApiServiceProtocol
    init(apiService: UserApiServiceProtocol = UserApiService()) {
        self.apiService = apiService
    }
    
    func fetchUser(id: Int = 1, completion: @escaping (Result<templateModelData, Error>) -> Void) {
        /// 调用数据服务获取数据
        apiService.fetchUser(id: id, completion: completion)
    }
}
