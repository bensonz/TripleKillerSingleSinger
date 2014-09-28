//
//  SavedMailViewController.swift
//  Pulp
//
//  Created by Bz on 9/27/14.
//  Copyright (c) 2014 TTSS. All rights reserved.
//

import UIKit

class SavedMailViewController : UICollectionViewController,UICollectionViewDelegate,UICollectionViewDataSource{
    
    var mails : [singleMail]?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        self.collectionView?.registerNib(UINib(nibName: "PBCell", bundle: NSBundle.mainBundle()), forCellWithReuseIdentifier: "singleMsgCell")
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
