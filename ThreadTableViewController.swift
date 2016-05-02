//
//  ItemTableViewController.swift
//  FourChanGifViewer
//
//  Created by takashi on 2016/04/25.
//  Copyright © 2016年 takashi. All rights reserved.
//

import UIKit

import APIKit

class ThreadTableViewController: UITableViewController {
    var threads: Threads = Threads(page: 0, threads: [])

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let request = FourChanThreadsRequest()
        
        Session.sendRequest(request) { result in
            switch result {
            case .Success(let response):
                self.threads = response
                self.tableView.reloadData()
            case .Failure(let error):
                print(error)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerNib(UINib(nibName: "ThreadTableViewCell", bundle: nil), forCellReuseIdentifier: "ThreadTableViewCell")        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return threads.threads.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier("ThreadTableViewCell", forIndexPath: indexPath) as? ThreadTableViewCell else {
            fatalError()
        }
        
        cell.name.text = String(threads.threads[indexPath.row].no!)

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("ShowThreadViewController", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let threadViewController = segue.destinationViewController as! ThreadViewController
        threadViewController.no = threads.threads[tableView.indexPathForSelectedRow!.row].no!
    }
}
