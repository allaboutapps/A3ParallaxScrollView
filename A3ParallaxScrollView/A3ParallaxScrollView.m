//
//  A3ParallaxScrollView.m
//  A3ParallaxScrollViewSample
//
//  A3ParallaxScrollView for iOS
//  Created by Botond Kis on 24.10.12.
//  Copyright (c) 2012 aaa - All About Apps
//  Developed by Botond Kis
//  All rights reserved.
//
//  Redistribution and use in source and binary forms, with or without modification,
//  are permitted provided that the following conditions are met:
//
//      - Redistributions of source code must retain the above copyright notice, this list
//      of conditions and the following disclaimer.
//
//      - Redistributions in binary form must reproduce the above copyright notice, this list
//      of conditions and the following disclaimer in the documentation and/or other materials
//      provided with the distribution.
//
//      - Neither the name of the "aaa - All About Apps" nor the names of its contributors may be used
//      to endorse or promote products derived from this software without specific prior written
//      permission.
//
//
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
//  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
//  THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
//  ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
//  FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
//  DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
//  SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
//  CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
//  OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
//  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//  NO DOUGHNUTS WHERE HARMED DURING THE CODING OF THIS CLASS. BUT CHEESECAKES
//  WHERE. IF YOU READ THIS YOU ARE EITHER BORED OR A LAWYER.

#import "A3ParallaxScrollView.h"

CGPoint const A3DefaultAcceleration = (CGPoint){1.0f, 1.0f};

@interface A3ParallaxScrollView ()
@property (nonatomic, retain) NSMutableDictionary *_accelerationsOfSubViews;

- (void)_init;

@end

@implementation A3ParallaxScrollView
@synthesize _accelerationsOfSubViews;

//====================================================================
#pragma mark - memory & initialization

// designated init
- (void)_init{
    _accelerationsOfSubViews = [[NSMutableDictionary alloc] init];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self _init];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self _init];
    }
    return self;
}

- (id)init{
    self = [super init];
    if (self) {
        [self _init];
    }
    return self;
}

- (void)dealloc{
    [_accelerationsOfSubViews release];
    
    [super dealloc];
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
    NSValue *pointValue = [NSValue value:&acceleration withObjCType:@encode(CGPoint)];
    [self._accelerationsOfSubViews setObject:pointValue forKey:[NSNumber numberWithInt:(int)view]];
}

- (CGPoint)accelerationForView:(UIView *)view{
    
    // return
    CGPoint accelecration;
    
    // get acceleration
    NSValue *pointValue = [self._accelerationsOfSubViews objectForKey:[NSNumber numberWithInteger:(int)view]];
    if(pointValue == nil){
        accelecration = CGPointZero;
    }
    else{
        [pointValue getValue:&accelecration];
    }
    
    return accelecration;
}

- (void)willRemoveSubview:(UIView *)subview{
    [self._accelerationsOfSubViews removeObjectForKey:[NSNumber numberWithInt:(int)subview]];
}

//====================================================================
#pragma mark - layout

- (void)layoutSubviews{
    [super layoutSubviews];
    for (UIView *v in self.subviews) {
        // get acceleration
        CGPoint accelecration = [self accelerationForView:v];
        
        // move the view
        v.transform = CGAffineTransformMakeTranslation(self.contentOffset.x*(1.0f-accelecration.x), self.contentOffset.y*(1.0f-accelecration.y));
    }
}

@end
