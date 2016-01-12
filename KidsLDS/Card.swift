//
//  Card.swift
//  KidsLDS
//
//  Created by Joseph DuBay on 1/11/16.
//  Copyright © 2016 DuBay Designs. All rights reserved.
//

import Foundation

class Card {

    private var isFliped :Bool
    private var isMatched :Bool
    private var tagID: Int
    private var imageName: String
    

    init(id: Int, imageName: String){
        isFliped=false
        isMatched=false
        tagID=id
        self.imageName = imageName
    }
    
    func getIsFliped()-> Bool{
        return isFliped
    }
    
    func setIsFliped(isFliped: Bool){
        self.isFliped=isFliped
    }
    
    func getIsMatched()->Bool{
        return isMatched
    }
    
    func setIsMatched(isMatched: Bool){
        self.isMatched=isMatched
    }
    
    func getImageName()->String{
        return imageName
    }

}