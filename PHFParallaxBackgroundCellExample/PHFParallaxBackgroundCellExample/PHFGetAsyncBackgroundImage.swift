//
//  PHFGetAsyncBackgroundImage.swift
//  PHFParallaxBackgroundCellExample
//
//  Created by Pierre Houguet on 18/12/2014.
//  Copyright (c) 2014 Pierre Houguet. All rights reserved.
//

import UIKit
import Alamofire

protocol AsyncImageRequestDelegate {
    func imageRequestDidSucceed(image : UIImage);
    func imageRequestDidFailed(image : UIImage, error : NSError);
}

class PHFGetAsyncBackgroundImage: NSObject {
 
    
    var delegate : AsyncImageRequestDelegate?;
    
    
    /**
    * func getAsyncImage
    * Start a request to get the image from a server
    *
    * @Param : imageUrl, the image url in string
    */
    func getAsyncImage(imageUrl : NSString) {
        let imageURL : NSURL! = NSURL(string: imageUrl);
        
        Alamofire.request(.GET, imageURL, parameters: nil)
            .response { (request, response, data, error) in
                
                let imageData : NSData? = data as NSData?;
                
                if ((imageData) != nil && imageData?.length > 0) {
                    let image : UIImage = UIImage(data: imageData!)!;
                    self.delegate?.imageRequestDidSucceed(image);
                }
        }
    }
}
