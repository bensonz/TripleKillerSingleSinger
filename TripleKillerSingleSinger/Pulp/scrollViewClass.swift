//
//  scrollViewClass.swift
//  Pulp
//
//  Created by Leo Jiang on 9/27/14.
//  Copyright (c) 2014 TTSS. All rights reserved.
//

import Foundation
import UIKit



class scrollViewClass: NSObject, UIScrollViewDelegate {
    var scrollViews: [UIScrollView?] = [UIScrollView]()
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        for sv in scrollViews{
            //do code for each sv [second sc, third sc
            if sv != nil {
                sv?.setContentOffset(CGPointMake(scrollView.contentOffset.x, scrollView.contentOffset.y * 0.5), animated: true)
            }
        }
    }
}