//
//  UserApiService.swift
//  PlaygroundCollection
//
//  Created by 吕博 on 2021/7/29.
//

import Foundation
//import Alamofire
import Combine

/// 数据服务协议
protocol UserApiServiceProtocol {
    // 用户登录
    func fetchUser(username: String, password: String, completion: @escaping (Result<User, Error>) -> Void)
    // 获取公告列表
    func fetchAnnouncement(completion: @escaping (Result<AnnouncementModelData, Error>) -> Void)
}

/// 数据服务
/// ```
/// 调用网络请求获取数据
/// ```
final class UserApiService: UserApiServiceProtocol {
    
    /// 获取公告信息
    /// ```
    /// httpRequest Address :
    /// ```
    func fetchAnnouncement(completion: @escaping (Result<AnnouncementModelData, Error>) -> Void) {
        
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
        
        completion(.success(testData))
    }
    
  
    private var cancellable: Cancellable? = nil
    
    enum TestError: Error {
        case testError
    }
    /// Demo 获取用户信息
    /// ```
    /// From Jsonplaceholder WebSite
    /// https://jsonplaceholder.typicode.com/comments?postId=1
    /// ```
    func fetchUser(username: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        
        let user = User(username: "中智讯(青岛)")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion(.success(user))
          //  completion(.failure(TestError.testError))
        }
//        let parameter = ["postId" : 1 ]
//        cancellable =
//            AF.request("https://jsonplaceholder.typicode.com/comments?postId=1", method: .get)
//            .validate(statusCode: 200..<300)
//            .publishDecodable(type: templateModelData.self)
//            .sink(receiveCompletion: { (completion) in
//                switch completion {
//                case .finished:
//                    #if DEBUG
//                    print("sink finished")
//                    #endif
//                case .failure(let error):
//                    #if DEBUG
//                    print("sink failure: " + error.localizedDescription)
//                    #endif
//                }
//            }, receiveValue: { (response) in
//                switch response.result {
//                case .success(let data):
//                    completion(.success(data))
//                case .failure(let error):
//                    #if DEBUG
//                        print(error.localizedDescription)
//                        print(String(describing: error))
//                    #endif
//                    completion(.failure(error))
//                }
//            })
    }
}

extension UserApiService {
    
}
