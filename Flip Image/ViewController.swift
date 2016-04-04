//
//  ViewController.swift
//  Flip Image
//
//  Created by Besjana Shabani 
//  Copyright © 2016 Besjana Shabani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //declare views
    var cardView: UIView!
    var frontView: UIImageView!
    var backView: UIImageView!
    
    //a variable to check which side of the card I'm showing, always starts with the back
    var showingBack = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //set images for the views
        frontView = UIImageView(image: UIImage(named: "front.png"))
        backView = UIImageView(image: UIImage(named: "back.png"))
        
        //define a user tap on the card
        let singleTap = UITapGestureRecognizer(target: self, action: Selector("tapped"))
        singleTap.numberOfTapsRequired = 1
        
        //place a rectangle with starting points at 20 from the top and 20 from the left, width and height according to the card image size
        let rect = CGRectMake(20, 20, backView.image!.size.width, backView.image!.size.height )
       
        //set that rectangle as the shape of the cardView
        cardView = UIView(frame: rect)
        
        //enable gesture recognizer as defined higher
        cardView.addGestureRecognizer(singleTap)
        cardView.userInteractionEnabled = true
        
        //finally add the backview as a subview of the card, and add them both to the main view
        cardView.addSubview(backView)
        view.addSubview(cardView)
        
    }
    //whenever the user taps on the card
    func tapped (){
        
        //first check what side of the card is shown(higher is defined to show the back first)
        if(showingBack) {
            
                //in case we have the back showing, flip from the right to the front view
            UIView.transitionFromView(backView, toView: frontView, duration: 1, options: UIViewAnimationOptions.TransitionFlipFromRight, completion: nil)
            
        //since it just flipped,that means the back is no longer showing
            showingBack = false
        }else {
            //or if it was the front that was showing, flip to the back view
            UIView.transitionFromView(frontView, toView: backView, duration: 1, options: UIViewAnimationOptions.TransitionFlipFromLeft, completion: nil)
            
            //so that means card is flipped to the back view
            showingBack = true
        
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

