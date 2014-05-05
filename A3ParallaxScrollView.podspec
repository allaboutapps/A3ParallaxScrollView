#
# Be sure to run `pod lib lint NAME.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = "A3ParallaxScrollView"
  s.version          = "1.0"
  s.summary          = "A UIScrollview subclass with a high performance parallax scrolling effect"
  s.description      = 

#What is A3ParallaxScrollView?
**A3ParallaxScrollView** is a `UIScrollView` subclass with a parallax scrolling effect on iPhone and iPad.  

It is written in *Objective-C* and works for all iOS applications using ARC.

##Video:
Here are two examples of the use of **A3ParallaxScrollView**.  
The first is a little Demo with a lot of views and additional custom transformations (sine movement of the moon).  
The other one shows a *Path* like scrolling behaviour.  
![A3ParallaxScrollView sample](https://dl.dropbox.com/u/9934540/aaa/A3ParallaxScrollViewSample.gif "A3ParallaxScrollView Sample Video")
![A3ParallaxScrollView Path like sample](https://dl.dropbox.com/u/9934540/aaa/A3ParallaxScrollViewPathSample.gif "A3ParallaxScrollView Path like Sample Video")  
Both sample projects are included in the github repository.

  s.homepage         = "https://github.com/allaboutapps/A3ParallaxScrollView"
  s.license          = 'MIT'
  s.author           = { "Botond Kis" => "botond.kis@gmail.com" }
  s.source           = { :git => "https://github.com/allaboutapps/A3ParallaxScrollView.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/itsallaboutapps'

  # s.platform     = :ios, '5.0'
  # s.ios.deployment_target = '5.0'
  s.requires_arc = true

  s.source_files = 'Classes'
end
