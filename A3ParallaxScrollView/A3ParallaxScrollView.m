//
//  A3ParallaxScrollView.m
//  Created by Botond Kis on 24.10.12.

/*
 The MIT License (MIT)
 
 A3ParallaxScrollView for iOS
 Copyright (c) 2014, aaa - All About Apps
 Developed by Botond Kis
 All rights reserved.
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 */

#import "A3ParallaxScrollView.h"

CGPoint const A3DefaultAcceleration = (CGPoint){1.0f, 1.0f};

@interface A3ParallaxScrollView ()
@property (nonatomic, strong) NSMutableDictionary *accelerationsOfSubViews;
@end

@implementation A3ParallaxScrollView

//====================================================================
#pragma mark - properties

- (NSMutableDictionary *)accelerationsOfSubViews{
    
    // lazy load dictionary
    if (!_accelerationsOfSubViews) {
        _accelerationsOfSubViews = [NSMutableDictionary dictionary];
    }
    return _accelerationsOfSubViews;
}


//====================================================================
#pragma mark - logic

- (void)addSubview:(UIView *)view{
    [self addSubview:view withAcceleration:A3DefaultAcceleration];
}


- (void)addSubview:(UIView *)view withAcceleration:(CGPoint) acceleration{
    // add to super
    [super addSubview:view];
    [self setAcceleration:acceleration forView:view];
}


- (void)setAcceleration:(CGPoint) acceleration forView:(UIView *)view{
    // store acceleration
    (self.accelerationsOfSubViews)[@((int)view)] = NSStringFromCGPoint(acceleration);
}

- (CGPoint)accelerationForView:(UIView *)view{
    
    // return var
    CGPoint accelecration;
    
    // get acceleration
    NSString *pointValue = (self.accelerationsOfSubViews)[@((int)view)];
    if(pointValue == nil){
        accelecration = CGPointZero;
    }
    else{
        accelecration = CGPointFromString(pointValue);
    }
    
    return accelecration;
}

- (void)willRemoveSubview:(UIView *)subview{
    [self.accelerationsOfSubViews removeObjectForKey:@((int)subview)];
}

//====================================================================
#pragma mark - layout

- (void)layoutSubviews{
    [super layoutSubviews];
    
    
    for (UIView *v in self.subviews) {
        // get acceleration
        CGPoint accelecration = [self accelerationForView:v];
        
        // move the view
        v.layer.affineTransform = CGAffineTransformMakeTranslation(self.contentOffset.x*(1.0f-accelecration.x), self.contentOffset.y*(1.0f-accelecration.y));
    }
}

@end
