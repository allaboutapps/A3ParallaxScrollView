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
#import <AVFoundation/AVFoundation.h>

@interface A3ViewController ()
@property (strong, nonatomic) A3ParallaxScrollView *scrollView;
@property (strong, nonatomic) UIImageView *imageViewMoon;
@property (strong, nonatomic) UIImageView *imageViewSlender;
@property (strong, nonatomic) UIImageView *imageViewSlenderFace;
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;
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
    self.scrollView.clipsToBounds = YES;
    self.scrollView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.scrollView.showsHorizontalScrollIndicator = self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.delegate = self;
    self.scrollView.directionalLockEnabled = NO;
    self.scrollView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.scrollView];
    
    UITapGestureRecognizer *tapRec = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(slenderTapped:)];
    [self.scrollView addGestureRecognizer:tapRec];
    
    // head
    {
        self.imageViewSlenderFace = [[UIImageView alloc] initWithFrame:self.view.bounds];
        self.imageViewSlenderFace.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        self.imageViewSlenderFace.backgroundColor = [UIColor blackColor];
        self.imageViewSlenderFace.image = [UIImage imageNamed:@"slenderface"];
        self.imageViewSlenderFace.alpha = 0.0;
        [self.view addSubview:self.imageViewSlenderFace];
        
        NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:@"scream" ofType: @"mp3"];
        NSURL *fileURL = [[NSURL alloc] initFileURLWithPath:soundFilePath ];
        self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:nil];
        self.audioPlayer.numberOfLoops = 0; //infinite loop
        self.audioPlayer.volume = 1.0f;
        self.audioPlayer.enableRate = YES;
        self.audioPlayer.rate = 1.2f;
        [self.audioPlayer prepareToPlay];
    }
    
    
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
    [self.scrollView addSubview:self.imageViewMoon withAcceleration:CGPointMake(xAccelMoon, 0.035)];
    
    
    // add background image
    for (int i = -1; i < scrollViewWithMultiplier+1; i++) {
        UIImageView *imageViewForrest = [[UIImageView alloc]initWithImage:backgroundImage];
        imageViewForrest.contentMode = UIViewContentModeScaleToFill;
        CGRect frameImageView = imageViewForrest.frame;
        frameImageView.size.height = self.view.frame.size.height - 88.0f;
        frameImageView.origin.x = i*frameImageView.size.width;
        frameImageView.origin.y = self.scrollView.contentSize.height - frameImageView.size.height*0.7;
        
        imageViewForrest.frame = frameImageView;
        [self.scrollView addSubview:imageViewForrest withAcceleration:CGPointMake(0.7f, 0.02f)];
    }
    
    ////
    //// Add ground
    UIImage *groundImage = [UIImage imageNamed:@"ground-texture"];
    NSInteger numberOfGrounds = self.scrollView.contentSize.width/groundImage.size.width;
    for (int i = -1; i <= numberOfGrounds + 1; i++) {
        UIImageView *imageViewGround = [[UIImageView alloc]initWithImage:groundImage];
        imageViewGround.contentMode = UIViewContentModeScaleToFill;
        CGRect frameImageView = imageViewGround.frame;
        frameImageView.origin.x = i * frameImageView.size.width;
        frameImageView.origin.y = self.scrollView.contentSize.height-frameImageView.size.height+5.0f;
        imageViewGround.frame = frameImageView;
        [self.scrollView addSubview:imageViewGround withAcceleration:CGPointMake(0.8f, -0.01f)];
    }
    
    ////
    //// Add Trees
    // far
    UIImage *darkTreeImage = [UIImage imageNamed:@"tree-dark"];
    for (int i = -1; i < scrollViewWithMultiplier*20+1; i++) {
        UIImageView *imageViewTree = [[UIImageView alloc]initWithImage:darkTreeImage];
        imageViewTree.contentMode = UIViewContentModeScaleToFill;
        CGRect frameImageView = imageViewTree.frame;
        frameImageView.size.height *= 0.7f;
        frameImageView.size.width *= 0.7f;
        frameImageView.origin.x = i*(frameImageView.size.width+backgroundImage.size.width+self.view.frame.size.width/2.0)/20;
        frameImageView.origin.y = self.scrollView.contentSize.height - frameImageView.size.height - (frameImageView.size.height * 1.2f);
        imageViewTree.frame = frameImageView;
        [self.scrollView addSubview:imageViewTree withAcceleration:CGPointMake(0.2f, 0.15f)];
    }
    
    for (int i = -1; i < scrollViewWithMultiplier*14+1; i++) {
        UIImageView *imageViewTree = [[UIImageView alloc]initWithImage:darkTreeImage];
        imageViewTree.contentMode = UIViewContentModeScaleToFill;
        CGRect frameImageView = imageViewTree.frame;
        frameImageView.size.height *= 0.8f;
        frameImageView.size.width *= 0.8f;
        frameImageView.origin.x = i*(frameImageView.size.width+backgroundImage.size.width+self.view.frame.size.width/2.0)/14;
        frameImageView.origin.y = self.scrollView.contentSize.height - frameImageView.size.height - (frameImageView.size.height * 0.75f);
        imageViewTree.frame = frameImageView;
        [self.scrollView addSubview:imageViewTree withAcceleration:CGPointMake(0.4f, 0.1f)];
    }
    
    // middle
    UIImage *middleTreeImage = [UIImage imageNamed:@"tree-middle"];
    for (int i = -1; i < scrollViewWithMultiplier*10+1; i++) {
        UIImageView *imageViewTree = [[UIImageView alloc]initWithImage:middleTreeImage];
        imageViewTree.contentMode = UIViewContentModeScaleToFill;
        CGRect frameImageView = imageViewTree.frame;
        frameImageView.size.height *= 0.90f;
        frameImageView.size.width *= 0.90f;
        frameImageView.origin.x = i*(frameImageView.size.width+backgroundImage.size.width+self.view.frame.size.width/2.0)/10;
        frameImageView.origin.y = self.scrollView.contentSize.height - frameImageView.size.height - (frameImageView.size.height * 0.4f);
        imageViewTree.frame = frameImageView;
        [self.scrollView addSubview:imageViewTree withAcceleration:CGPointMake(0.6f, 0.05f)];
    }
    {
        UIImage *slenderImage = [UIImage imageNamed:@"slender"];
        self.imageViewSlender = [[UIImageView alloc]initWithImage:slenderImage];
        self.imageViewSlender.contentMode = UIViewContentModeScaleToFill;
        CGRect frameImageView = self.imageViewSlender.frame;
        frameImageView.origin.x = 600.0f;//(arc4random()%(int)(self.scrollView.contentSize.width - 200))+100;
        frameImageView.origin.y = self.scrollView.contentSize.height - frameImageView.size.height - (frameImageView.size.height * 0.4f) + 10;
        self.imageViewSlender.frame = frameImageView;
        [self.scrollView addSubview:self.imageViewSlender withAcceleration:CGPointMake(0.5f, 0.05f)];
    }
    
    // near
    UIImage *treeImage = [UIImage imageNamed:@"tree"];
    for (int i = -1; i < scrollViewWithMultiplier*6+1; i++) {
        UIImageView *imageViewTree = [[UIImageView alloc]initWithImage:treeImage];
        imageViewTree.contentMode = UIViewContentModeScaleToFill;
        CGRect frameImageView = imageViewTree.frame;
        frameImageView.size.height *= 1.0f;
        frameImageView.size.width *= 1.0f;
        frameImageView.origin.x = i*(frameImageView.size.width+backgroundImage.size.width+self.view.frame.size.width/2.0)/6;
        frameImageView.origin.y = self.scrollView.contentSize.height - frameImageView.size.height - 22.0f;
        imageViewTree.frame = frameImageView;
        [self.scrollView addSubview:imageViewTree withAcceleration:CGPointMake(0.8f, 0.01f)];
    }
    
    // add label
    UILabel *labelText = [[UILabel alloc] initWithFrame:CGRectMake(0, self.scrollView.contentSize.height-60.0f, self.view.frame.size.width, 40)];
    labelText.backgroundColor = [UIColor clearColor];
    labelText.textAlignment = NSTextAlignmentCenter;
    labelText.textColor = [UIColor whiteColor];
    labelText.font = [UIFont systemFontOfSize:24];
    labelText.text = @"When you see it...";
    labelText.layer.shadowColor = [UIColor redColor].CGColor;
    labelText.layer.shadowOffset = CGSizeMake(0, 2);
    labelText.layer.shadowOpacity = 1.0f;
    labelText.layer.shadowRadius = 4.0f;
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

- (void)slenderTapped:(UITapGestureRecognizer *)taprec{
    if(taprec.state == UIGestureRecognizerStateEnded){
        CGPoint touchPos = [taprec locationInView:self.view];
        CGRect slenderRect = [self.scrollView convertRect:self.imageViewSlender.frame toView:self.view];
        slenderRect = CGRectInset(slenderRect, 30, 20);
        if (CGRectContainsPoint(slenderRect, touchPos) && !self.audioPlayer.isPlaying) {
            self.imageViewSlenderFace.alpha = 1.0f;
            [self.audioPlayer play];
            [UIView animateWithDuration:2.0f
                                  delay:0.6f options:NULL animations:^{
                                      self.imageViewSlenderFace.alpha = 0.0f;
                                  } completion:nil];
        }
    }
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
    newMoonFrame.origin.y = newMoonFrame.size.height*0.66f*yMultiplier + (newMoonFrame.size.height*0.66f) + 20.0f;
    
    // assign new frame
    self.imageViewMoon.frame = newMoonFrame;
    
    // apply original transform
    self.imageViewMoon.transform = trans;
}

@end
