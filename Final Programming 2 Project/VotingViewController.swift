//
//  VotingViewController.swift
//  Final Programming 2 Project
//
//  Created by Marlayna Verenna on 5/3/20.
//  Copyright © 2020 Marlayna Verenna. All rights reserved.
//

import UIKit

class VotingViewController: UIViewController {
    
    @IBAction func voteChocolate(_ sender: Any) {
         (parent as! TabBarController).chocolateVote+=1
    }
    
    @IBAction func voteMintChip(_ sender: Any) {
        (parent as! TabBarController).mintChipVote+=1
    }
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var flavorIdea: UITextField!
    @IBOutlet weak var results: UITextView!
    
    @IBAction func saveResults(_ sender: Any) {
        let csvLine:String = "\(firstName.text!),\(age.text!),\(flavorIdea.text!)\n"
        let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        let docDir:String=paths[0]
        let resultsFile:String=(docDir as NSString).appendingPathComponent("results.csv")
        
        if !FileManager.default.fileExists(atPath: resultsFile) {
            FileManager.default.createFile(atPath: resultsFile, contents: nil, attributes: nil)
        }
        
        let fileHandle:FileHandle=FileHandle(forUpdatingAtPath:resultsFile)!
        fileHandle.seekToEndOfFile()
        fileHandle.write(csvLine.data(using: String.Encoding.utf8)!)
        fileHandle.closeFile()
        
        firstName.text = ""
        age.text = ""
        flavorIdea.text = ""
    }
    
    @IBAction func displayResults(_ sender: Any) {
        let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        let docDir:String=paths[0] as String
        
        let resultsFile:String=(docDir as NSString).appendingPathComponent("results.csv")
        
        if FileManager.default.fileExists(atPath: resultsFile) {
            let fileHandle:FileHandle = FileHandle(forReadingAtPath:resultsFile)!
            let resultsData:String!=NSString(data:fileHandle.availableData, encoding: String.Encoding.utf8.rawValue)! as String
            fileHandle.closeFile()
            results?.text=resultsData
        } else {
            // file does not exists
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

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
