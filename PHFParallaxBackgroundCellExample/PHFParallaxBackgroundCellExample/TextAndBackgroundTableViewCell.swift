//
//  TextAndBackgroundTableViewCell.swift
//  PHFParallaxBackgroundCellExample
//
//  Created by Pierre Houguet on 10/12/2014.
//  Copyright (c) 2014 Pierre Houguet. All rights reserved.
//

import UIKit

class TextAndBackgroundTableViewCell: PHFParallaxBackgroundCell {
   
    var _textLabel                  : UILabel!;
    var _alphaTextBackgroundView    : UIView!;
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
    }
    
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?)  {
        
        
        _alphaTextBackgroundView = UIView(frame: CGRectMake(0.0, 0.0 , 0.0, 0.0));
        _alphaTextBackgroundView.backgroundColor = UIColor.blackColor();
        _alphaTextBackgroundView.autoresizingMask = UIViewAutoresizing.FlexibleWidth;
        _alphaTextBackgroundView.alpha = 0.35;
        _alphaTextBackgroundView.clipsToBounds = true;
        
        
        _textLabel = UILabel();
        _textLabel.backgroundColor = UIColor.clearColor();
        _textLabel.autoresizingMask = UIViewAutoresizing.FlexibleLeftMargin | UIViewAutoresizing.FlexibleWidth;
        _textLabel.font = UIFont(name: "ArialMT", size: 14.0);
        _textLabel.textAlignment = NSTextAlignment.Center;
        _textLabel.textColor = UIColor.whiteColor();
        _textLabel.numberOfLines = 1;
        
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        addSubview(_alphaTextBackgroundView)
        addSubview(_textLabel);
    }
    
    override func layoutSubviews() {
        super.layoutSubviews();
        _alphaTextBackgroundView.frame = CGRectMake(20.0, (self.frame.size.height - 20.0)/2.0, self.frame.size.width - 40.0, 20.0);
        _textLabel.frame = CGRectMake(20.0, (self.frame.size.height - 20.0)/2.0, self.frame.size.width - 40.0, 20.0);
    }
    
    
    func setTextAndImage(text : String, imageNamed : String) {
        super.setBackgroundImage(imageNamed);
        
        _textLabel.text = text;
    }
    

}
