//
//  Thread.swift
//  FourChanGifViewer
//
//  Created by takashi on 2016/04/26.
//  Copyright © 2016年 takashi. All rights reserved.
//

import Foundation

import Himotoki
import APIKit

struct FourChanThreadsRequest : FourChanRequest {
    typealias Response = Threads
    
    var method: HTTPMethod {
        return .GET
    }
    
    var path: String {
        return "/threads.json"
    }
    
    func responseFromObject(object: AnyObject, URLResponse: NSHTTPURLResponse) -> FourChanThreadsRequest.Response? {
        return try? decodeValue(object[0])
    }
}

struct FourChanThreadRequest : FourChanRequest {
    typealias Response = Thread
    
    let id:Int
    
    init(id: Int) {
        self.id = id
    }
    
    var method: HTTPMethod {
        return .GET
    }
    
    var path: String {
        return "/thread/\(id).json"
    }
}

struct Thread : Decodable {
    let no:Int?
    let lastModified:Int?
    let posts:[Post]?
    
    static func decode(e: Extractor) throws -> Thread {
        return try Thread(no: e <|? "no" , lastModified: e <|? "last_modified", posts: e <||? ["posts"])
    }
}

struct Threads : Decodable {
    let page:Int
    let threads:[Thread]
    
    static func decode(e: Extractor) throws -> Threads {
        return try Threads(page: e <| "page", threads: e <|| "threads")
    }
}
