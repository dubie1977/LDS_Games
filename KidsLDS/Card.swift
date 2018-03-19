//
//  Card.swift
//  KidsLDS
//
//  Created by Joseph DuBay on 4/20/16.
//  Copyright © 2016 DuBay Designs. All rights reserved.
//

import UIKit

public class Card: UIButton {
    
    private var _fliped :Bool
    private var _matched :Bool
    //private var _imageName: String
    
    private var _frontImage: UIImage!
    private var _backImage: UIImage?

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect){
        
        self._fliped=false
        self._matched=false
        //self._imageName = "Unknown"
        
        super.init(frame: frame)
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        self._fliped=false
        self._matched=false
        //self._imageName = "Unknown"
        
        super.init(coder: aDecoder)
        
        //self.alpha = 0.5
    }
    
    var frontImage: UIImage {
        get{
            if let image = _frontImage {
                return image
            } else { return UIImage()}
        }
        set{
            self._frontImage=newValue
        }
        
    }
    
    var backImage: UIImage {
        get{
            if let image = _backImage {
                return image
            } else { return UIImage()}
        }
        set{
            self._backImage=newValue
        }
    }
    
    var isFliped: Bool{
        get { return _fliped}
    }
    
    var isMatched: Bool{
        get { return _matched}
        set { _matched = newValue}
    }
    
    override public func isEqual(object: AnyObject?) -> Bool {
        let otherCard = object as? CardIV
        if ( self.tag == otherCard?.tag){
            return true
        }
        return false
    }
    
    public func playFlipToFont(){
        flipCard(true)
        //playFlipCarAnimation(true)
    }
    
    public func playFlipToBack(){
        flipCard(false)
        //playFlipCarAnimation(false)
    }
    
    public func resetCard(){
        playFlipToBack()
        _fliped = false
        _matched = false
    }
    
    private func flipCard(flipToFront: Bool){
        if(flipToFront){
            self.setImage(frontImage, forState: UIControlState.Normal)
            _fliped = true
        } else {
            self.setImage(backImage, forState: UIControlState.Normal)
            _fliped = false
        }
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
