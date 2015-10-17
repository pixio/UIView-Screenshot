//
//  PXViewController.m
//  UIView-Screenshot
//
//  Created by Daniel Blakemore on 04/13/2015.
//  Copyright (c) 2014 Daniel Blakemore. All rights reserved.
//

#import "PXViewController.h"

#import <UIView-Screenshot/UIView+Screenshot.h>

@interface PXViewController ()

@end

@implementation PXViewController
{
    UIImageView * _inceptionView;
    
    UIButton * _screenshotButton;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    _inceptionView = [[UIImageView alloc] init];
    [[_inceptionView layer] setBorderWidth:1.0f];
    [[_inceptionView layer] setBorderColor:[[UIColor grayColor] CGColor]];
    [_inceptionView setBackgroundColor:[UIColor grayColor]];
    [_inceptionView setContentMode:UIViewContentModeScaleAspectFit];
    [_inceptionView setTranslatesAutoresizingMaskIntoConstraints:FALSE];
    [[self view] addSubview:_inceptionView];
    
    _screenshotButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_screenshotButton setTitle:@"Screenshot" forState:UIControlStateNormal];
    [_screenshotButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [_screenshotButton addTarget:self action:@selector(takeScreenshot) forControlEvents:UIControlEventTouchUpInside];
    [_screenshotButton setTranslatesAutoresizingMaskIntoConstraints:FALSE];
    [[self view] addSubview:_screenshotButton];
    
    NSDictionary * views = NSDictionaryOfVariableBindings(_inceptionView, _screenshotButton);
    NSDictionary * metrics = @{};
    
    [[self view] addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_inceptionView][_screenshotButton]|" options:0 metrics:metrics views:views]];
    [[self view] addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_screenshotButton]|" options:0 metrics:metrics views:views]];
    [[self view] addConstraint:[NSLayoutConstraint constraintWithItem:_inceptionView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:[self view] attribute:NSLayoutAttributeWidth multiplier:0.9f constant:0.0f]];
    [[self view] addConstraint:[NSLayoutConstraint constraintWithItem:_inceptionView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:[self view] attribute:NSLayoutAttributeHeight multiplier:0.9f constant:0.0f]];
    [[self view] addConstraint:[NSLayoutConstraint constraintWithItem:_inceptionView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:[self view] attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:0.0f]];
    [[self view] addConstraint:[NSLayoutConstraint constraintWithItem:_inceptionView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:[self view] attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:0.0f]];
}

- (void)takeScreenshot
{
    [_inceptionView setImage:[[self view] screenshot]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
