//
//  ViewController.swift
//  PHFParallaxBackgroundCellExample
//
//  Created by Pierre Houguet on 10/12/2014.
//  Copyright (c) 2014 Pierre Houguet. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet var _imageTableView : PHFParallaxTableView!;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
        return 25;
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 160.0;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var imageCell = tableView.dequeueReusableCellWithIdentifier("imagecell") as TextAndBackgroundTableViewCell!;
            
        if (imageCell == nil) {
            imageCell = TextAndBackgroundTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "imageNumber");
            imageCell.selectionStyle = UITableViewCellSelectionStyle.None;
        }
        
        let text : NSString = NSString(format:"Cell n°%d", indexPath.row);
        
        let imageNumber : NSInteger = indexPath.row % 5 + 1;
        
        let imageNamed : NSString = NSString(format:"%d", imageNumber);
        imageCell.setTextAndImage(text, imageNamed: imageNamed);
        
            
        return imageCell;
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        //inform the tableview offset changes
        _imageTableView.scrollViewDidScroll(self.view);
    }

}

