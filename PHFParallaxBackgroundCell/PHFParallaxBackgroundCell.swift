//
//  PHFParallaxBackgroundCell.swift
//  PHFParallaxBackgroundCellExample
//
//  Created by Pierre Houguet on 10/12/2014.
//  Copyright (c) 2014 Pierre Houguet. All rights reserved.
//

import UIKit

@objc protocol ParallaxBackgroundCellDelegate {
    
    /**
    * func offsetForCellAtIndexPath
    * get the current offset for the background image
    * @Param : indexPath : NSIndexPath, the cell indexPath
    * @Return : CGFloat, the offset choosen
    */
    optional func offsetForCellAtIndexPath(indexPath : NSIndexPath) -> CGFloat;
    
    /**
    * func backgroundIsOnlineCellAtIndexPath
    * get the if the image is a local or remote image
    * @Param : indexPath : NSIndexPath, the cell indexPath
    * @Return : Bool, the status
    */
    optional func backgroundIsOnlineCellAtIndexPath(indexPath : NSIndexPath) -> Bool;
    
    /**
    * func backgroundPlaceholderForCellAtIndexPath
    * get the placeholder choosen during the remote image loading
    * @Param : indexPath : NSIndexPath, the cell indexPath
    * @Return : NSString, local image name
    */
    optional func backgroundPlaceholderForCellAtIndexPath(indexPath : NSIndexPath) -> String;
}


class PHFParallaxBackgroundCell: UITableViewCell, AsyncImageRequestDelegate {

    var _backgroundIMV : UIImageView!;
    
    var _backgroundImage : String! = "";
    

    var delegate : ParallaxBackgroundCellDelegate? = nil;
    
    //The superview
    var indexPath : NSIndexPath?  = NSIndexPath(forRow: 0, inSection: 0) {
        didSet {
            layoutSubviews();
        }
    }
    
    //the offset for the image view
    var _offset : CGFloat = 40.0;

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
        
         _offset = 40.0;
    
        //Get the offset if user set one in the delgate
        let offset = delegate?.offsetForCellAtIndexPath?(indexPath!);
        
        
        if offset != nil {
            //apply user offset
            _offset = offset!;
        }
       
        //Set the frame for the background view
        _backgroundIMV.frame = CGRectMake(0.0, -(_offset/2), self.frame.size.width, self.frame.size.height + _offset);
    }
    
  
    
    /**
    * func setBackgroundImage
    * set the image
    * @Param : imageName, the image name in the local workspace
    */
    func setBackgroundImage(imageNamed : String) {
        
        if (_backgroundImage != imageNamed) {
            
            
            _backgroundImage = imageNamed;
            
            //Test if user wants an online background
            let isOnline : Bool? = delegate?.backgroundIsOnlineCellAtIndexPath?(self.indexPath!);
            
            if ((isOnline) != nil && isOnline == true) {
                
                //Begin the request to get the image
                lookingForABackgroundImage(_backgroundImage);
            } else {
                
                //Set the local background image
                _backgroundIMV.image = UIImage(named: _backgroundImage);
            }
        }
       
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
        let difference : CGFloat =  self.frame.height - _backgroundIMV.bounds.height;
        
        //Calculate the new origin for the background
        let move : CGFloat = (deltaY / view.frame.height)  * difference;
        
        _backgroundIMV.frame.origin.y =  move;
        
        
    }
    
     /**
    * func lookingForABackgroundImage
    * If the online mode is true get the image with a async request
    *
    * @Param : imageUrl the image name in the internet workspace
    */
    func lookingForABackgroundImage(imageUrl : String) {
        
        //Get the placeholder if user decide to set one
        let placeHolderForCell = delegate?.backgroundPlaceholderForCellAtIndexPath?(self.indexPath!);
        
        if (placeHolderForCell != nil) {
            _backgroundIMV.image = UIImage(named: placeHolderForCell!);
        }
        
        //Init the request object
        let imageAsynRequet = PHFGetAsyncBackgroundImage();
        
        imageAsynRequet.delegate = self;
        
        //Start request
        imageAsynRequet.getAsyncImage(imageUrl);
        
    }
    
    
    //Image request delegate
    
    func imageRequestDidSucceed(image: UIImage) {
        
        //set the new background`
        _backgroundIMV.image = image;
    }
    
    func imageRequestDidFailed(image: UIImage, error: NSError) {
        
    }

}
