//
//  ViewController.swift
//  FroSoLIFE
//
//  Created by Eric Xu on 1/22/16.
//  Copyright © 2016 Eric Xu. All rights reserved.
//

import UIKit

class TabViewController: UITableViewController {
    
    var tabs = [(UIImage, String)]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        //tabTableView.backgroundView = UIImageView(image: UIImage(named: "shield.png"))
        loadTabs()
    }
    
    func loadTabs() {
        
        let photo1 = UIImage(named: "laundry.png")!
        let label1 = "Laundry";
        
        let photo2 = UIImage(named: "item.png")!
        let label2 = "Items"
        
        let photo3 = UIImage(named: "food.jpg")!
        let label3 = "Food"
        
        let photo4 = UIImage(named: "events.jpg")!
        let label4 = "Events"
        
        let photo5 = UIImage(named: "settings.png")!
        let label5 = "Settings"
        
        tabs += [(photo1, label1), (photo2, label2), (photo3, label3), (photo4, label4), (photo5, label5)]
    }
    
    // MARK: TableView data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tabs.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("TabCell", forIndexPath: indexPath) as! TabTableViewCell
        let tab = tabs[indexPath.row]
        cell.tabImage.image = tab.0
        cell.tabLabel.text = tab.1
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if indexPath.row == 3 {
            self.performSegueWithIdentifier("EventsSegue", sender: self)
        }
        else if indexPath.row == 4 {
            self.performSegueWithIdentifier("SettingsSegue", sender: self)
        }
        else {
            tableView.deselectRowAtIndexPath(indexPath, animated: true)
        }
    }
}

