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
    @IBOutlet weak var gameModeLbl: UILabel!
    
    
    //local vars
    var deck: Deck!
    var board: MatchingGameBoard!
    var cards: [Card]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cards = [Card]()
        //card0.setTagID(0)
        cards.append(card0)
        //card1.setTagID(1)
        cards.append(card1)
        //card2.setTagID(2)
        cards.append(card2)
        //card3.setTagID(3)
        cards.append(card3)
        //card4.setTagID(4)
        cards.append(card4)
        //card5.setTagID(5)
        cards.append(card5)
        //card6.setTagID(6)
        cards.append(card6)
        //card7.setTagID(7)
        cards.append(card7)
        //card8.setTagID(8)
        cards.append(card8)
        //card9.setTagID(9)
        cards.append(card9)
        //card10.setTagID(10)
        cards.append(card10)
        //card11.setTagID(11)
        cards.append(card11)
        //card12.setTagID(12)
        cards.append(card12)
        //card13.setTagID(13)
        cards.append(card13)
        //card14.setTagID(14)
        cards.append(card14)
        //card15.setTagID(15)
        cards.append(card15)

        
        startGame()
    }

    func startGame(){
    
        deck = ProphetDeck()
        board = MatchingGameBoard(cards: deck.dealCardsInPairs(cards: cards))
        gameModeLbl.text = board.gameMode
        
        
    }
    
    @IBAction func settingButtonClicked(sender: UIButton) {
        gameModeLbl.text = board.nextGameMode()
    }
    
    @IBAction func backButtonClicked(sender: UIButton) {
        startGame()
    }
    
    @IBAction func cardClicked(sender: Card) {
        if (board.cardSelected(newCard: sender)){
            Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(MatchingGameVC.resetCards), userInfo: nil, repeats: false)
            board.pausingGame = true
        }
    }
    
    @objc func resetCards() {
        board.endPause()
    }
    

 

}
