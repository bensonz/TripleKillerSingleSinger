//
//  MailCellView.swift
//  MailCell
//
//  Created by Kloud on 9/28/14.
//  Copyright (c) 2014 KevinKloud. All rights reserved.
//

import UIKit

func makeMailCell(sender: String, date: String, subject: String, bodyHTML: String, view: UIView) {
    
    view.frame = CGRectMake(0, 0, CGRectGetWidth(UIScreen.mainScreen().applicationFrame), CGRectGetHeight(UIScreen.mainScreen().applicationFrame))
    
    var senderLabelText = sender
    var dateLabelText = date
    var subjectLabelText = subject
    var bodyHTMLText = bodyHTML
    
    let width = view.frame.size.width-25
    
    //Sender Label
    let senderLabel = UILabel(frame: CGRectMake(20, 20, width, 20))
    var attrSenderLabel = NSMutableAttributedString(string: senderLabelText)
    attrSenderLabel.addAttribute(NSKernAttributeName, value: 2.2, range: NSMakeRange(0, attrSenderLabel.length))
    senderLabel.attributedText = attrSenderLabel
    senderLabel.textColor = view.tintColor
    senderLabel.backgroundColor = UIColor.clearColor()
    senderLabel.font = UIFont(name: "FuturaStd-Bold", size: 10.0)
    view.addSubview(senderLabel)
    
    //Date Label
    let dateLabel = UILabel(frame: CGRectMake(20, 20, width, 20))
    var attrDateLabel = NSMutableAttributedString(string: dateLabelText)
    attrDateLabel.addAttribute(NSKernAttributeName, value: 2.2, range: NSMakeRange(0, attrDateLabel.length))
    dateLabel.textAlignment = NSTextAlignment.Right
    dateLabel.attributedText = attrDateLabel
    dateLabel.textColor = UIColor.grayColor()
    dateLabel.backgroundColor = UIColor.clearColor()
    dateLabel.font = UIFont(name: "FuturaStd-Book", size: 10.0)
    view.addSubview(dateLabel)
    
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
    view.addSubview(subjectLabel)
    
    //Horizontal Line
    let lineView = UIView(frame: CGRectMake(20, subjectLabel.frame.height + 67.5, width+25, 1))
    lineView.backgroundColor = UIColor.grayColor()
    view.addSubview(lineView)
    
    //Body HTML
    let htmlHeight = view.frame.height - (subjectLabel.frame.height + 77.5)
    let bodyWebView = UIWebView(frame: CGRectMake(0, subjectLabel.frame.height + 82.5, width + 25, htmlHeight))
    let path = NSBundle.mainBundle().pathForResource(bodyHTMLText, ofType: "html", inDirectory: "HTMLContent")
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
    view.addSubview(bodyWebView)
}
        
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