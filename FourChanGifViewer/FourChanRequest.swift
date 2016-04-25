//
//  FourChanRequest.swift
//  FourChanGifViewer
//
//  Created by takashi on 2016/04/26.
//  Copyright © 2016年 takashi. All rights reserved.
//

import Foundation

import Himotoki
import APIKit

protocol FourChanRequest : RequestType {}

extension FourChanRequest {
    var baseURL: NSURL {
        return NSURL(string: "https://a.4cdn.org/wsg/")!
    }
}

extension FourChanRequest where Self.Response: Decodable {
    func responseFromObject(object: AnyObject, URLResponse: NSHTTPURLResponse) -> Self.Response? {
        return try? decodeValue(object)
    }
}
