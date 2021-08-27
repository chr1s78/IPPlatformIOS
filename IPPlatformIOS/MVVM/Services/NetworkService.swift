//
//  NetworkService.swift
//  IPPlatformIOS
//
//  Created by Chr1s on 2021/8/25.
//

import Foundation
import Combine

/// 网络请求错误类型
enum NetworkError: Error {
    case testError
}
/// 网络请求处理协议
protocol NetworkServiceProtocol {
    // 用户登录
    func fetchUser(username: String, password: String, completion: @escaping (Result<User, Error>) -> Void)
    // 获取公告列表
    func fetchAnnouncement(completion: @escaping (Result<AnnouncementModelData, Error>) -> Void)
}

/// 网络请求处理类
/// - 单例模式
/// - Usage : NetworkService.shared
final class NetworkService: NetworkServiceProtocol {
    
    static let shared = NetworkService()
    
    private init() { }
}


/// 获取公告信息
/// ```
/// 对应 Data Model : AnnouncementModel.swift
/// ```
extension NetworkService {
    public func fetchAnnouncement(completion: @escaping (Result<AnnouncementModelData, Error>) -> Void) {
        
        let testData: AnnouncementModelData = [
            AnnouncementModel(type: 0, date: Date(), title: "交底材料模板、实用新型", description: "此文件为发明、实用新型的技术交底书模板，未经允许不得公开", author: "张某某", authorLevel: "总经理"),
            AnnouncementModel(type: 2, date: Date(timeInterval: 100, since: Date()), title: "A交底材料模板、实用新型", description: "此文件为发明、实用新型的技术交底书模板，未经允许不得公开", author: "张某某", authorLevel: "总经理"),
            AnnouncementModel(type: 3, date: Date(timeInterval: 6000, since: Date()), title: "B交底材料模板、实用新型", description: "此文件为发明、实用新型的技术交底书模板，未经允许不得公开", author: "张某某", authorLevel: "总经理"),
            AnnouncementModel(type: 2, date: Date(timeInterval: 12000, since: Date()), title: "C交底材料模板、实用新型", description: "A file、实用新型的技术交底书模板，未经允许不得公开", author: "张某某", authorLevel: "总经理"),
            AnnouncementModel(type: 2, date: Date(timeInterval: 24000, since: Date()), title: "D交底材料模板、实用新型", description: "B file、实用新型的技术交底书模板，未经允许不得公开", author: "张某某", authorLevel: "总经理"),
            AnnouncementModel(type: 2, date: Date(timeInterval: 30000, since: Date()), title: "交底材料模板、实用新型", description: "Bb file、实用新型的技术交底书模板，未经允许不得公开", author: "张某某", authorLevel: "总经理"),
            AnnouncementModel(type: 2, date: Date(timeInterval: 40000, since: Date()), title: "交底材料模板、实用新型", description: "C file、实用新型的技术交底书模板，未经允许不得公开", author: "张某某", authorLevel: "总经理"),
            AnnouncementModel(type: 2, date: Date(timeInterval: 60000, since: Date()), title: "交底材料模板、实用新型", description: "此文件为发明、实用新型的技术交底书模板，未经允许不得公开", author: "张某某", authorLevel: "总经理"),
            AnnouncementModel(type: 2, date: Date(timeInterval: 9000, since: Date()), title: "交底材料模板、实用新型", description: "此文件为发明、实用新型的技术交底书模板，未经允许不得公开", author: "张某某", authorLevel: "总经理"),
            AnnouncementModel(type: 2, date: Date(timeInterval: 140000, since: Date()), title: "交底材料模板、实用新型", description: "此文件为发明、实用新型的技术交底书模板，未经允许不得公开", author: "张某某", authorLevel: "总经理")
        ]
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion(.success(testData))
        }
    }
}

/// 获取用户信息
/// ```
/// 对应 Data Model : User.swift
/// https:
/// ```
extension NetworkService{
    public func fetchUser(username: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        
        let user = User(username: "中智讯(青岛)")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion(.success(user))
          //  completion(.failure(TestError.testError))
        }
    }
}



