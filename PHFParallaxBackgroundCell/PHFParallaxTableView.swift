//
//  PHFParallaxTableView.swift
//  PHFParallaxBackgroundCellExample
//
//  Created by Pierre Houguet on 10/12/2014.
//  Copyright (c) 2014 Pierre Houguet. All rights reserved.
//

import UIKit

class PHFParallaxTableView: UITableView, UIScrollViewDelegate {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    
    func scrollViewDidScroll(superview : UIView) {
    
        //Get all the visible cells
        let visibleCell = self.visibleCells();
        
        for cell in visibleCell {
            //Change the cell origin
            (cell as PHFParallaxBackgroundCell).parallaxEffect(self, view: superview);
        }
        
    }


}
