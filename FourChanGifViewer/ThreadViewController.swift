//
//  ThreadViewController.swift
//  FourChanGifViewer
//
//  Created by takashi on 2016/04/28.
//  Copyright © 2016年 takashi. All rights reserved.
//

import UIKit

import APIKit

class ThreadViewController: UIViewController {
    var no:Int = 0
    var thread:Thread?
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let request = FourChanThreadRequest(id: no)
        
        Session.sendRequest(request) { result in
            switch result {
            case .Success(let response):
                self.thread = response
            case .Failure(let error):
                print(error)
            }
        }
    }
}
