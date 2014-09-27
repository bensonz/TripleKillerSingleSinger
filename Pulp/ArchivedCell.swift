//
//  ArchivedCell.swift
//  Pulp
//
//  Created by Bz on 9/27/14.
//  Copyright (c) 2014 Antonio Ono. All rights reserved.
//

import UIKit

class ArchivedCell : UICollectionViewCell{
    
    @IBOutlet var titleLabel : UILabel?
    @IBOutlet var content : UILabel?
    var swipeRight : UIGestureRecognizer = UIGestureRecognizer()
    
    override init() {
        super.init()
        self.swipeRight.addTarget(self, action: "swippedRight")
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func swippedRight(){
        println("Archived Cell swipped right")
    }
    
    /**
    * requires title to be formatted
    */
    func setTitle(title : String){
        titleLabel?.numberOfLines = 2
        self.titleLabel?.text = title
    }
    
    /**
    * requries content to be formatted
    */
    func setContent(content : String){
        self.content?.text = content
        self.content?.numberOfLines = 10
    }
    
}
