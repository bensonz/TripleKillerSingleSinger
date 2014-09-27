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
    var mails : [singleMail]?
    var swipeLeft = UISwipeGestureRecognizer()
    
    let mailHeight: CGFloat = 200.0
    let OffsetSpeed: CGFloat = 25.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.swipeLeft.direction = .Left
        self.mainSV.addGestureRecognizer(swipeLeft)
        self.swipeLeft.addTarget(self,action : "swippedLeft")
        generateRandomeMail()
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
        for var i = 0; i < 10; ++i {
            var ccc = ["hello","my friends","yall look great","i have a dream","help me","help urself","be cool","pce out"]
            self.mails?[i] = singleMail(title: String(i), sender: String(i) + "@apple.com", reciever: "me", content: ccc, time: String(i))
        }
    }


}

