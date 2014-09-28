//
//  ViewController.swift
//  MailCell
//
//  Created by Kloud on 9/27/14.
//  Copyright (c) 2014 KevinKloud. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        makeMailCell("Kevin", "September 14", "Test", "message-03", self.view)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

