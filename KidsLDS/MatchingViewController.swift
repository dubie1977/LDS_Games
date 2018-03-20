//
//  ViewController.swift
//  KidsLDS
//
//  Created by Joseph DuBay on 1/9/16.
//  Copyright © 2016 DuBay Designs. All rights reserved.
//

import UIKit
import AVFoundation

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
    
    @IBOutlet weak var matchCounterLbl: UILabel!
    @IBOutlet weak var wonCounterLbl: UILabel!
    
    @IBOutlet weak var resetBtn: UIButton!
    @IBOutlet weak var newGameBtn: UIButton!
    
    //local vars
    var cardsFliped = [CardOld]()
    var cards = [CardOld]()
    var cardsBtn = [UIButton]()
    let cardBackground = "cardBack.jpg"
    var cardFlippedSound = AVAudioPlayer()
    var matchFoundSound = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
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
        for i in 0..<cardsBtn.count {
            cardsBtn[i].tag = i
        }
        
        resetGames()
        
        //sound
        /*
        let path = NSBundle.mainBundle().pathForResource("07_coin", ofType: ".wav")
        let soundURL = NSURL(fileURLWithPath: path!)
        
        do{
            try cardFlippedSound = AVAudioPlayer(contentsOfURL: soundURL)
            cardFlippedSound.prepareToPlay()
        } catch let err as NSError{
            print(err.debugDescription)
        } */
        
        cardFlippedSound = getSoundFromFile(fileName: "07_coin", fileType: ".wav")
        matchFoundSound = getSoundFromFile(fileName: "awesome", fileType: ".wav")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func getSoundFromFile(fileName: String, fileType: String) -> AVAudioPlayer{
        var sound = AVAudioPlayer()
        let path = Bundle.main.path(forResource: fileName, ofType: fileType)
        let soundURL = NSURL(fileURLWithPath: path!)
        
        do{
            try sound = AVAudioPlayer(contentsOf: soundURL as URL)
            sound.prepareToPlay()
        } catch let err as NSError{
            print(err.debugDescription)
        }
        
        return sound
    }
    
    
    


//Action functions
    @IBAction func cardSelected(sender: UIButton) {
        if(cardsFliped.count < 2){
            let id = sender.tag
            let card = cards[id]
            
            cardFlippedSound.play()
            
            if( id < cards.count && !cards[id].isMatched() && (!cardsFliped.contains(card)) ){
                sender.setImage(UIImage(named: card.getImageName()), for: UIControlState.normal)
                cardsFliped.append(card)
                if(cardsFliped.count == 2 && cardsFliped[0].getImageName()==cardsFliped[1].getImageName()){
                    //cards match
                    matchFoundSound.play()
                    
                    for match in cardsFliped{
                        match.setMatched(isMatched: true)
                    }
                    let matches = Int(matchCounterLbl.text!)!+1
                    matchCounterLbl.text = "\(matches)"
                    cardsFliped.removeAll()
                    
                    if((cards.count / 2) == matches){
                        //game won
                        wonCounterLbl.text = "\(Int(wonCounterLbl.text!)!+1)"
                    }
                }else {
                    Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(MatchingViewController.wait), userInfo: nil, repeats: false)
                }
            }
            
            
        }
    }
    
    @IBAction func newGameSelected(sender: UIButton) {
        setupGame()
    }
    
    @IBAction func resetGamesSelected(sender: UIButton) {
        resetGames()
    }
    
    func setupAudioPlayerWithFile() -> AVAudioPlayer  {
        
        if let url = Bundle.main.url(forResource: "awesome", withExtension: "wav") {
            do {
                return try AVAudioPlayer(contentsOf: url)
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
        return AVAudioPlayer()
    }
    
//internal functions
    @objc func wait() {
        if(cardsFliped.count == 2){
            print("reset cards \n")
            for card in cardsFliped{
                cards[card.getTagID()].setFliped(isFliped: false)
                cardsBtn[card.getTagID()].setImage(UIImage(named: cardBackground), for: UIControlState.normal)
            }
            cardsFliped.removeAll()
        }
    }
    
    
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
        for _ in 0..<8 {
            let randomNumber = Int(arc4random_uniform(UInt32(all16Cards.count)))
            let card = all16Cards.remove(at: randomNumber)
            semiRandomCards.append(card)
            semiRandomCards.append(CardOld(id: card.getTagID(), imageName: card.getImageName()))
        }
        
        //randomizes the card locations
        var fullRandomCards = [CardOld]()
        for i in 0..<16 {
            let randomNumber = Int(arc4random_uniform(UInt32(semiRandomCards.count)))
            let card = semiRandomCards.remove(at: randomNumber)
            card.setTagID(tagID: i)
            fullRandomCards.append(card)
        }
        
        
        
        return fullRandomCards
    }

    func setupGame(){
        matchCounterLbl.text = "0"
        cards = layoutCards()
        for button in cardsBtn{
            button.setImage(UIImage(named: cardBackground), for: UIControlState.normal)
        }
    }
    
    func resetGames(){
        wonCounterLbl.text = "0"
        setupGame()
    }
}

