//
//  TodayViewController.swift
//  FroSoLIFE
//
//  Created by Eric Xu on 1/23/16.
//  Copyright © 2016 Eric Xu. All rights reserved.
//

import UIKit

class TodayViewController: UITableViewController {

    var events = [((UIImage, String), (String, String))]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        //tabTableView.backgroundView = UIImageView(image: UIImage(named: "shield.png"))
        loadEvents()
    }
    
    func loadEvents() {
        
        let userImage1 = UIImage(named: "profile3.png")!
        let userName1 = "User2"
        let eventLabel1 = "Yamato - The Drummers of Japan"
        let eventTime1 = "7:30 PM"
        
        let userImage2 = UIImage(named: "profile3.png")!
        let userName2 = "User1"
        let eventLabel2 = "Into the Woods"
        let eventTime2 = "8:00 PM"
    
        let userImage3 = UIImage(named: "profile3.png")!
        let userName3 = "User3"
        let eventLabel3 = "FroSoHacks"
        let eventTime3 = "9:00 PM"
        
        events += [((userImage1, userName1), (eventLabel1, eventTime1)), ((userImage2, userName2), (eventLabel2, eventTime2)), ((userImage3, userName3), (eventLabel3, eventTime3))]
    }
    
    // MARK: TableView data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("EventCell", forIndexPath: indexPath) as! EventTableViewCell
        let event = events[indexPath.row]
        cell.userImage.image = event.0.0
        cell.userName.text = event.0.1
        cell.eventLabel.text = event.1.0
        cell.eventTime.text = event.1.1
        return cell
    }
    
}
