PHFParallaxBackgroundCell
=========================

![PHFParallaxBackgroundCell screenshot](https://github.com/pi3r0/PHFParallaxBackgroundCell/blob/master/images/PHFParallaxBackgroundCell.gif?raw=true "Screenshot")
![PHFParallaxBackgroundCell screenshot](https://github.com/pi3r0/PHFParallaxBackgroundCell/blob/master/images/PHFParallaxBackgroundCell.PNG?raw=true "Screenshot")

Extension for the `UITableView` and `UITableViewCell` that avoid a parallax effect when user is scrolling. Really easy to implement and use and Swift.

## Getting Started

- Add `Alamofire` framework used for remote image to your project available at https://github.com/Alamofire/Alamofire
- Add `PHFParallaxBackgroundCell` and `PHFParallaxTableView` class to your project
- Change the type of your Tableview with `PHFParallaxTableView` like var ` var myTableView : PHFParallaxTableView`
- Implement the `scrollViewDidScroll` delegate on your view controller and implement `myTableView.scrollViewDidScroll(self.view)` inside.
- Inherit your tableview cells class with the `PHFParallaxBackgroundCell` and set the background of your cell with `super.setBackgroundImage(myImageName)` method.

## Customization 

All customize methods are optionals, if you want customization you have to add `ParallaxBackgroundCellDelegate` in your view controller, on you cell set `cell.delegate = self`. 
The `PHFParallaxBackgroundCell` have a default indexPath (0, 0) if you want to set different case for your cell, add `cell.indexPath = indexPath`, so delegate can get an unique value for an indexPath (This is the case in my example).

### offsetForCellAtIndexPath

- you can provide an offset for the background image (by default 40px), the offset is the difference between the  
`image.height` and the `cell.heigth`

```swift
func offsetForCellAtIndexPath(indexPath: NSIndexPath) -> CGFloat {
    return 60.0;
  }
```

### backgroundIsOnlineCellAtIndexPath

- if the image are remote or local. 

```swift
 func backgroundIsOnlineCellAtIndexPath(indexPath: NSIndexPath) -> Bool {
    var isOnline = true;
        
    if (indexPath.row < 5) {
      isOnline = false;
    }
    return isOnline;
  }
```
### backgroundPlaceholderForCellAtIndexPath

- if you want use a placeholder image during the remote image loading, get the local image name. 

```swift
 func backgroundPlaceholderForCellAtIndexPath(indexPath: NSIndexPath) -> NSString {
            return "placeholderImage";
    }
```

## How it Works

It add a background image view by default on your cell with 40px taller than the cell height . In the tableView extension, we add a method `scrollViewDidScroll` with the parameter `superview`, this method will be called every time the user did scroll. This will take every cell visible on screen and every cell will calculate a new background origin. You can see an example if you clone the package. 

## License

PHFParallaxBackgroundCell is available under the [MIT license](LICENSE).
