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
        let width = self.view.frame.size.width-25
        
        /*
        var senderLabelText : String?
        var dateLabelText : String?
        var subjectLabelText : String?
        var bodyHTMLText : String?
        
        init(sender: String, date: String, subject: String, bodyHTML: String) {
            senderLabelText = sender
            dateLabelText = date
            subjectLabelText = subject
            bodyHTMLText = bodyHTML
        }
        */
        
        //Test initialization
        var senderLabelText : String = "KICKSTARTER"
        var dateLabelText : String = "SEPTEMBER 14"
        var subjectLabelText : String = "Drew Hamlin backed Full- size reissue of the NYCTA Graphics Standards Manual."
        var bodyHTMLText : String = "http://google.com"
        
        /*
        for family in UIFont.familyNames() {
            println("\(family)")
            
            for name in UIFont.fontNamesForFamilyName((family as String)) {
                println("\(name)")
            }
        }
        */
        
        //Sender Label
        let senderLabel = UILabel(frame: CGRectMake(20, 20, width, 20))
        var attrSenderLabel = NSMutableAttributedString(string: senderLabelText)
        attrSenderLabel.addAttribute(NSKernAttributeName, value: 2.2, range: NSMakeRange(0, attrSenderLabel.length))
        senderLabel.attributedText = attrSenderLabel
        senderLabel.textColor = self.view.tintColor
        senderLabel.backgroundColor = UIColor.clearColor()
        senderLabel.font = UIFont(name: "FuturaStd-Bold", size: 10.0)
        self.view.addSubview(senderLabel)
        
        //Date Label
        let dateLabel = UILabel(frame: CGRectMake(20, 20, width, 20))
        var attrDateLabel = NSMutableAttributedString(string: dateLabelText)
        attrDateLabel.addAttribute(NSKernAttributeName, value: 2.2, range: NSMakeRange(0, attrDateLabel.length))
        dateLabel.textAlignment = NSTextAlignment.Right
        dateLabel.attributedText = attrDateLabel
        dateLabel.textColor = UIColor.grayColor()
        dateLabel.backgroundColor = UIColor.clearColor()
        dateLabel.font = UIFont(name: "FuturaStd-Book", size: 10.0)
        self.view.addSubview(dateLabel)
        
        //Subject Label
        let subjectLabel = UILabel(frame: CGRectMake(20, 55, width, 0))
        var pStyle = NSMutableParagraphStyle()
        pStyle.lineSpacing = 6
        var attrString = NSMutableAttributedString(string: subjectLabelText)
        attrString.addAttribute(NSParagraphStyleAttributeName, value: pStyle, range: NSMakeRange(0, attrString.length))
        subjectLabel.attributedText = attrString
        subjectLabel.textColor = UIColor.blackColor()
        subjectLabel.backgroundColor = UIColor.clearColor()
        subjectLabel.font = UIFont(name: "FuturaStd-Book", size: 24.0)
        subjectLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        subjectLabel.numberOfLines = 0
        var subjectLabelFrame = subjectLabel.frame
        subjectLabelFrame.size.width = width
        subjectLabel.frame = subjectLabelFrame
        subjectLabel.sizeToFit()
        //subjectLabel.frame.origin.y += 55
        self.view.addSubview(subjectLabel)
        
        //Horizontal Line
        let lineView = UIView(frame: CGRectMake(20, subjectLabel.frame.height + 67.5, width+25, 1))
        lineView.backgroundColor = UIColor.grayColor()
        self.view.addSubview(lineView)
        
        //Body HTML
        let htmlHeight = self.view.frame.height - (subjectLabel.frame.height + 77.5)
        let bodyWebView = UIWebView(frame: CGRectMake(0, subjectLabel.frame.height + 77.5, width + 25, htmlHeight))
        let path = NSBundle.mainBundle().pathForResource("message-17", ofType: "html", inDirectory: "HTMLContent")
        let url = NSURL(string: path!)
        let request = NSURLRequest(URL: url)
        bodyWebView.loadRequest(request)
        bodyWebView.scalesPageToFit = true
        bodyWebView.scrollView.scrollEnabled = true;
        var bodyWebViewFrame = bodyWebView.frame
        bodyWebViewFrame.size.width = width
        bodyWebView.frame = bodyWebViewFrame
        bodyWebView.sizeToFit()
        bodyWebView.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(bodyWebView)
        
        //Body Label
        /*
        let bodyLabel = UILabel(frame: CGRectMake(20, subjectLabel.frame.height + 77.5, width, 0))
        bodyLabel.text = "Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Donec sed odio dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Praesent commodo cursus magna, vel scelerisque nisl"
        bodyLabel.textColor = UIColor.blackColor()
        bodyLabel.backgroundColor = UIColor.clearColor()
        bodyLabel.font = UIFont(name: "SabonRoman", size: 20.0)
        bodyLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        bodyLabel.numberOfLines = 0
        var bodyLabelFrame = bodyLabel.frame
        bodyLabelFrame.size.width = width
        bodyLabel.frame = bodyLabelFrame
        bodyLabel.sizeToFit()
        self.view.addSubview(bodyLabel)
        */
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    /*
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "shareCopied", name: UIPasteboardChangedNotification, object: UIPasteboard.generalPasteboard())
    }
    
    
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(true)
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }

    func shareCopied() {
        println("hi")
        let pasteBoard = UIPasteboard.generalPasteboard()
        let copiedItem: [NSObject: AnyObject] = pasteBoard.items.last as [NSObject: AnyObject]
        //println("~~~\((copiedItem as Dictionary).count)~~~")
        
        let imageData = copiedItem["com.apple.rtfd"] as NSData
        let activityViewController = UIActivityViewController(activityItems: [imageData], applicationActivities: nil)
        self.presentViewController(activityViewController, animated: true, completion: nil)

    }*/
    
}

