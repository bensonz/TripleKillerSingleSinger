//
//  singleMail.swift
//  Pulp
//
//  Created by Bz on 9/27/14.
//  Copyright (c) 2014 TTSS. All rights reserved.
//

import Foundation


class singleMail {
    
    var title : String
    var sender : String
    var reciever : String
    var content : [String] //each item represents one line
    var time : String
    
    init(title : String, sender : String, reciever : String, content : [String], time : String){
        self.title = title
        self.sender = sender
        self.reciever = reciever
        self.content = content
        self.time = time
    }
    
    func countLines() -> Int{
        return 2 + content.count
    }
    
    func allContentInStringFormat() -> String{
        var s = title + "\n" + "from : " + sender + "    to:" + reciever + "\n"
        for c in content {
            s += c
            s += "\n"
        }
        return s
    }
    
}