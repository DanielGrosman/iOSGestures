//
//  EdgeViewController.m
//  Gestures
//
//  Created by Daniel Grosman on 2017-11-09.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//

#import "EdgeViewController.h"

@interface EdgeViewController ()

@property (nonatomic) BOOL open;

@end

@implementation EdgeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    CGFloat width = 300;
    CGFloat height = 250;
    CGRect frame = CGRectMake(CGRectGetMidX(self.view.bounds) +190, CGRectGetMidY(self.view.bounds)-height/2, width, height);
    UIView *view = [[UIView alloc] initWithFrame:(frame)];
    view.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view];
    
    
    UIScreenEdgePanGestureRecognizer *edgePan = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(didEdgePan:)];
    [view addGestureRecognizer:edgePan];
    
    UIPanGestureRecognizer *regPan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(didEdgePan:)];
    [view addGestureRecognizer:regPan];
                                    
}

-(void)didEdgePan:(UIScreenEdgePanGestureRecognizer *) sender {
    
}


@end
