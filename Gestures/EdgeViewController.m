//
//  EdgeViewController.m
//  Gestures
//
//  Created by Daniel Grosman on 2017-11-09.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//

#import "EdgeViewController.h"

@interface EdgeViewController ()

@property (nonatomic) UIPanGestureRecognizer *panGesture;
@property (nonatomic) UIScreenEdgePanGestureRecognizer *screenEdgeGesture;
@property (nonatomic) UIView *greenView;
@property (nonatomic, assign) CGPoint greenViewLocation;

@end

@implementation EdgeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // create the UIView on the right hand side of the screen
    CGFloat width = 300;
    CGFloat height = 250;
    CGRect frame = CGRectMake(CGRectGetMidX(self.view.bounds) +190, CGRectGetMidY(self.view.bounds)-height/2, width, height);
    self.greenView = [[UIView alloc] initWithFrame:(frame)];
    self.greenView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.greenView];

// instantiate a screen edge pan gesture for the right hand side of the view
UIScreenEdgePanGestureRecognizer *screenEdgeGesture = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(didEdgePan:)];
screenEdgeGesture.edges = UIRectEdgeRight;
self.screenEdgeGesture = screenEdgeGesture;
[self.greenView addGestureRecognizer:screenEdgeGesture];

// instantiate a regular pan gesture (set it's default to state to not enabled)
UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(didPan:)];
self.panGesture = panGesture;
self.panGesture.enabled = NO;
[self.greenView addGestureRecognizer:panGesture];
}


// the edge pan method allows you to drag the green view by setting the sender's view.frame to wherever the current location of the view is. The method also calls the isGreenViewPastLimit method, and when the gesture is over, calls the snapFeature method
- (void) didEdgePan: (UIScreenEdgePanGestureRecognizer *) sender {
    CGPoint currentLocation = [sender locationInView:self.view];
    CGRect currentRect = CGRectMake(currentLocation.x, self.greenView.frame.origin.y, self.greenView.frame.size.width, self.greenView.frame.size.height);
    sender.view.frame = currentRect;
  self.greenViewLocation = [sender locationInView:self.view];
    [self isGreenViewPastLimit];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        [self snapFeature];
    }
}

// the didPan method does the same thing as the edge pan method. The difference is that the didPan gesture does not have be started from an edge of the screen
- (void) didPan: (UIScreenEdgePanGestureRecognizer *) sender {
    CGPoint currentLocation = [sender locationInView:self.view];
    CGRect currentRect = CGRectMake(currentLocation.x, self.greenView.frame.origin.y, self.greenView.frame.size.width, self.greenView.frame.size.height);
    sender.view.frame = currentRect;
    self.greenViewLocation = [sender locationInView:self.view];
    [self isGreenViewPastLimit];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        [self snapFeature];
    }
}

// checks if the greenView's x origin is past a certain point on the screen (375 points). If it is, the screenEdgeGesture is enabled. If the x origin is less than 150, the panGesture is enabled.
- (void) isGreenViewPastLimit {
    if (self.greenView.frame.origin.x >= 375 ){
        self.screenEdgeGesture.enabled = YES;
        self.panGesture.enabled = NO;
    }
    else if (self.greenView.frame.origin.x <=150)
    {
        self.panGesture.enabled = YES;
        self.screenEdgeGesture.enabled = NO;
    }
}


// if the x location (after the user is finished panning the greenView) is greater than 250, the frame goes back to it's original state. If the x location is less than 250, the box automatically goes to a location further to the left
-(void)snapFeature {
    if (self.greenViewLocation.x >= 250) {
        CGFloat width = 300;
        CGFloat height = 250;
        CGRect rightFrame = CGRectMake(CGRectGetMidX(self.view.bounds) +190, CGRectGetMidY(self.view.bounds)-height/2, width, height);
        self.greenView.frame = rightFrame;
        [self isGreenViewPastLimit];
        }
    else{
        CGFloat width = 300;
        CGFloat height = 250;
        CGRect leftFrame = CGRectMake(CGRectGetMidX(self.view.bounds) -90, CGRectGetMidY(self.view.bounds)-height/2, width, height);
        self.greenView.frame = leftFrame;
        [self isGreenViewPastLimit];
    }
}

@end
