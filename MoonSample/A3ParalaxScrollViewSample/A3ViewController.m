//
//  A3ViewController.m
//  A3ParallaxScrollViewSample
//
//  Created by Botond Kis on 24.10.12.
//  Copyright (c) 2013 AllAboutApps. All rights reserved.
//

#import "A3ViewController.h"
#import "A3ParallaxScrollView.h"
#import "UIImage+Color.h"
#import <QuartzCore/QuartzCore.h>

@interface A3ViewController ()
@property (strong, nonatomic) A3ParallaxScrollView *scrollView;
@property (strong, nonatomic) UIImageView *imageViewMoon;
@end

@implementation A3ViewController

static int scrollViewWithMultiplier = 6;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // get forrest BG Image
    UIImage *backgroundImage = [UIImage imageNamed:@"forrest.png"];
    
    // init and set up the scrollview
    self.scrollView = [[A3ParallaxScrollView alloc] initWithFrame:self.view.bounds];
    self.scrollView.contentSize = CGSizeMake(backgroundImage.size.width*scrollViewWithMultiplier, self.view.frame.size.height+40);
    self.scrollView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.scrollView.showsHorizontalScrollIndicator = self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.delegate = self;
    self.scrollView.directionalLockEnabled = NO;
    [self.view addSubview:self.scrollView];
    
    
    // add star background
    UIImageView *imageViewStarsBackground = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"stars-backgorund"]];
    imageViewStarsBackground.contentMode = UIViewContentModeScaleToFill;
    CGRect frameImageViewStars = imageViewStarsBackground.frame;
    frameImageViewStars.origin.x = -30;
    frameImageViewStars.origin.y = -30;
    frameImageViewStars.size.width *=1.5;
    frameImageViewStars.size.height *=1.5;
    imageViewStarsBackground.frame = frameImageViewStars;
    [self.scrollView addSubview:imageViewStarsBackground withAcceleration:CGPointMake(((15)/self.scrollView.contentSize.width), -0.01)];
    

    // add moon
    self.imageViewMoon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"moon"]];
    self.imageViewMoon.contentMode = UIViewContentModeScaleToFill;
    CGFloat mWitdh = self.view.frame.size.width;
    CGRect frameImageViewMoon = self.imageViewMoon.frame;
    frameImageViewMoon.size.height *= 0.50f;
    frameImageViewMoon.size.width *= 0.50f;
    frameImageViewMoon.origin.x = -frameImageViewMoon.size.width/2.0f;
    frameImageViewMoon.origin.y = -frameImageViewMoon.size.height * 0.25f;
    self.imageViewMoon.frame = frameImageViewMoon;
    CGFloat xAccelMoon = -(mWitdh+frameImageViewMoon.size.width/2.0f)/self.scrollView.contentSize.width;
    [self.scrollView addSubview:self.imageViewMoon withAcceleration:CGPointMake(xAccelMoon, 0.025)];
    
    
    // add background image
    for (int i = -1; i < scrollViewWithMultiplier+1; i++) {
        UIImageView *imageViewForrest = [[UIImageView alloc]initWithImage:backgroundImage];
        imageViewForrest.contentMode = UIViewContentModeScaleToFill;
        CGRect frameImageView = imageViewForrest.frame;
        frameImageView.origin.x = i*frameImageView.size.width;
        frameImageView.origin.y = 200.0f;
        frameImageView.size.height = self.view.frame.size.height-88.0f;
        imageViewForrest.frame = frameImageView;
        [self.scrollView addSubview:imageViewForrest withAcceleration:CGPointMake(0.05f, 0.05f)];
    }
    
    ////
    //// Add Trees
    // far
    UIImage *darkTreeImage = [UIImage imageNamed:@"tree-dark.png"];
    for (int i = -1; i < scrollViewWithMultiplier*20+1; i++) {
        UIImageView *imageViewTree = [[UIImageView alloc]initWithImage:darkTreeImage];
        imageViewTree.contentMode = UIViewContentModeScaleToFill;
        CGRect frameImageView = imageViewTree.frame;
        frameImageView.origin.x = i*(frameImageView.size.width+backgroundImage.size.width+self.view.frame.size.width/2.0)/20;
        frameImageView.origin.y = 140;
        frameImageView.size.height *= 0.7f;
        frameImageView.size.width *= 0.7f;
        imageViewTree.frame = frameImageView;
        [self.scrollView addSubview:imageViewTree withAcceleration:CGPointMake(0.2f, 0.2f)];
    }
    
    for (int i = -1; i < scrollViewWithMultiplier*14+1; i++) {
        UIImageView *imageViewTree = [[UIImageView alloc]initWithImage:darkTreeImage];
        imageViewTree.contentMode = UIViewContentModeScaleToFill;
        CGRect frameImageView = imageViewTree.frame;
        frameImageView.origin.x = i*(frameImageView.size.width+backgroundImage.size.width+self.view.frame.size.width/2.0)/14;
        frameImageView.origin.y = 220;
        frameImageView.size.height *= 0.8f;
        frameImageView.size.width *= 0.8f;
        imageViewTree.frame = frameImageView;
        [self.scrollView addSubview:imageViewTree withAcceleration:CGPointMake(0.4f, 0.4f)];
    }
    
    // middle
    UIImage *middleTreeImage = [UIImage imageNamed:@"tree-middle.png"];
    for (int i = -1; i < scrollViewWithMultiplier*10+1; i++) {
        UIImageView *imageViewTree = [[UIImageView alloc]initWithImage:middleTreeImage];
        imageViewTree.contentMode = UIViewContentModeScaleToFill;
        CGRect frameImageView = imageViewTree.frame;
        frameImageView.origin.x = i*(frameImageView.size.width+backgroundImage.size.width+self.view.frame.size.width/2.0)/10;
        frameImageView.origin.y = 300;
        frameImageView.size.height *= 0.90f;
        frameImageView.size.width *= 0.90f;
        imageViewTree.frame = frameImageView;
        [self.scrollView addSubview:imageViewTree withAcceleration:CGPointMake(0.6f, 0.6f)];
    }
    
    // near
    UIImage *treeImage = [UIImage imageNamed:@"tree.png"];
    for (int i = -1; i < scrollViewWithMultiplier*6+1; i++) {
        UIImageView *imageViewTree = [[UIImageView alloc]initWithImage:treeImage];
        imageViewTree.contentMode = UIViewContentModeScaleToFill;
        CGRect frameImageView = imageViewTree.frame;
        frameImageView.origin.x = i*(frameImageView.size.width+backgroundImage.size.width+self.view.frame.size.width/2.0)/6;
        frameImageView.origin.y = 400;
        frameImageView.size.height *= 1.0f;
        frameImageView.size.width *= 1.0f;
        imageViewTree.frame = frameImageView;
        [self.scrollView addSubview:imageViewTree withAcceleration:CGPointMake(0.8f, 0.8f)];
    }
    
    // add label
    UILabel *labelText = [[UILabel alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-140.0f, self.view.frame.size.width, 40)];
    labelText.backgroundColor = [UIColor clearColor];
    labelText.textAlignment = NSTextAlignmentCenter;
    labelText.textColor = [UIColor redColor];
    labelText.font = [UIFont systemFontOfSize:24];
    labelText.text = @"P4r4L4X";
    [labelText sizeToFit];
    CGFloat xAccelText = -((self.view.frame.size.width-labelText.frame.size.width+20)/self.scrollView.contentSize.width);
    [self.scrollView addSubview:labelText withAcceleration:CGPointMake(xAccelText, 0)];
    
    // content offset
    self.scrollView.contentOffset = CGPointMake((self.scrollView.contentSize.width-self.scrollView.frame.size.width)/2.0f, 0);
}

