//
//  customPBLayout.swift
//  Pulp
//
//  Created by Bz on 9/28/14.
//  Copyright (c) 2014 TTSS. All rights reserved.
//

import UIKit

struct PassMetrics
{
    /// Size of a state of a pass
    var size : CGSize
    
    /// Amount of "pixels" of overlap between this pass and others.
    var overlap : CGFloat
}

struct PassbookLayoutMetrics
{
    /// Normal is the real size of the pass, the "full screen" display of it.
    var normal : PassMetrics
    
    /// Collapsed is when
    var collapsed : PassMetrics
    
    /// The size of the bottom stack when a pass is selected and all others are stacked at bottom
    var bottomStackedTotalHeight : CGFloat
    
    /// The visible size of each cell in the bottom stack
    var bottomStackedHeight : CGFloat
}

struct PassbookLayoutEffects
{
    /// How much of the pulling is translated into movement on the top. An inheritance of 0 disables this feature (same as bouncesTop)
    var inheritance : CGFloat
    
    /// Allows for bouncing when reaching the top
    var bouncesTop : Bool
    
    /// Allows the cells get "stuck" on the top, instead of just scrolling outside
    var sticksTop :Bool
}


class customPBLayout : UICollectionViewLayout{
    var metrics : PassbookLayoutMetrics
    var effects : PassbookLayoutEffects
    
    override init() {
        var n : PassMetrics = PassMetrics(size: CGSizeMake(320.0, 420.0), overlap: 0.0)
        var collap: PassMetrics = PassMetrics(size : CGSizeMake(320.0, 96.0), overlap: 32.0)
        
        metrics = PassbookLayoutMetrics(normal: n, collapsed: collap, bottomStackedTotalHeight: 8.0, bottomStackedHeight: 32.0)
        
        effects = PassbookLayoutEffects(inheritance: 0.20, bouncesTop: true, sticksTop: true)
        super.init()
    }
    
    required init(coder aDecoder: NSCoder) {
        var n : PassMetrics = PassMetrics(size: CGSizeMake(320.0, 420.0), overlap: 0.0)
        var collap: PassMetrics = PassMetrics(size : CGSizeMake(320.0, 96.0), overlap: 32.0)
        
        metrics = PassbookLayoutMetrics(normal: n, collapsed: collap, bottomStackedTotalHeight: 8.0, bottomStackedHeight: 32.0)
        effects = PassbookLayoutEffects(inheritance: 0.20, bouncesTop: true, sticksTop: true)
        super.init(coder: aDecoder)
    }
    
    override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes! {
        //let layoutAttributes = super.layoutAttributesForItemAtIndexPath(indexPath)
        let layoutAttributes = UICollectionViewLayoutAttributes(forCellWithIndexPath: indexPath)
        
        var selectedIndexPaths = self.collectionView?.indexPathsForSelectedItems()
        
        if (selectedIndexPaths?.count != 0){
            if (selectedIndexPaths![0] as NSObject == indexPath){
              layoutAttributes.frame = frameForSelectedPass(self.collectionView!.bounds, m: metrics)
            }
            else{
                layoutAttributes.frame = frameForUnselectedPass(indexPath, indexPathSelected: selectedIndexPaths![0] as NSIndexPath, b: self.collectionView!.bounds, m: metrics)
            }
        }
        else{
            // Layout collapsed cells (collapsed size)
            var isLast : Bool = (indexPath.item == (self.collectionView!.numberOfItemsInSection(indexPath.section)-1))
            layoutAttributes.frame = frameForPassAtIndex(indexPath, isLastCell: isLast, b: self.collectionView!.bounds, m: metrics, e: effects)
        }
        
        layoutAttributes.zIndex = indexPath.item
        return layoutAttributes
    }
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [AnyObject]? {
        var range = rangeForVisibleCells(rect, count : self.collectionView!.numberOfItemsInSection(0),m: metrics);
        var cells : NSMutableArray = []
        var item : Int = 0
        for item = range.location; item < (range.location + range.length); ++item{
            cells.addObject(self.layoutAttributesForItemAtIndexPath(NSIndexPath(forItem: item, inSection: 0)))
        }
        return cells
    }
    
