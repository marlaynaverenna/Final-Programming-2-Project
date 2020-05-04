//
//  VoteResultingViewController.swift
//  Final Programming 2 Project
//
//  Created by Marlayna Verenna on 5/4/20.
//  Copyright © 2020 Marlayna Verenna. All rights reserved.
//

import UIKit

class VoteResultingViewController: UIViewController {
    
    @IBOutlet weak var upVoteCounter: UILabel!
    @IBOutlet weak var downVoteCounter: UILabel!
    @IBOutlet weak var winner: UILabel!
    
    override func viewWillAppear (_ animated: Bool){
        upVoteCounter.text = String((parent as! TabBarController).chocolateVote)
        downVoteCounter.text = String((parent as! TabBarController).mintChipVote)
        
        if (parent as! TabBarController).chocolateVote > (parent as! TabBarController).mintChipVote
        {
            winner.text = "Chocolate!"
        }else{
            winner.text = "Mint Chip!"
        }
        
    }
    
    @IBOutlet weak var imageView: UIImageView!
    var originalRect: CGRect!
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion==UIEvent.EventSubtype.motionShake {
               }
       }
    
    @IBAction func pinch(_ sender: Any) {
        var recognizer: UIPinchGestureRecognizer
        var scale: CGFloat
        
        recognizer=sender as! UIPinchGestureRecognizer
        scale=recognizer.scale
        imageView.transform = CGAffineTransform(rotationAngle: 0.0)
        
        imageView.frame = CGRect(origin: CGPoint(x: self.originalRect.origin.x,y :originalRect.origin.y),size: CGSize(width: originalRect.size.width*scale, height: originalRect.size.height*scale))
    }
    
    @IBAction func rotate(_ sender: Any) {
        var recognizer: UIRotationGestureRecognizer
        var rotation: CGFloat
        
        recognizer=sender as! UIRotationGestureRecognizer
        rotation=recognizer.rotation
        imageView.transform = CGAffineTransform(rotationAngle: 0.0)
        imageView.transform = CGAffineTransform(rotationAngle: rotation)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        becomeFirstResponder()
          
        originalRect=imageView.frame;
        var tempImageView: UIImageView
    tempImageView=UIImageView(image:UIImage(named: "Ice Cream Clip Art.png"))
        tempImageView.frame=originalRect
        view.addSubview(tempImageView)
        self.imageView=tempImageView
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
