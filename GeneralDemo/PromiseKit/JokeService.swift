//
//  JokeService.swift
//  GeneralDemo
//
//  Created by mao li on 2021/9/1.
//

import Foundation
import Moya

enum JokeService {
    case list(sort: String, page: Int, pagesize: Int, time: String)
}

private let api_key = "659f4bd0f5b067cf5d613ac77dac7c7b"
extension JokeService: TargetType {
    var path: String {
        switch self {
        case .list:
            return "/joke/content/list.php"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .list:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .list(let sort,let page,let pagesize,let time):
            return Task.requestParameters(parameters: ["sort": sort, "page": page, "pagesize": pagesize, "time": time, "key": api_key], encoding: URLEncoding.queryString)
        }
 
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    var baseURL: URL {
        return URL.init(string: "http://v.juhe.cn")!
    }
}


struct JokeModel: Codable {
    let reason: String?
    let error_code: Int = 0
    let result: JokeData?
}

struct JokeData: Codable {
    let data: [JokeItem]?
}

struct JokeItem: Codable {
    let content: String
    let hashId: String
    let unixtime: Int
    let updatetime: String
}
