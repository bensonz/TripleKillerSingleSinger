//
//  SavedMailViewController.swift
//  Pulp
//
//  Created by Bz on 9/27/14.
//  Copyright (c) 2014 TTSS. All rights reserved.
//

import UIKit

class SavedMailViewController : UICollectionViewController,UICollectionViewDelegate,UICollectionViewDataSource{

    var swipeRight = UISwipeGestureRecognizer()
    var mails : [singleMail]?
    
    override func viewDidLoad() {
        self.swipeRight.direction = .Right
        self.view.addGestureRecognizer(swipeRight)
        self.swipeRight.addTarget(self,action : "swippedRight")

        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        self.collectionView?.registerNib(UINib(nibName: "PBCell", bundle: NSBundle.mainBundle()), forCellWithReuseIdentifier: "singleMsgCell")
    }
    
    func swippedRight(){
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    
     override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        var cell : PassCell = collectionView.dequeueReusableCellWithReuseIdentifier("singleMsgCell", forIndexPath: indexPath) as PassCell
        cell.setStyle(indexPath.item % 3)
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
