//
//  Card.swift
//  KidsLDS
//
//  Created by Joseph DuBay on 1/11/16.
//  Copyright © 2016 DuBay Designs. All rights reserved.
//

import Foundation

class Card: NSObject {

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
    
    func getTagID()->Int{
        return self.tagID
    }
    
    func setTagID(tagID: Int){
        self.tagID = tagID
    }
    
    
    override func isEqual(object: AnyObject?) -> Bool {
        let otherCard = object as? Card
        if ( self.tagID == otherCard?.tagID){
            return true
        }
        return false
    }

}