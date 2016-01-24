//
//  TabTableViewCell.swift
//  FroSoLIFE
//
//  Created by Eric Xu on 1/23/16.
//  Copyright © 2016 Eric Xu. All rights reserved.
//

import UIKit

class TabTableViewCell: UITableViewCell {

    // MARK: Properties
    @IBOutlet weak var tabImage: UIImageView!
    @IBOutlet weak var tabLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
