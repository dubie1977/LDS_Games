//
//  CardIV.swift
//  KidsLDS
//
//  Created by Joseph DuBay on 4/17/16.
//  Copyright © 2016 DuBay Designs. All rights reserved.
//

import UIKit

class CardIV: UIImageView {
    
    private var fliped :Bool
    private var matched :Bool
    private var imageName: String

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect){
        
        self.fliped=false
        self.matched=false
        self.imageName = "Unknown"
        
        super.init(frame: frame)

    }
    
    required init?(coder aDecoder: NSCoder) {
        self.fliped=false
        self.matched=false
        self.imageName = "Unknown"
        
        
        
        super.init(coder: aDecoder)
        
        self.alpha = 0.5
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
    
    
    override func isEqual(object: AnyObject?) -> Bool {
        let otherCard = object as? CardIV
        if ( self.tag == otherCard?.tag){
            return true
        }
        return false
    }
    
    func playFlipToFont(){
        playFlipCarAnimation(true)
    }
    
    func playFlipToBack(){
        playFlipCarAnimation(false)
    }
    
    private func playFlipCarAnimation(flipToFront: Bool) {
        
        //final image
        self.image = UIImage(named: "dead5.png")
        
        //clear animation
        self.animationImages = nil
        
        var imgArray = [UIImage]()
        for var x = 1; x <= 5; x++ {
            let img = UIImage(named: "dead\(x).png")
            imgArray.append(img!)
        }
        
        self.animationImages = imgArray
        self.animationDuration = 0.8
        self.animationRepeatCount = 1
        self.startAnimating()
    }

}
