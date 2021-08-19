//
//  User.swift
//  PlaygroundCollection
//
//  Created by 吕博 on 2021/7/29.
//

import Foundation

struct User {
    let username: String
}

/*
    Test Data from "http://jsonplaceholder.typicode.com/comments?postId=1"
    Format Data Struct form "https://app.quicktype.io"
 */

// MARK: - templateModelDatum
struct templateModelDatum: Codable, Identifiable {
    let postId, id: Int
    let name, email, body: String
}

typealias templateModelData = [templateModelDatum]
