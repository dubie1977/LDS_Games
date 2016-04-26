//
//  MatchingGameVC.swift
//  KidsLDS
//
//  Created by Joseph DuBay on 4/16/16.
//  Copyright © 2016 DuBay Designs. All rights reserved.
//

import UIKit
import AVFoundation

class MatchingGameVC: UIViewController {

    //outlets
    @IBOutlet weak var card0: Card!
    @IBOutlet weak var card1: Card!
    @IBOutlet weak var card2: Card!
    @IBOutlet weak var card3: Card!
    @IBOutlet weak var card4: Card!
    @IBOutlet weak var card5: Card!
    @IBOutlet weak var card6: Card!
    @IBOutlet weak var card7: Card!
    @IBOutlet weak var card8: Card!
    @IBOutlet weak var card9: Card!
    @IBOutlet weak var card10: Card!
    @IBOutlet weak var card11: Card!
    @IBOutlet weak var card12: Card!
    @IBOutlet weak var card13: Card!
    @IBOutlet weak var card14: Card!
    @IBOutlet weak var card15: Card!
    
    @IBOutlet weak var settingBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    
    
    //local vars
    var cardsFliped = [CardOld]()
    var cards = [CardOld]()
    var cardsBtn = [UIButton]()
    let cardBackground = "cardBack.jpg"
    var cardFlippedSound = AVAudioPlayer()
    var matchFoundSound = AVAudioPlayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    //Internal Functions
    func layoutCards()->[CardOld]{
        var all16Cards = [CardOld]()
        all16Cards.append(CardOld(id:  0, imageName: "1_JosephSmith.jpg"))
        all16Cards.append(CardOld(id:  1, imageName: "2_BrighamYoung.jpg"))
        all16Cards.append(CardOld(id:  2, imageName: "3_JohnTaylor.jpg"))
        all16Cards.append(CardOld(id:  3, imageName: "4_WilfordWoodruff.jpg"))
        all16Cards.append(CardOld(id:  4, imageName: "5_LorenzoSnow.jpg"))
        all16Cards.append(CardOld(id:  5, imageName: "6_JosephFSmith.jpg"))
        all16Cards.append(CardOld(id:  6, imageName: "7_HeberJGrant.jpg"))
        all16Cards.append(CardOld(id:  7, imageName: "8_GeorgeAlbertSmith.jpg"))
        all16Cards.append(CardOld(id:  8, imageName: "9_DavidOMcKay.jpg"))
        all16Cards.append(CardOld(id:  9, imageName: "10_JosephFieldingSmith.jpg"))
        all16Cards.append(CardOld(id: 10, imageName: "11_HaroldBLee.jpg"))
        all16Cards.append(CardOld(id: 11, imageName: "12_SpencerWKimball.jpg"))
        all16Cards.append(CardOld(id: 12, imageName: "13_EzraTaftBenson.jpg"))
        all16Cards.append(CardOld(id: 13, imageName: "14_HowardWHunter.jpg"))
        all16Cards.append(CardOld(id: 14, imageName: "15_GordonBHinckley.jpg"))
        all16Cards.append(CardOld(id: 15, imageName: "16_ThomasSMonson.jpg"))
        
        //builds the deck of cards
        var semiRandomCards = [CardOld]()
        for _ in 0 ..< 8 {
            let randomNumber = Int(arc4random_uniform(UInt32(all16Cards.count)))
            let card = all16Cards.removeAtIndex(randomNumber)
            semiRandomCards.append(card)
            semiRandomCards.append(CardOld(id: card.getTagID(), imageName: card.getImageName()))
        }
        
        //randomizes the card locations
        var fullRandomCards = [CardOld]()
        for i in 0..<16 {
            let randomNumber = Int(arc4random_uniform(UInt32(semiRandomCards.count)))
            let card = semiRandomCards.removeAtIndex(randomNumber)
            card.setTagID(i)
            fullRandomCards.append(card)
        }
        
        
        
        return fullRandomCards
    }
    
    func setupGame(){
        //matchCounterLbl.text = "0"
        cards = layoutCards()
        for button in cardsBtn{
            button.setImage(UIImage(named: cardBackground), forState: UIControlState.Normal)
        }
    }
    
    func resetGames(){
        //wonCounterLbl.text = "0"
        setupGame()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
