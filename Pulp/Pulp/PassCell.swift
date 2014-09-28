//
//  PassCell.swift
//  Pulp
//
//  Created by Bz on 9/28/14.
//  Copyright (c) 2014 TTSS. All rights reserved.
//

import UIKit

class PassCell :  UICollectionViewCell{
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var lableTitle : UILabel?
    @IBOutlet weak var labelSub : UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setStyle( p : Int) -> Void {
        var name : [String] = ["1@2x","2@2x","3@3x"]
        image?.image = UIImage(named: name[p])
    }

    
}
