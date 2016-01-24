//
//  NotificationViewController.swift
//  FroSoLIFE
//
//  Created by Eric Xu on 1/23/16.
//  Copyright © 2016 Eric Xu. All rights reserved.
//

import UIKit

class NotificationViewController: UITableViewController {
    
    var notifications = [String]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        //tabTableView.backgroundView = UIImageView(image: UIImage(named: "shield.png"))
        loadNotifications()
    }
    
    func loadNotifications() {
        
        notifications += ["Item Notifications"]
        notifications += ["Free Food Notifications"]
        notifications += ["Event Notifications"]
    }
    
    // MARK: TableView data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notifications.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("NotificationCell", forIndexPath: indexPath) as! NotificationTableViewCell
        let notification = notifications[indexPath.row]
        cell.notificationLabel.text = notification
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}
