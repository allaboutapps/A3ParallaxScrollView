 
#What is A3ParallaxScrollView?
**A3ParallaxScrollView** is a `UIScrollView` subclass with a parallax scrolling effect.  

It is written in *Objective-C* and works for all iOS applications.  
ARC is not enabled for the project, but you can easily convert it to arc with the XCode built in ARC converter or by remove the dealloc method and the two or three releases.  
If you are too lazy for that, you can still set the `-fno-objc-arc` flag.

##Video:
![A3ParallaxScrollView sample](https://dl.dropbox.com/u/9934540/aaa/A3ParallaxScrollViewSample.gif "A3ParallaxScrollView Sample Video")
![A3ParallaxScrollView Path like sample](https://dl.dropbox.com/u/9934540/aaa/A3ParallaxScrollViewPathSample.gif "A3ParallaxScrollView Path like Sample Video")

##Usage:
Add the QuartzCore Framework and the **A3ParallaxScrollView** directory to your project.  
Initialize a **A3ParallaxScrollView** like any other View by code or in the InterfaceBuilder.
Now you can add any views to it with a specified acceleration:

`- (void)addSubview:(UIView *)view withAcceleration:(CGPoint) acceleration`

or you can simply add a subview to your **A3ParallaxScrollView** and set his acceleration afterwards with acceleration setter.

`- (void)setAcceleration:(CGPoint) acceleration forView:(UIView *)view`
 
#License:
[See our BSD 3-Clause License](https://github.com/allaboutapps/A3ParallaxScrollView/blob/master/LICENSE.txt)

#Contribute:
Feel free to fork and make pull requests! We are also very happy if you tell us about your app(s) which use this control.  


![aaa - AllAboutApps](https://dl.dropbox.com/u/9934540/aaa/aaaLogo.png "aaa - AllAboutApps")  
[© allaboutapps 2012](http://www.allaboutapps.at)