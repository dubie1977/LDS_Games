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
    var cards = [Card]()
    var currentPair = [Int]()
    let cardBackground = "cardBack.jpg"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //var timer = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "update", userInfo: nil, repeats: true)
        
        //set tag on cards
        card1Btn.tag = 0
        card2Btn.tag = 1
        card3Btn.tag = 2
        card4Btn.tag = 3
        card5Btn.tag = 4
        card6Btn.tag = 5
        card7Btn.tag = 6
        card8Btn.tag = 7
        card9Btn.tag = 8
        card10Btn.tag = 9
        card11Btn.tag = 10
        card12Btn.tag = 11
        card13Btn.tag = 12
        card14Btn.tag = 13
        card15Btn.tag = 14
        card16Btn.tag = 15
        
        cards = layoutCards()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func cardSelected(sender: UIButton) {
        if(numberOfFlipedCards < 2){
            var id = sender.tag
            if(id < cards.count){
                var card = cards[id]
                sender.setImage(UIImage(named: card.getImageName()), forState: UIControlState.Normal)
                currentPair.append(id)
                numberOfFlipedCards++
                if(numberOfFlipedCards == 2){
                    var timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "update", userInfo: nil, repeats: false)
                }
            }
            //sender.setImage(UIImage(named: "1_JosephSmith.jpg"), forState: UIControlState.Normal)
            print(sender.tag)
            
            
        }
    }
    
    
    // must be internal or public.
    func update() {
        if(numberOfFlipedCards == 2){
            print("reset cards /n")
            for i in currentPair{
                cards[i].setIsFliped(false)
                card1Btn.setImage(UIImage(named: cardBackground), forState: UIControlState.Normal)
                card2Btn.setImage(UIImage(named: cardBackground), forState: UIControlState.Normal)
            }
            numberOfFlipedCards = 0
        }
    }
    
    func layoutCards()->[Card]{
        var cards = [Card]()
        cards.append(Card(id: 0, imageName: "1_JosephSmith.jpg"))
        cards.append(Card(id: 1, imageName: "2_BrighamYoung.jpg"))
        cards.append(Card(id: 2, imageName: "3_JohnTaylor.jpg"))
        cards.append(Card(id: 3, imageName: "4_WilfordWoodruff.jpg"))
        
        return cards
    }

}

