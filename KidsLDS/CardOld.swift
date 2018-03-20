//
//  Card.swift
//  KidsLDS
//
//  Created by Joseph DuBay on 1/11/16.
//  Copyright © 2016 DuBay Designs. All rights reserved.
//

import Foundation

class CardOld: NSObject {

    private var fliped :Bool
    private var matched :Bool
    private var tagID: Int
    private var imageName: String
    

    init(id: Int, imageName: String){
        fliped=false
        matched=false
        tagID=id
        self.imageName = imageName
    }
    
    func isFliped()-> Bool{
        return fliped
    }
    
    func setFliped(isFliped: Bool){
        self.fliped=isFliped
    }
    
    func isMatched()->Bool{
        return matched
    }
    
    func setMatched(isMatched: Bool){
        self.matched=isMatched
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
    
    
    func isEqual(object: AnyObject?) -> Bool {
        let otherCard = object as? CardOld
        if ( self.tagID == otherCard?.tagID){
            return true
        }
        return false
    }

}
