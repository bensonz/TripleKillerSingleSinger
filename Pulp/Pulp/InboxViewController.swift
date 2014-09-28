//
//  InboxViewController.swift
//  Pulp
//
//  Created by Bz on 9/27/14.
//  Copyright (c) 2014 TTSS. All rights reserved.
//

import UIKit

class InboxViewController: UIViewController {

    @IBOutlet weak var mainSV: UIScrollView!
    
    @IBOutlet weak var bottomSV : UIScrollView!
    @IBOutlet weak var sBottomSV : UIScrollView!
    @IBOutlet weak var curSV : UIScrollView!
    
    @IBOutlet weak var curMsg: UILabel!
    
    var mails : [singleMail]?
    var swipeLeft = UISwipeGestureRecognizer()
    
    let mailHeight: CGFloat = 200.0
    let OffsetSpeed: CGFloat = 25.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        generateRandomeMail()
        
        /*Gesture recognizer in mainsv*/
        self.swipeLeft.direction = .Left
        self.mainSV.addGestureRecognizer(swipeLeft)
        self.swipeLeft.addTarget(self,action : "swippedLeft")
        mainSV.layer.borderWidth = 0.5
        mainSV.layer.borderColor = CGColorCreate(CGColorSpaceCreateDeviceRGB(), [1.0, 0.5, 0.5, 0.2])
        

        bottomSV.layer.borderWidth = 0.7
        bottomSV.backgroundColor = UIColorFromRGB(0x994D52,alp:1.0)

        sBottomSV.layer.borderWidth = 0.7
        sBottomSV.backgroundColor = UIColorFromRGB(0x031634,alp:1.0)
    
        curSV.layer.borderWidth = 0.7
        curSV.backgroundColor = UIColorFromRGB(0xD9742B, alp: 1.0)
        
        curMsg.numberOfLines = mails![0].countLines()
        curMsg.text = mails![0].allContentInStringFormat()
    }
    
    
    func UIColorFromRGB(rgbValue: UInt,alp : CGFloat) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(alp)
        )
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func swippedLeft(){
        self.performSegueWithIdentifier("toSavedMail", sender: self)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        switch segue.identifier {
        case "toSavedMail":
            if var dest = segue.destinationViewController as? SavedMailViewController {
                    dest.mails = self.mails
                }
        default:
            println("GG. wtf")
            break
        }
    }
    
    @IBAction func unwindToList(segue: UIStoryboardSegue){
        if segue.identifier == "toSavedMail" {
            println("unwind!!")
        }
        
    }
    
    func generateRandomeMail(){
        if (mails == nil){
            mails = []
        }
        for var i = 0; i < 10; ++i {
            var ccc = ["hello","my friends","yall look great","i have a dream","help me",
                "help urself","be cool","pce out","making it long","wut","guess","haha","just long","jsut mad long","i done caring","hell yeah"]
            self.mails!.append(singleMail(title: String(i), sender: String(i) + "@apple.com", reciever: "me", content: ccc, time: String(i)))
        }
    }


}

