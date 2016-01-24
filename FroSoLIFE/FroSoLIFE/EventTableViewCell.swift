//
//  EventTableViewCell.swift
//  FroSoLIFE
//
//  Created by Eric Xu on 1/23/16.
//  Copyright © 2016 Eric Xu. All rights reserved.
//
import UIKit

class EventTableViewCell: UITableViewCell {
    
    // MARK: Properties
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var eventLabel: UILabel!
    @IBOutlet weak var eventTime: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
