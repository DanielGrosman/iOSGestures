//
//  TapViewController.m
//  Gestures
//
//  Created by Daniel Grosman on 2017-11-09.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//

#import "TapViewController.h"

@interface TapViewController ()

@end

@implementation TapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat width = 100;
    CGFloat height = 100;
    CGRect frame = CGRectMake(CGRectGetMidX(self.view.bounds) -width/2, CGRectGetMidY(self.view.bounds)-height/2, width, height);
    UIView *view = [[UIView alloc] initWithFrame:(frame)];
    view.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:view];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
    [view addGestureRecognizer:tapGesture];
}

- (void) viewTapped:(UITapGestureRecognizer *) sender {
    // the ternary operator here is equivalent to saying, if the sender's current background color is equal to purple, set it to orange, otherwise, set it to purple
    UIColor *color = [sender.view.backgroundColor isEqual: [UIColor purpleColor]] ? [UIColor orangeColor] : [UIColor purpleColor];
    
    sender.view.backgroundColor = color;
}

@end
