 
#What is A3ParallaxScrollView?
**A3ParallaxScrollView** is a `UIScrollView` subclass with a parallax scrolling effect on iPhone and iPad.  

It is written in *Objective-C* and works for all iOS applications using ARC.

##Video:
Here are two examples of the use of **A3ParallaxScrollView**.  
The first is a little Demo with a lot of views and additional custom transformations (sine movement of the moon).  
The other one shows a *Path* like scrolling behaviour.  
![A3ParallaxScrollView sample](https://dl.dropbox.com/u/9934540/aaa/A3ParallaxMoonSample.gif "A3Parallax Moon Sample Video")
![A3ParallaxScrollView Path like sample](https://dl.dropbox.com/u/9934540/aaa/A3ParallaxScrollViewPathSample.gif "A3ParallaxScrollView Path like Sample Video")  
Both sample projects are included in the github repository.

##Installation

###With CocoaPods:
A3ParallaxScrollView is available on [CocoaPods](http://cocoapods.org) . Just add the following to your project Podfile:

####Podfile
	platform :ios, '7.0'
	pod "A3ParallaxScrollView", "~> 1.0"
	
	
###Manualy:
Download the `A3ParallaxScrollView.h/.m` files and add them to your Project. There are no dependencies.

##Usage:
Include **A3ParallaxScrollView** by the folowing import.

	#import "A3ParallaxScrollView.h"

Initialize a **A3ParallaxScrollView** like any regular `UIScrollView` by code or in the InterfaceBuilder.

#### Update Accelerations
You can add any views to it with a specified acceleration:

`- (void)addSubview:(UIView *)view withAcceleration:(CGPoint) acceleration`

Or you can simply add a subview to your **A3ParallaxScrollView** and set his acceleration afterwards with acceleration setter.

`- (void)setAcceleration:(CGPoint) acceleration forView:(UIView *)view`
 
#License:
[See our MIT License](https://github.com/allaboutapps/A3ParallaxScrollView/blob/master/LICENSE)

#Contribute:
Feel free to fork and make pull requests! We are also very happy if you tell us about your app(s) which use this control.  


![aaa - AllAboutApps](https://dl.dropbox.com/u/9934540/aaa/aaaLogo.png "aaa - AllAboutApps")  
[© allaboutapps 2014](http://www.allaboutapps.at) [dev by Botond Kis](https://github.com/yinkou)