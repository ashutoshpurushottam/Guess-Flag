//
//  ViewController.swift
//  Guess-Flag
//
//  Created by Ashutosh Purushottam on 4/9/16.
//  Copyright © 2016 Vivid Designs. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {
    
    @IBOutlet weak var topFlagButton: UIButton!
    @IBOutlet weak var bottomFlagButton: UIButton!
    @IBOutlet weak var centerFlagButton: UIButton!
    
    var score = 0
    var countries = [String]()
    var correctAnswer = 0
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        // Set border on flag images
        topFlagButton.layer.borderWidth = 1
        centerFlagButton.layer.borderWidth = 1
        bottomFlagButton.layer.borderWidth = 1
        topFlagButton.layer.borderColor = UIColor.lightGrayColor().CGColor
        centerFlagButton.layer.borderColor = UIColor.lightGrayColor().CGColor
        bottomFlagButton.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        askQuestions()
    }
    
    // Passed UIAlertAction with default value nil
    func askQuestions(action: UIAlertAction! = nil)
    {
        // Shuffle array
        countries = GKRandomSource.sharedRandom().arrayByShufflingObjectsInArray(countries) as! [String]
        // Generate random number between 0 and 2
        correctAnswer = GKRandomSource.sharedRandom().nextIntWithUpperBound(3)

        
        topFlagButton.setImage(UIImage(named: countries[0]), forState: .Normal)
        centerFlagButton.setImage(UIImage(named: countries[1]), forState: .Normal)
        bottomFlagButton.setImage(UIImage(named: countries[2]), forState: .Normal)
        
        
        // Set title 
        title = countries[correctAnswer].uppercaseString
        
    }
    
    // MARK: -Actions
    
    @IBAction func buttonTapped(sender: UIButton)
    {
        // Check whether the user tapped the correct button
        if sender.tag == correctAnswer
        {
            title = "Correct"
            score++
        }
        else
        {
            title = "Wrong"
            score--
        }
        
        let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .Alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .Default, handler:askQuestions))
        presentViewController(ac, animated: true, completion: nil)
    }
}

