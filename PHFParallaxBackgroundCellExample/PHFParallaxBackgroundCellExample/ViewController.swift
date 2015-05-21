//
//  ViewController.swift
//  PHFParallaxBackgroundCellExample
//
//  Created by Pierre Houguet on 10/12/2014.
//  Copyright (c) 2014 Pierre Houguet. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ParallaxBackgroundCellDelegate {
 
    
    var _images : Array<NSString> = [];
    
    @IBOutlet var _imageTableView : PHFParallaxTableView!;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        _images = ["0", "1", "2", "3", "4", "https://farm3.staticflickr.com/2890/13261455834_95f2f26c40_n.jpg", "https://farm8.staticflickr.com/7370/13558867695_74ea7ed1f9_b.jpg", "https://farm9.staticflickr.com/8305/7749825938_3fb5433606_b.jpg", "https://farm9.staticflickr.com/8295/7996355918_6ba942c096_b.jpg" , "https://farm8.staticflickr.com/7370/13558867695_74ea7ed1f9_b.jpg", "https://farm9.staticflickr.com/8305/7749825938_3fb5433606_b.jpg", "https://farm9.staticflickr.com/8295/7996355918_6ba942c096_b.jpg" ];
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //UITableViewDataSource
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0;
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0;
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _images.count;
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 160.0;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var imageCell = tableView.dequeueReusableCellWithIdentifier("imagecell") as! TextAndBackgroundTableViewCell!;
            
        if (imageCell == nil) {
            imageCell = TextAndBackgroundTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "imageNumber");
            imageCell.selectionStyle = UITableViewCellSelectionStyle.None;
            imageCell.delegate = self;
        }
        imageCell.indexPath = indexPath;
        
        let text : String = "Cell n°\(indexPath.row)";
        
        
        let imageNamed : String = _images[indexPath.row] as String;
        imageCell.setTextAndImage(text, imageNamed: imageNamed);
        
            
        return imageCell;
    }
    
  
    //Parallax cell delegate
    func offsetForCellAtIndexPath(indexPath: NSIndexPath) -> CGFloat {
        
        return 60.0;
    }
    
    
    func backgroundIsOnlineCellAtIndexPath(indexPath: NSIndexPath) -> Bool {

        var isOnline = true;
        
        if (indexPath.row < 5) {
            isOnline = false;
        }
        return isOnline;
    }

    func backgroundPlaceholderForCellAtIndexPath(indexPath: NSIndexPath) -> String {
            return "0";
    }
    
    
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        //inform the tableview offset changes
        _imageTableView.scrollViewDidScroll(self.view);
    }

}

