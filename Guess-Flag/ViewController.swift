//
//  ViewController.swift
//  Guess-Flag
//
//  Created by Ashutosh Purushottam on 4/9/16.
//  Copyright © 2016 Vivid Designs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var topFlagButton: UIButton!
    @IBOutlet weak var bottomFlagButton: UIButton!
    @IBOutlet weak var centerFlagButton: UIButton!
    
    var score = 0
    var countries = [String]()
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        // Set image border on flag images
        topFlagButton.layer.borderWidth = 1
        centerFlagButton.layer.borderWidth = 1
        bottomFlagButton.layer.borderWidth = 1
        topFlagButton.layer.borderColor = UIColor.lightGrayColor().CGColor
        centerFlagButton.layer.borderColor = UIColor.lightGrayColor().CGColor
        bottomFlagButton.layer.borderColor = UIColor.lightGrayColor().CGColor
        askQuestions()
    }
    
    func askQuestions()
    {
        topFlagButton.setImage(UIImage(named: countries[0]), forState: .Normal)
        centerFlagButton.setImage(UIImage(named: countries[1]), forState: .Normal)
        bottomFlagButton.setImage(UIImage(named: countries[2]), forState: .Normal)
        
    }


}

