//
//  MailContent.swift
//  Pulp
//
//  Created by Kloud on 9/28/14.
//  Copyright (c) 2014 TTSS. All rights reserved.
//

import Foundation

class mailContent {
    var sender : String
    var date : String
    var subject : String
    var htmlFile : String
    var box : String
    
    init(sender: String, date: String, subject: String, htmlFile: String, box: String) {
        self.sender = sender
        self.date = date
        self.subject = subject
        self.htmlFile = htmlFile
        self.box = box
    }
}

var allMessages: [mailContent] = []
var savedMessages: [mailContent] = []
var archivedMessages: [mailContent] = []
var unreadMessages: [mailContent] = []

func refreshMail() {
    for message in allMessages {
        if message.box == "archived" {
            archivedMessages.append(message)
        } else if message.box == "saved" {
            savedMessages.append(message)
        } else if message.box == "unread" {
            unreadMessages.append(message)
        }
    }
}

func loadDummyContent() {
    var msg1 = mailContent(sender: "TONY CHAN", date: "SEPTEMBER 1", subject: "UX Google Recruiter", htmlFile: "message-01", box: "saved")
    allMessages.append(msg1)
    
    var msg2 = mailContent(sender: "UNIQLO", date: "SEPTEMBER 2", subject: "LAST CHANCE - 10% Off Ultra Light Down!", htmlFile: "message-02", box: "archived")
    allMessages.append(msg2)
    
    var msg3 = mailContent(sender: "AMERICAN APPAREL", date: "SEPTEMBER 3", subject: "Shop Now - Laidback Fall Collection", htmlFile: "message-03", box: "archived")
    allMessages.append(msg3)
    
    var msg4 = mailContent(sender: "MEDUIM", date: "SEPTEMBER 4", subject: "Why Medium Notes Are Different", htmlFile: "message-04", box: "archived")
    allMessages.append(msg4)
    
    var msg5 = mailContent(sender: "VENMO", date: "SEPTEMBER 5", subject: "You Paid Leo Jiang $10" , htmlFile: "message-05", box: "archived")
    allMessages.append(msg5)
    
    var msg6 = mailContent(sender: "DRUSKY ENT", date: "SEPTEMBER 26", subject: "Adventure Club Reciept", htmlFile: "message-06", box: "archived")
    allMessages.append(msg6)
    
    var msg7 = mailContent(sender: "NEXT DRAFT", date: "SEPTEMBER 26", subject: "September 26th's Most Fascinating News form Dave Pell", htmlFile: "message-07", box: "unread")
    allMessages.append(msg7)
    
    var msg9 = mailContent(sender: "ZEN HABITS", date: "SEPTEMBER 26", subject: "The Biggest Reasons You Haven't Changed Your Habits", htmlFile: "message-09", box: "unread")
    allMessages.append(msg9)
    
    var msg10 = mailContent(sender: "FANDANGO", date: "SEPTEMBER 26", subject: "Family Fun Starts At The Movies", htmlFile: "message-10", box: "unread")
    allMessages.append(msg10)
    
    var msg11 = mailContent(sender: "AMERICAN APPAREL", date: "SEPTEMBER 26", subject: "30% Off Everything", htmlFile: "message-11", box: "unread")
    allMessages.append(msg11)
    
    var msg12 = mailContent(sender: "MEDIUM", date: "SEPTEMBER 26", subject: "Today on Medium", htmlFile: "message-12", box: "saved")
    allMessages.append(msg12)
    
    var msg13 = mailContent(sender: "LOOKBOOK", date: "SEPTEMBER 27", subject: "Latest Looks: Alternates by Karl Philip Leuterio", htmlFile: "message-13", box: "unread")
    allMessages.append(msg13)
    
    var msg14 = mailContent(sender: "KICKSTARTER", date: "SEPTEMBER 27", subject: "Drew Hamlin just backed a Graphic Design project", htmlFile: "message-14", box: "saved")
    allMessages.append(msg14)
    
    var msg15 = mailContent(sender: "EATSTREET", date: "SEPTEMBER 27", subject: "Retweet Us To Win Eatstreet Cash", htmlFile: "message-15", box: "unread")
    
    var msg17 = mailContent(sender: "UBER", date: "SEPTEMBER 27", subject: "RIDE FREE ALL FALL", htmlFile: "message-17", box: "unread")
    allMessages.append(msg17)
    
    var msg18 = mailContent(sender: "UNIQLO", date: "SEPTEMBER 27", subject: "URBAN SWEATS JUST ARRIVED", htmlFile: "message-18", box: "unread")
    allMessages.append(msg18)
    
    var msg19 = mailContent(sender: "Carnegie Mellon Univeristy", date: "SEPTEMBER 27", subject: "CMU Telefund Jobs", htmlFile: "message-19", box: "unread")
}