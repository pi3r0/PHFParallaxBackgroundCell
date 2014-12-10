//
//  PHFParallaxBackgroundCell.swift
//  PHFParallaxBackgroundCellExample
//
//  Created by Pierre Houguet on 10/12/2014.
//  Copyright (c) 2014 Pierre Houguet. All rights reserved.
//

import UIKit

class PHFParallaxBackgroundCell: UITableViewCell {

    var _backgroundIMV : UIImageView!;
    
    //the offset for the image view
    var _offset : CGFloat = 20.0;
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

   
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
    }
    
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?)  {
        

        //Init the background image view
        _backgroundIMV  = UIImageView();
        _backgroundIMV.autoresizingMask = UIViewAutoresizing.FlexibleWidth;
        _backgroundIMV.contentMode = UIViewContentMode.Redraw;
        _backgroundIMV.image = UIImage(named: "cell_background_audio");
        _backgroundIMV.clipsToBounds = true;
    
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        self.clipsToBounds = true;
        
        //add the background view
        addSubview(_backgroundIMV);
    }

    override func layoutSubviews() {
        
        //Set the frame for the background view
        _backgroundIMV.frame = CGRectMake(0.0, -(_offset), self.frame.size.width, self.frame.size.height + 2*_offset);
    }
    
    /**
    * func setBackgroundImage
    * set the image
    * @Param : imageName, the image name in the local workspace
    */
    func setBackgroundImage(imageNamed : NSString) {
        
        _backgroundIMV.image = UIImage(named: imageNamed);
    }
    
    /**
    * func parallaxEffect
    * every time the content offset change, the background view frame will change
    *
    * @Param : imageName, the image name in the local workspace
    */
    func parallaxEffect(tableView : UIScrollView, view : UIView) {
        
        //Calculate the difference betwen the cell and the view origin
        let  deltaY = (self.frame.origin.y + self.frame.height/2) - tableView.contentOffset.y;
        
        //Calculate the difference between the cell height and the background height
        let difference : CGFloat =  -2 * _offset;
        
        //Calculate the new origin for the background
        let move : CGFloat = (deltaY / view.frame.height)  * difference;
        
        _backgroundIMV.frame.origin.y =  move;
        
    }

}
