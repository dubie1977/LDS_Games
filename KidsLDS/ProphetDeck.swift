//
//  ProphetCard.swift
//  KidsLDS
//
//  Created by Joseph DuBay on 4/23/16.
//  Copyright © 2016 DuBay Designs. All rights reserved.
//

import UIKit

public class ProphetDeck: Deck{
    
    //private var allImages: [UIImage]

    public override init(){
        
        var allImages = [UIImage]()
        for x in 1..<16 {
            let img = UIImage(named: "Card \(x).png")
            allImages.append(img!)
        }
        super.init(images: allImages)
    }
    

}
