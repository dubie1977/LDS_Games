//
//  Deck.swift
//  KidsLDS
//
//  Created by Joseph DuBay on 4/23/16.
//  Copyright © 2016 DuBay Designs. All rights reserved.
//

import Foundation
import UIKit

public class Deck{
    
     var allImages: [UIImage]
    
    public init(){
        allImages = [UIImage]()
        for x in 0..<15 {
            let img = UIImage(named: "card\(x).png")
            allImages.append(img!)
        }
    }
    
    public func dealCardsInPairs(cards: [Card])->[Card]{
        var allImagesCopy = [UIImage]()
        for x in 0...allImages.count {
            allImagesCopy.append(allImages[x])
        }
        
        var semiRandomImages = [UIImage]()
        for _ in 0..<(cards.count/2) {
            let randomNumber = Int(arc4random_uniform(UInt32(allImagesCopy.count)))
            let image = allImagesCopy.removeAtIndex(randomNumber)
            semiRandomImages.append(image)
            semiRandomImages.append(image)
            //semiRandomImages.append(CardOld(id: image.getTagID(), imageName: image.getImageName()))
        }
        
        //var fullRandomImages = [UIImage]()
        for x in 0..<semiRandomImages.count {
            let randomNumber = Int(arc4random_uniform(UInt32(semiRandomImages.count)))
            let image = semiRandomImages.removeAtIndex(randomNumber)
            //card.setTagID(i)
            cards[x].setImage(image, forState: UIControlState.Normal)
        }
        
        
        return cards
    }

}