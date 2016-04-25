//
//  Post.swift
//  FourChanGifViewer
//
//  Created by takashi on 2016/04/26.
//  Copyright © 2016年 takashi. All rights reserved.
//

import Foundation
import Himotoki
import APIKit

struct Post : Decodable {
    let no:Int
    let resto:Int
    let now:String
    let time:Int
    let name:String?
    let sub:String?
    let com:String?
    let filename:String?
    let ext:String?
    let replies:Int?
    let images:Int?
    let semanticUrl:String?
    
    static func decode(e: Extractor) throws -> Post {
        return try Post(no: e <| "no", resto: e <| "resto", now: e <| "now",
                        time: e <| "time", name: e <|? "name", sub: e <|? "sub",
                        com: e <|? "com", filename: e <|? "filename", ext: e <|? "ext",
                        replies: e <|? "replies", images: e <|? "images", semanticUrl: e <|? "semantic_url")
    }
}
