//
//  ViewController.swift
//  MailCoreTest
//
//  Created by Kloud on 9/26/14.
//  Copyright (c) 2014 KevinKloud. All rights reserved.
//

import UIKit

var touches : Int = 0

class ViewController: UIViewController {
    
    lazy var mailbox: MailBox = MailBox(owner: self)
    var leMes : MCOIMAPMessage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mailbox.login()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func touchButton(sender: AnyObject) {
        switch touches {
        case 0:
            mailbox.fetchUnreadMessages()
        case 1:
            leMes = mailbox.unreadMessages[0]
            println("\(leMes)")
        case 2:
            mailbox.fetchMessageBody(leMes!)
        case 3:
            mailbox.archiveMessage(leMes!)
        default:
            println("done")
        }
        
        touches++
    }

}