    func rangeForVisibleCells(rect : CGRect, count : Int, m : PassbookLayoutMetrics) -> NSRange{
        var min : CGFloat = floor((rect.origin.y) / (m.collapsed.size.height - m.collapsed.overlap))
        var max : CGFloat = ceil((rect.origin.y + rect.size.height) / (m.collapsed.size.height - m.collapsed.overlap))
        
        var minint = Int(min);
        var maxint = Int(max);
        
        minint = (minint < 0)     ? 0   : minint;
        minint = (minint < maxint)   ? minint : maxint;
        
        var r:NSRange = NSMakeRange(minint, maxint-minint);
        
        return r;
    }
    
    override func collectionViewContentSize() -> CGSize {
        return collectionViewSize(self.collectionView!.bounds, count: self.collectionView!.numberOfItemsInSection(0), m: metrics);
    }
    
    func collectionViewSize(bounds:CGRect, count :Int , m: PassbookLayoutMetrics ) -> CGSize
    {
        return CGSizeMake(bounds.size.width, CGFloat(count) * (m.collapsed.size.height - m.collapsed.overlap));
    }
    
    /// Normal collapsed cell, with bouncy animations on top
    func frameForPassAtIndex(indexPath : NSIndexPath,isLastCell : Bool,b : CGRect,
        m : PassbookLayoutMetrics , e: PassbookLayoutEffects) -> CGRect
    {
        println("pass cell created")
        var f : CGRect =  CGRect()
        f.origin.x = (b.size.width - m.normal.size.width) / 2.0;
        f.origin.y = CGFloat(indexPath.item) * (m.collapsed.size.height - m.collapsed.overlap);
    
        // The default size is the normal size
        f.size = m.collapsed.size;
    
        if (b.origin.y < 0 && e.inheritance > 0.0 && e.bouncesTop)
        {
            // Bouncy effect on top (works only on constant invalidation)
            if (indexPath.section == 0 && indexPath.item == 0)
            {
                // Keep stuck at top
                f.origin.y      = b.origin.y * e.inheritance/2.0;
                f.size.height   = m.collapsed.size.height - b.origin.y * (1 + e.inheritance);
            }
            else
            {
                // Displace in stepping amounts factored by resitatnce
                f.origin.y     -= b.origin.y * CGFloat(indexPath.item) * e.inheritance;
                f.size.height  -= b.origin.y * e.inheritance;
            }
        }
        else if (b.origin.y > 0)
        {
            // Stick to top
            if (f.origin.y < b.origin.y && e.sticksTop)
            {
                f.origin.y = b.origin.y;
            }
        }
    
        // Edge case, if it's the last cell, display in full height, to avoid any issues.
        if (isLastCell)
        {
            f.size = m.normal.size;
        }
    
        return f;
    }
    
    /// Centered cell
    func frameForSelectedPass(b : CGRect, m : PassbookLayoutMetrics) -> CGRect
    {
        //println("selected pass cell created")
        var f : CGRect =  CGRect()
    
        f.size      = m.normal.size;
        f.origin.x  =              (b.size.width  - f.size.width ) / 2.0;
        f.origin.y  = b.origin.y + (b.size.height - f.size.height) / 2.0;
    
        return f;
    }
    
    /// Bottom-stack cell
    func frameForUnselectedPass(indexPath : NSIndexPath, indexPathSelected : NSIndexPath, b: CGRect,
        m: PassbookLayoutMetrics ) -> CGRect
    {
        //println("unselected pass cell created")
        var f : CGRect = CGRect()
    
        f.size        = m.collapsed.size;
        f.origin.x    = (b.size.width - m.normal.size.width) / 2.0;
        var x : Int = indexPath.item - indexPathSelected.item
        f.origin.y    = b.origin.y + b.size.height - m.bottomStackedTotalHeight +
            m.bottomStackedHeight*CGFloat(x);
        return f;
    }
    
}
