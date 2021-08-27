//
//  AnnouncementModel.swift
//  IPPlatformIOS
//
//  Created by Chr1s on 2021/8/22.
//

import Foundation

/// 公告内容
/// ```
/// type        类型
/// date        日期
/// title       标题
/// description 公告内容
/// author      作者
/// authorLevel 作者级别
/// ```
struct AnnouncementModel: Identifiable, Codable, Hashable {
    var id = UUID()
    var type: Int
    var date: Date
    var title: String
    var description: String
    var author: String
    var authorLevel: String
}

typealias AnnouncementModelData = [AnnouncementModel]


/// 公告栏排序方式
/// ```
/// DateRise        时间升序
/// DateDrop        时间降序
/// PriorityRise    重要度升序
/// PriorityDrop    重要度降序
/// ```
enum AnnounceSortStyle {
    case DateRise
    case DateDrop
    case PriorityRise
    case PriorityDrop
}
