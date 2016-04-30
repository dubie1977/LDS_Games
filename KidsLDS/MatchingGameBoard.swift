//
//  MatchingGameBoard.swift
//  KidsLDS
//
//  Created by Joseph DuBay on 4/26/16.
//  Copyright © 2016 DuBay Designs. All rights reserved.
//

import Foundation
import UIKit

public class MatchingGameBoard{
    
    private var deltCards: [Card]
    private var matches = 0
    private var gamesWon = 0
    private var cardsFlipped = [Card]()
    //private var cardFlipped: Card?
    
    public init(cards: [Card]){
    
        self.deltCards = cards
        
    }
    
    public func cardSelected(newCard: Card)->Bool{
        if (!newCard.isMatched && !newCard.isFliped){
            if(cardsFlipped.count > 0){
                newCard.playFlipToFont()
            } else {
                newCard.playFlipToFont()
            }
            cardsFlipped.append(newCard)
            return true
        } else {
            return false//ignore click
        }
        
    }
    
    public func resetCards() {
        if(cardsFlipped.count > 1){
            //print("reset cards \n")
            for card in cardsFlipped{
                card.playFlipToBack()
            }
            cardsFlipped.removeAll()
        }
    }
    
    
    
}
