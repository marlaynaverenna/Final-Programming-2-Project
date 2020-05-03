//
//  PageOneViewController.swift
//  Final Programming 2 Project
//
//  Created by Marlayna Verenna on 5/3/20.
//  Copyright © 2020 Marlayna Verenna. All rights reserved.
//

import UIKit
import AudioToolbox

class PageOneViewController: UIViewController {
    
    @IBOutlet weak var iceCreamView: UIImageView!
    
    @IBAction func toggleButton(_ sender: Any) {
        if (iceCreamView.isAnimating)
            {
            iceCreamView.stopAnimating()
            } else {
            iceCreamView.startAnimating()
            }
        var soundID: SystemSoundID = 0
        let soundFile:String=Bundle.main.path(forResource:"IceCreamTruck",ofType: "mp3")!
        let soundURL: NSURL = NSURL(fileURLWithPath: soundFile)
        AudioServicesCreateSystemSoundID(soundURL, &soundID)
        AudioServicesPlaySystemSound(soundID)
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let spinAnimation: [UIImage] = [
            UIImage(named: "1")!,
            UIImage(named: "2")!,
            UIImage(named: "3")!,
            UIImage(named: "4")!,
            UIImage(named: "5")!,
            UIImage(named: "6")!,
            UIImage(named: "7")!,
            UIImage(named: "8")!,
            UIImage(named: "9")!,
            UIImage(named: "10")!,
            UIImage(named: "11")!,
            UIImage(named: "12")!,
            UIImage(named: "13")!,
            UIImage(named: "14")!,
            UIImage(named: "15")!,
            UIImage(named: "16")!,
        ]
        
        iceCreamView.animationImages=spinAnimation
        iceCreamView.animationDuration=1.0
        
        

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
