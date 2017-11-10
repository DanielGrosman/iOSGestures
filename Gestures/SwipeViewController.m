//
//  SwipeViewController.m
//  Gestures
//
//  Created by Daniel Grosman on 2017-11-09.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//

#import "SwipeViewController.h"

@interface SwipeViewController ()

@property (nonatomic) BOOL open;

@end

@implementation SwipeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat width = 400;
    CGFloat height = 50;
    CGRect frame = CGRectMake(CGRectGetMidX(self.view.bounds) -width/2, CGRectGetMidY(self.view.bounds)-height/2, width, height);
    
    UIView *brownView = [[UIView alloc] initWithFrame:(frame)];
    brownView.backgroundColor = [UIColor brownColor];
    brownView.clipsToBounds=YES;
    [self.view addSubview:brownView];
    
    CGFloat widthTwo = 400;
    CGFloat heightTwo = 50;
    CGRect frameTwo = CGRectMake(CGRectGetMidX(brownView.bounds) -widthTwo/2, CGRectGetMidY(brownView.bounds)-heightTwo/2, widthTwo, heightTwo);
    
    UIView *whiteView = [[UIView alloc] initWithFrame:(frameTwo)];
    whiteView.backgroundColor = [UIColor whiteColor];
    [brownView addSubview:whiteView];
    
    
    UISwipeGestureRecognizer *leftSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipe:)];
    [leftSwipe setDirection:UISwipeGestureRecognizerDirectionLeft];
    [whiteView addGestureRecognizer:leftSwipe];
    
    UISwipeGestureRecognizer *rightSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipe:)];
    [rightSwipe setDirection:UISwipeGestureRecognizerDirectionRight];
    [whiteView addGestureRecognizer:rightSwipe];
    
}


- (void) didSwipe: (UISwipeGestureRecognizer *) sender {
    switch (sender.direction) {
        case UISwipeGestureRecognizerDirectionLeft:
            sender.view.frame = CGRectMake(sender.view.frame.origin.x -120, sender.view.frame.origin.y, sender.view.frame.size.width, sender.view.frame.size.height);
            break;
        case UISwipeGestureRecognizerDirectionRight:
            sender.view.frame = CGRectMake(sender.view.frame.origin.x +120, sender.view.frame.origin.y, sender.view.frame.size.width, sender.view.frame.size.height);
            break;
    }
}



@end
