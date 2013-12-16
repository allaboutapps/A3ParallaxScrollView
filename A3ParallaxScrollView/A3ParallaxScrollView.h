//
//  A3ParallaxScrollView.h
//  A3ParallaxScrollViewSample
//
//  A3ParallaxScrollView for iOS
//  Created by Botond Kis on 24.10.12.
//  Copyright (c) 2013 aaa - All About Apps
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

#import <UIKit/UIKit.h>


/// default acceleration Behaviour is CGGoint{1.0f, 1.0f}
extern CGPoint const A3DefaultAcceleration;


@interface A3ParallaxScrollView : UIScrollView

/**
 @brief Adds a Subview to the Scrollview with a specific acceleration.
 @param view The View wich will be added as subview.
 @param acceleration Acceleration of a View. ScrollViews default behaviour is CGPoint{1.0f, 1.0f} (via [addSubview]).
 */
- (void)addSubview:(UIView *)view withAcceleration:(CGPoint) acceleration;


/**
 @brief Sets the acceleration of an Subview.
 @param acceleration Acceleration of a View. ScrollViews default behaviour is CGPoint{1.0f, 1.0f} (via [addSubview]).
 @param view The View wich acceleration will be set.
 */
- (void)setAcceleration:(CGPoint) acceleration forView:(UIView *)view;


/**
 @brief Gets the acceleration for a subview.
 @return acceleration Acceleration of the specified View.
 @param view The View wich acceleration should be returned.
 */
- (CGPoint)accelerationForView:(UIView *)view;

@end
