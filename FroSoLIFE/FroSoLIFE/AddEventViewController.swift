//
//  AddEventViewController.swift
//  FroSoLIFE
//
//  Created by Eric Xu on 1/23/16.
//  Copyright © 2016 Eric Xu. All rights reserved.
//

import UIKit

class AddEventViewController: UIViewController, UITextFieldDelegate {

    // MARK: Properties
    @IBOutlet weak var titleLabel: UITextField!
    @IBOutlet weak var descriptionLabel: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle the text field's user input through delegate callbacks.
        titleLabel.delegate = self
        descriptionLabel.layer.borderColor = UIColor.blackColor().CGColor
        descriptionLabel.layer.borderWidth = 1
    }
    
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
}
