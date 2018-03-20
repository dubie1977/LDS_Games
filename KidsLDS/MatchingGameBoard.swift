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
    
    public enum gameModeType : String{
        case SuperEasy = "Super Easy"
        case Easy = "Easy"
        case Medium = "Medium"
        case Hard = "Hard"
    }
    
    private var deltCards: [Card]
    private var matches = 0
    private var gamesWon = 0
    private var cardsFlipped = [Card]()
    private var _pausingGame = false
    private var _gameMode = gameModeType.Easy
    

    
    public init(cards: [Card]){
        

        self.deltCards = cards
        _gameMode = gameModeType.SuperEasy
        
    }
    
    var gameMode: String{
        get{return _gameMode.rawValue}
    }
    
    var pausingGame: Bool {
        set{
            _pausingGame = true
        }
        get{
            return _pausingGame
        }
    }
    
    public func cardSelected(newCard: Card)->Bool{
        if(_pausingGame){return false}
        
        if (!newCard.isMatched && !newCard.isFliped){
            if(cardsFlipped.count > 0){
                switch (_gameMode){
                case gameModeType.SuperEasy:
                    if(newCard.frontImage == cardsFlipped[0].frontImage){
                        newCard.playFlipToFont()
                        newCard.isMatched = true
                        cardsFlipped[0].isMatched = true
                        cardsFlipped.remove(at: 0)
                        return false
                    } else {
                        newCard.playFlipToFont()
                        cardsFlipped.append(newCard)
                        return true
                    }
                default:
                    
                    break
                
                }
                //check for match
                
            }else {
                newCard.playFlipToFont()
                cardsFlipped.append(newCard)
            }
            return false
        } else {
            return false//ignore click
        }
        
    }
    
    public func nextGameMode()->String{
        switch _gameMode{
        case gameModeType.SuperEasy:
            _gameMode = gameModeType.Easy
            break
        case gameModeType.Easy:
            _gameMode = gameModeType.Medium
            break
        case gameModeType.Medium:
            _gameMode = gameModeType.Hard
            break
        case gameModeType.Hard:
            _gameMode = gameModeType.SuperEasy
            break
        }
        
        return _gameMode.rawValue
    }
    
    public func endPause(){
        switch _gameMode{
        case gameModeType.SuperEasy:
            let lastCard = cardsFlipped.removeLast()
            lastCard.playFlipToBack()
            break
        default:
            resetCards()
        }
         _pausingGame = false
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
