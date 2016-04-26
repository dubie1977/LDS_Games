//
//  ProphetCard.swift
//  KidsLDS
//
//  Created by Joseph DuBay on 4/23/16.
//  Copyright © 2016 DuBay Designs. All rights reserved.
//

import UIKit

public class ProphetCard: Deck{
    
    //private var allImages: [UIImage]

    public override init(){
        super.init()
        
        self.allImages = [UIImage]()
        for x in 0..<15 {
            let img = UIImage(named: "card\(x).png")
            allImages.append(img!)
        }
    }
    

}
