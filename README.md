 
#What is A3ParallaxScrollView?
**A3ParallaxScrollView** is a `UIScrollView` subclass with a parallax scrolling effect on iPhone and iPad.  

It is written in *Objective-C* and works for all iOS applications using ARC.

##Video:
Here are two examples of the use of **A3ParallaxScrollView**.  
The first is a little Demo with a lot of views and additional custom transformations (sine movement of the moon).  
The other one shows a *Path* like scrolling behaviour.  
![A3ParallaxScrollView sample](https://dl.dropbox.com/u/9934540/aaa/A3ParallaxScrollViewSample.gif "A3ParallaxScrollView Sample Video")
![A3ParallaxScrollView Path like sample](https://dl.dropbox.com/u/9934540/aaa/A3ParallaxScrollViewPathSample.gif "A3ParallaxScrollView Path like Sample Video")  
Both sample projects are in the repository.

##Usage:
Add the **A3ParallaxScrollView** directory to your project.  
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
[© allaboutapps 2013](http://www.allaboutapps.at) [dev by yinkou](https://github.com/yinkou)