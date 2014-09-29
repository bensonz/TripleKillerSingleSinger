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

var savedMessages: [mailContent] = []
var archivedMessages: [mailContent] = []
var unreadMessages: [mailContent] = []

