//
//  ViewController.m
//  PathSample
//
//  Created by Botond Kis on 01.12.12.
//  Copyright (c) 2013 aaa - AllAboutApps. All rights reserved.
//

#import "ViewController.h"
#import "A3ParallaxScrollView.h"

@interface ViewController ()
@property (nonatomic, strong) A3ParallaxScrollView *parallaxScrollView;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // create ParallaxScrollView
    self.parallaxScrollView = [[A3ParallaxScrollView alloc] initWithFrame:self.view.bounds];
    self.parallaxScrollView.delegate = self;
    [self.view addSubview:self.parallaxScrollView];
    CGSize contentSize = self.parallaxScrollView.frame.size;
    contentSize.height *= 1.2f;
    self.parallaxScrollView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.parallaxScrollView.contentSize = contentSize;
    
    // add header and content
    CGRect headerFrame = self.viewHeader.frame;
    headerFrame.origin.y -= 122.0f;
    self.viewHeader.frame = headerFrame;
    [self.parallaxScrollView addSubview:self.viewHeader withAcceleration:CGPointMake(0.0f, 0.5f)];
    
    CGRect contentFrame = self.viewContent.frame;
    contentFrame.origin.y += 122.0f;
    self.viewContent.frame = contentFrame;
    [self.parallaxScrollView addSubview:self.viewContent];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    // accelerate header just with half speed down, but with normal speed up
    if (scrollView.contentOffset.y > 0) {
        [self.parallaxScrollView setAcceleration:A3DefaultAcceleration forView:self.viewHeader];
    }else{
        [self.parallaxScrollView setAcceleration:CGPointMake(0.0f, 0.5f) forView:self.viewHeader];
    }
}

@end
