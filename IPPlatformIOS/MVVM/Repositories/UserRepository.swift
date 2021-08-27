//
//  UserRepository.swift
//  PlaygroundCollection
//
//  Created by 吕博 on 2021/7/29.
//

import Foundation

protocol UserRepositoryProtocol {
    func fetchUser(username: String, password: String, completion: @escaping (Result<User, Error>) -> Void)
    
    func fetchAnnounment(completion: @escaping (Result<AnnouncementModelData, Error>) -> Void)
}

/// 数据仓库
/// ```
/// 调用方 : ViewModel
/// 调用   : UserApiService
/// ````
final class UserRepository: UserRepositoryProtocol {
    
    static let shared = UserRepository()
    /// 初始化数据服务
//    private let apiService: UserApiServiceProtocol
//    init(apiService: UserApiServiceProtocol = UserApiService()) {
//        self.apiService = apiService
//    }
    
    /// 获取公告信息
    public func fetchAnnounment(completion: @escaping (Result<AnnouncementModelData, Error>) -> Void) {
        //apiService.fetchAnnouncement(completion: completion)
        NetworkService.shared.fetchAnnouncement(completion: completion)
    }
    
    public func fetchUser(username: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        /// 调用数据服务获取数据
        //apiService.fetchUser(username: username, password: password, completion: completion)
        NetworkService.shared.fetchUser(username: username, password: password, completion: completion)
        
    }
}
