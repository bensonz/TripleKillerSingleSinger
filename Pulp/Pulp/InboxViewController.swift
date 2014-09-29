//
//  InboxViewController.swift
//  Pulp
//
//  Created by Bz on 9/27/14.
//  Copyright (c) 2014 TTSS. All rights reserved.
//

import UIKit

class InboxViewController: UICollectionViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    
    var mails : [singleMail]?
    var swipeLeft = UISwipeGestureRecognizer()
    
    let mailHeight: CGFloat = 200.0
    let OffsetSpeed: CGFloat = 25.0
    
    
    //initalize delegate
    //var sc_delegate = scrollViewClass()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.swipeLeft.direction = .Left
        self.view.addGestureRecognizer(swipeLeft)
        self.swipeLeft.addTarget(self,action : "swippedLeft")
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        self.collectionView?.backgroundColor = UIColor.clearColor()
        self.collectionView?.registerNib(UINib(nibName: "PBCell", bundle: NSBundle.mainBundle()), forCellWithReuseIdentifier: "singleMsgCell")
    }
    
    
    func UIColorFromRGB(rgbValue: UInt,alp : CGFloat) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(alp)
        )
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func swippedLeft(){
        self.performSegueWithIdentifier("toSavedMail", sender: self)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        switch segue.identifier {
        case "toSavedMail":
            if var dest = segue.destinationViewController as? SavedMailViewController {
                break
            }
        default:
            println("GG. wtf")
            break
        }
    }
    
    @IBAction func unwindToList(segue: UIStoryboardSegue){
        if segue.identifier == "toSavedMail" {
            println("unwind!!")
        }
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 200
    }
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        var shouldSelect = true
        
        for indexPath in collectionView.indexPathsForSelectedItems(){
            collectionView.deselectItemAtIndexPath(indexPath as? NSIndexPath, animated: true)
            
            //            var anim : POPBasicAnimation = animationWithPropertyNamed;:kPOPViewAlpha;
            
            
            //            translate to swift
            //            POPBasicAnimation *anim = [POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];
            //            anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
            //            anim.fromValue = @(0.0);
            //            anim.toValue = @(1.0);
            //            [view pop_addAnimation:anim forKey:@"fade"];
            
            self.collectionView(collectionView, didDeselectItemAtIndexPath: indexPath as NSIndexPath)
            shouldSelect = false
        }
        return shouldSelect
    }
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        var topPoint = CGPointMake(0, 0)
        var indexPathCurrentCell = self.collectionView?.indexPathForItemAtPoint(topPoint)
    }
    
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        var cell : PassCell = collectionView.dequeueReusableCellWithReuseIdentifier("singleMsgCell", forIndexPath: indexPath) as PassCell
        cell.backgroundColor = UIColor.whiteColor()
        cell.layer.cornerRadius = 5
        
        var shadowPath : UIBezierPath = UIBezierPath(rect: cell.bounds)
        cell.layer.masksToBounds = false
        cell.layer.shadowColor = UIColor.blackColor().CGColor
        cell.layer.shadowOffset = CGSizeMake(0.0, 1.0)
        cell.layer.shadowOpacity = 0.5
        cell.layer.shadowPath = shadowPath.CGPath
        
        
        //        UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRect:view.bounds];
        //        view.layer.masksToBounds = NO;
        //        view.layer.shadowColor = [UIColor blackColor].CGColor;
        //        view.layer.shadowOffset = CGSizeMake(0.0f, 5.0f);
        //        view.layer.shadowOpacity = 0.5f;
        //        view.layer.shadowPath = shadowPath.CGPath;
        
        cell.setStyle(indexPath.item % 3)
        let sView = UIView(frame: cell.frame)
        makeMailCell("BENSON", "September 22", "Testing", "message-01", sView)
        
        cell.addSubview(sView)
        return cell
    }
    
    func fn()->Void{
        
    }
    
    override func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) -> Void {
        collectionView.performBatchUpdates(fn, completion: nil)
        collectionView.scrollEnabled = true
        
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) -> Void {
        collectionView.performBatchUpdates(fn, completion: nil)
        collectionView.scrollEnabled = false
    }

}

