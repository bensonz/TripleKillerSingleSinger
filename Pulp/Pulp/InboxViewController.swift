//
//  InboxViewController.swift
//  Pulp
//
//  Created by Bz on 9/27/14.
//  Copyright (c) 2014 TTSS. All rights reserved.
//

import UIKit

class InboxViewController: UICollectionViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    
    var mails : [singleMail]?
    var swipeLeft = UISwipeGestureRecognizer()
    
    let mailHeight: CGFloat = 200.0
    let OffsetSpeed: CGFloat = 25.0
    
    
    //initalize delegate
    //var sc_delegate = scrollViewClass()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.swipeLeft.direction = .Left
        self.view.addGestureRecognizer(swipeLeft)
        self.swipeLeft.addTarget(self,action : "swippedLeft")
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        self.collectionView?.backgroundColor = UIColor.clearColor()
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
                break
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
}

