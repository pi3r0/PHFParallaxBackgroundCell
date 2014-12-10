PHFParallaxBackgroundCell
=========================
![PHFParallaxBackgroundCell screenshot](https://github.com/pi3r0/PHFParallaxBackgroundCell/master/IMG_2370.png)
Extension for the `UITableView` and `UITableViewCell` that avoid a parallax effect when user is scrolling. Really easy to implement and use and Swift.

## Getting Started

- Add `PHFParallaxBackgroundCell` and `PHFParallaxTableView` class to your project
- Change the type of your Tableview with `PHFParallaxTableView` like var ` var myTableView : PHFParallaxTableView`
- Implement the `scrollViewDidScroll` delegate on your view controller and implement `myTableView.scrollViewDidScroll(self.view)` inside.
- Inherit your tableview cells class with the `PHFParallaxBackgroundCell` and set the background of your cell with `super.setBackgroundImage(myImageName)` method.

## How it Works

It add a background image view by default on your cell with 40px taller than the cell height . In the tableView extension, we add a method `scrollViewDidScroll` with the parameter `superview`, this method will be called every time the user did scroll. This will take every cell visible on screen and every cell will calculate a new background origin. You can see an example if you clone the package. 

## License

PHFParallaxBackgroundCell is available under the [MIT license](LICENSE).
