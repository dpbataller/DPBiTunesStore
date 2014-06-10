//
//  iTunesStoreTableViewController.swift
//  iTunesStore
//
//  Created by David Pedrosa on 10/06/14.
//  Copyright (c) 2014 David Pedrosa Bataller. All rights reserved.
//

import UIKit

class iTunesStoreTableViewController: UITableViewController {

    let manager = AFHTTPRequestOperationManager()
    var tableData: NSArray = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getItunesStore()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // #pragma mark - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView?) -> Int {
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView?, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return self.tableData.count
    }


    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        
        let cell:CustomTableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as CustomTableViewCell
        var item:NSDictionary = self.tableData[indexPath.row] as NSDictionary
        
        var appNameDict: NSDictionary = item["im:name"] as NSDictionary
        var appSumary: NSDictionary = item["summary"] as NSDictionary
        var artistArray: NSArray  = item["im:image"] as NSArray
        var artistDict:NSDictionary = artistArray[0] as NSDictionary
        
        cell.appName.text = appNameDict["label"] as String
        cell.appDescription.text = appSumary["label"] as String
        cell.artistImage.setImageWithURL(NSURL(string:artistDict["label"] as String))
        
        return cell
    }
    
    
    func getItunesStore() {
        
        self.manager.GET( "https://itunes.apple.com/es/rss/topfreeapplications/limit=10/json",
            parameters: nil,
            success: { (operation: AFHTTPRequestOperation!,responseObject: AnyObject!) in
                var jsonResult: NSDictionary = responseObject as NSDictionary
                jsonResult = jsonResult["feed"] as NSDictionary
                self.tableData = jsonResult["entry"] as NSArray
                
                self.tableView.reloadData()
            },
            failure: { (operation: AFHTTPRequestOperation!,error: NSError!) in
                println("Error:" + error.localizedDescription)
            })
        
    }

}
