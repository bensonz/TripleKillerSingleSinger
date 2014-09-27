//
//  singleMail.swift
//  Pulp
//
//  Created by Bz on 9/27/14.
//  Copyright (c) 2014 Antonio Ono. All rights reserved.
//

import UIKit

class singleMail{
    /*
    *  example of a mail display
    *   sender
    *      to reciever    @ date
    *   content
    *   more content....
    */
    var sender:String
    var reciever:String
    var time : NSDate
    var content : String
    private let dateFormatter = NSDateFormatter()
    
    init(sender : String, reciever: String, time : NSDate, content : String){
        self.sender = sender
        self.reciever = reciever
        self.time = time
        self.content = content
        dateFormatter.dateFormat = "EEE hh:mm"
    }
    
    func getTimeInStringFormat()->String{
        return dateFormatter.stringFromDate(time)
    }
    
    func getFormattedTitle() -> String{
        var result = ""
        result += sender + "\n" + "     " + "to" + reciever + getTimeInStringFormat()
        return result
    }
    
}
