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
    private var cardsFlipped = 0
    
    public init(cards: [Card]){
    
        self.deltCards = cards
        
    }
    
}
