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
    var cardsBtn = [UIButton]()
    var currentPair = [Int]()
    let cardBackground = "cardBack.jpg"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //var timer = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "update", userInfo: nil, repeats: true)
        
        
        //add buttons to collection
        cardsBtn.append(card1Btn)
        cardsBtn.append(card2Btn)
        cardsBtn.append(card3Btn)
        cardsBtn.append(card4Btn)
        cardsBtn.append(card5Btn)
        cardsBtn.append(card6Btn)
        cardsBtn.append(card7Btn)
        cardsBtn.append(card8Btn)
        cardsBtn.append(card9Btn)
        cardsBtn.append(card10Btn)
        cardsBtn.append(card11Btn)
        cardsBtn.append(card12Btn)
        cardsBtn.append(card13Btn)
        cardsBtn.append(card14Btn)
        cardsBtn.append(card15Btn)
        cardsBtn.append(card16Btn)
        
        //set tags
        for (var i=0; i<cardsBtn.count; i++) {
            cardsBtn[i].tag = i
        }

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
                    NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "update", userInfo: nil, repeats: false)
                }
            }
            //sender.setImage(UIImage(named: "1_JosephSmith.jpg"), forState: UIControlState.Normal)
            print("Sender tag \(sender.tag)")
            print( "Random number \(Int(arc4random_uniform(UInt32(cards.count)) + 1)) " )
            
            
        }
    }
    
    
    // must be internal or public.
    func update() {
        if(numberOfFlipedCards == 2){
            print("reset cards /n")
            for i in currentPair{
                cards[i].setIsFliped(false)
                cardsBtn[i].setImage(UIImage(named: cardBackground), forState: UIControlState.Normal)
            }
            numberOfFlipedCards = 0
        }
    }
    
    func layoutCards()->[Card]{
        var all16Cards = [Card]()
        all16Cards.append(Card(id:  0, imageName: "1_JosephSmith.jpg"))
        all16Cards.append(Card(id:  1, imageName: "2_BrighamYoung.jpg"))
        all16Cards.append(Card(id:  2, imageName: "3_JohnTaylor.jpg"))
        all16Cards.append(Card(id:  3, imageName: "4_WilfordWoodruff.jpg"))
        all16Cards.append(Card(id:  4, imageName: "5_LorenzoSnow.jpg"))
        all16Cards.append(Card(id:  5, imageName: "6_JosephFSmith.jpg"))
        all16Cards.append(Card(id:  6, imageName: "7_HeberJGrant.jpg"))
        all16Cards.append(Card(id:  7, imageName: "8_GeorgeAlbertSmith.jpg"))
        all16Cards.append(Card(id:  8, imageName: "9_DavidOMcKay.jpg"))
        all16Cards.append(Card(id:  9, imageName: "10_JosephFieldingSmith.jpg"))
        all16Cards.append(Card(id: 10, imageName: "11_HaroldBLee.jpg"))
        all16Cards.append(Card(id: 11, imageName: "12_SpencerWKimball.jpg"))
        all16Cards.append(Card(id: 12, imageName: "13_EzraTaftBenson.jpg"))
        all16Cards.append(Card(id: 13, imageName: "14_HowardWHunter.jpg"))
        all16Cards.append(Card(id: 14, imageName: "15_GordonBHinckley.jpg"))
        all16Cards.append(Card(id: 15, imageName: "16_ThomasSMonson.jpg"))
        
        //builds the deck of cards
        var semiRandomCards = [Card]()
        for (var i = 0; i<8; i++){
            var randomNumber = Int(arc4random_uniform(UInt32(all16Cards.count)))
            var card = all16Cards.removeAtIndex(randomNumber)
            semiRandomCards.append(card)
            semiRandomCards.append(card)
        }
        
        //randomizes the card locations
        var fullRandomCards = [Card]()
        for (var i = 0; i<16; i++){
            var randomNumber = Int(arc4random_uniform(UInt32(semiRandomCards.count)))
            var card = semiRandomCards.removeAtIndex(randomNumber)
            fullRandomCards.append(card)
        }
        
        
        
        return fullRandomCards
    }

}

