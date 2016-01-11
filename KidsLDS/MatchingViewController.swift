//
//  ViewController.swift
//  KidsLDS
//
//  Created by Joseph DuBay on 1/9/16.
//  Copyright © 2016 DuBay Designs. All rights reserved.
//

import UIKit

class MatchingViewController: UIViewController {

    //cards
    @IBOutlet weak var card1Btn: UIButton!
    @IBOutlet weak var card2Btn: UIButton!
    @IBOutlet weak var card3Btn: UIButton!
    @IBOutlet weak var card4Btn: UIButton!
    @IBOutlet weak var card5Btn: UIButton!
    @IBOutlet weak var card6Btn: UIButton!
    @IBOutlet weak var card7Btn: UIButton!
    @IBOutlet weak var card8Btn: UIButton!
    @IBOutlet weak var card9Btn: UIButton!
    @IBOutlet weak var card10Btn: UIButton!
    @IBOutlet weak var card11Btn: UIButton!
    @IBOutlet weak var card12Btn: UIButton!
    @IBOutlet weak var card13Btn: UIButton!
    @IBOutlet weak var card14Btn: UIButton!
    @IBOutlet weak var card15Btn: UIButton!
    @IBOutlet weak var card16Btn: UIButton!
    
    
    //local vars
    var numberOfFlipedCards = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var timer = NSTimer.scheduledTimerWithTimeInterval(0.4, target: self, selector: "update", userInfo: nil, repeats: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func cardSelected(sender: UIButton) {
        if(numberOfFlipedCards < 2){
            sender.setImage(UIImage(named: "1_JosephSmith.jpg"), forState: UIControlState.Normal)
            numberOfFlipedCards++
        }
    }
    
    
    // must be internal or public.
    func update() {
        if(numberOfFlipedCards == 2){
            print("reset cards /n")
            numberOfFlipedCards = 0
        }
    }

}

