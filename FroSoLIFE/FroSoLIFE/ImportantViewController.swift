//
//  ImportantViewController.swift
//  FroSoLIFE
//
//  Created by Eric Xu on 1/23/16.
//  Copyright © 2016 Eric Xu. All rights reserved.
//

import UIKit

class ImportantViewController: UITableViewController {

    var events = [((UIImage, String), String)]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        //tabTableView.backgroundView = UIImageView(image: UIImage(named: "shield.png"))
        loadEvents()
    }
    
    func loadEvents() {
        
        let userImage1 = UIImage(named: "profile3.png")!
        let userName1 = "RA1"
        let eventLabel1 = "House Meeting @ 9 PM"
        
        let userImage2 = UIImage(named: "profile3.png")!
        let userName2 = "RA2"
        let eventLabel2 = "Schiff Kitchenette Closed"
        
        let userImage3 = UIImage(named: "profile3.png")!
        let userName3 = "RA3"
        let eventLabel3 = "Snow Trip Part 2 Forms Due 1/29"
        
        events += [((userImage1, userName1), eventLabel1), ((userImage2, userName2), eventLabel2), ((userImage3, userName3), eventLabel3)]
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
        cell.eventLabel.text = event.1
        return cell
    }
}
