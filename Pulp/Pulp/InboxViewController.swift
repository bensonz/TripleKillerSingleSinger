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
    
    var swipeLeft = UIGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        switch segue.identifier {
        case "toSavedMail":
            if var dest = segue.destinationViewController as? SavedMailViewController {
                    println("dest is saved mail")
                }
        default:
            println("GG. wtf")
            break
        }
        
    }
    

}

