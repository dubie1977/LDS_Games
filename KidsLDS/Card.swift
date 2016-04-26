//
//  Card.swift
//  KidsLDS
//
//  Created by Joseph DuBay on 4/20/16.
//  Copyright © 2016 DuBay Designs. All rights reserved.
//

import UIKit

public class Card: UIButton {
    
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
    
    required public init?(coder aDecoder: NSCoder) {
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
    
    func getTagID()->Int{
        return self.tag
    }
    
    func setTagID(tagID: Int){
        self.tag = tagID
    }
    
    override public func isEqual(object: AnyObject?) -> Bool {
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
        self.setImage(UIImage(named: "dead5.png"), forState: UIControlState.Normal) //= UIImage(named: "dead5.png")
        
        //clear animation
        self.imageView!.animationImages = nil
        
        var imgArray = [UIImage]()
        for x in 1..<5 {
            let img = UIImage(named: "dead\(x).png")
            imgArray.append(img!)
        }
        
        self.imageView!.animationImages = imgArray
        self.imageView!.animationDuration = 0.8
        self.imageView!.animationRepeatCount = 1
        self.imageView!.startAnimating()
    }

    

    /*
     Button animation
     var image1:UIImage = UIImage(named: "img_mic_off")!
     var image2:UIImage = UIImage(named: "img_mic_on")!
     btn.setImage(image1, forState: UIControlState.Normal)
     btn.imageView!.animationImages = [image1, image2]
     btn.imageView!.animationDuration = 1.0
     btn.imageView!.startAnimating()
    */
}
