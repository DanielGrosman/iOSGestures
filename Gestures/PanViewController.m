//
//  PanViewController.m
//  Gestures
//
//  Created by Daniel Grosman on 2017-11-09.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//

#import "PanViewController.h"

@interface PanViewController ()

@end

@implementation PanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)redViewPanned:(UIPanGestureRecognizer *)sender {

// This is one method to be able to pan the red view across the screen
//    CGPoint location = [sender locationInView:self.view];
//    sender.view.center = location;

// This uses the translation method to be able to pan the red view across the screen
    CGPoint translationInView = [sender translationInView:self.view];
    CGPoint oldCenter = sender.view.center;
    CGPoint newCenter = CGPointMake(oldCenter.x + translationInView.x, oldCenter.y + translationInView.y);
    sender.view.center = newCenter;
    [sender setTranslation:CGPointZero inView:self.view];
}

@end