- (void)viewWillAppear:(BOOL)animated{
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation{    
    return YES;
}

- (BOOL)shouldAutorotate{
    return YES;
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
    
    // calc new moon acceleration
    CGFloat width = UIInterfaceOrientationIsLandscape(toInterfaceOrientation)?self.view.frame.size.height:self.view.frame.size.width;
    
    CGFloat xAccelMoon = -(width+self.imageViewMoon.frame.size.width/2.0f)/self.scrollView.contentSize.width;
    CGPoint accel = CGPointMake(xAccelMoon, 0.0f);
    
    // set the new animation
    [self.scrollView setAcceleration:accel forView:self.imageViewMoon];
    
    // animate layout
    [UIView animateWithDuration:duration animations:^{
        [self.scrollView setNeedsLayout];
    }];
}

- (void)scrollViewDidScroll:(UIScrollView *)aScrollView{
    
    // calc moon frame, let's make a nice wave :D
    float normalizedContentOffsetX = aScrollView.contentOffset.x;
    
    normalizedContentOffsetX /= (aScrollView.contentSize.width-aScrollView.bounds.size.width)/2;
    normalizedContentOffsetX = MIN(2, normalizedContentOffsetX);
    normalizedContentOffsetX = MAX(0, normalizedContentOffsetX);
    
    CGFloat yMultiplier = cosf(normalizedContentOffsetX*M_PI);
    
    // remember orig transform
    CGAffineTransform trans = self.imageViewMoon.transform;
    
    // reset transform bacause frame won't return a useful frame if a transform is applied
    self.imageViewMoon.transform = CGAffineTransformIdentity;
    
    // do calculation
    CGRect newMoonFrame = self.imageViewMoon.frame;
    newMoonFrame.origin.y = newMoonFrame.size.height*0.66f*yMultiplier + (newMoonFrame.size.height*0.66f);
    
    // assign new frame
    self.imageViewMoon.frame = newMoonFrame;
    
    // apply original transform
    self.imageViewMoon.transform = trans;
}

@end
