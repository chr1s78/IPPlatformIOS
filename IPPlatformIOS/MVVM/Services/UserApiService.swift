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
    func fetchUser(id: Int, completion: @escaping (Result<templateModelData, Error>) -> Void)
}

/// 数据服务
/// ```
/// 调用网络请求获取数据
/// ```
final class UserApiService: UserApiServiceProtocol {
  
    private var cancellable: Cancellable? = nil
    
    /// Demo 获取用户信息
    /// ```
    /// From Jsonplaceholder WebSite
    /// https://jsonplaceholder.typicode.com/comments?postId=1
    /// ```
    func fetchUser(id: Int, completion: @escaping (Result<templateModelData, Error>) -> Void) {
       
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
