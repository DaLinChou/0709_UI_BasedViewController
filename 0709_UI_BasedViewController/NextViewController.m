//
//  NextViewController.m
//  0709_UI_BasedViewController
//
//  Created by rimi on 15/7/9.
//  Copyright (c) 2015年 周林. All rights reserved.
//

#import "NextViewController.h"

// 枚举：表示空间tag值
enum {indicatorViewTag = 100, progressViewTag};

@interface NextViewController ()
- (void) initializeUserInterface;

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeUserInterface];
}


- (void) initializeUserInterface {
    UIButton * backButton = [UIButton buttonWithType:UIButtonTypeSystem];
    backButton.bounds = CGRectMake(0, 0, 60, 40);
    backButton.center = CGPointMake(40, 50);
    [backButton setTitle:@"返回" forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(respondsToButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
    
    /* UIActivityIndicatorView: 活动指示器*/
    UIActivityIndicatorView * indicatorView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    // 设置Center
    indicatorView.center = CGPointMake(CGRectGetMidX(self.view.bounds), 80);
    indicatorView.tag = indicatorViewTag;
    [self.view addSubview:indicatorView];
    
    // 菊花开转
    [indicatorView startAnimating];
    
    UISwitch * switchControl = [[UISwitch alloc]init];
    switchControl.bounds = CGRectMake(0, 0, 50, 40);
    switchControl.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMaxY(indicatorView.frame) + 40);
    // 设置边框颜色
    switchControl.tintColor = [UIColor blackColor];
    // 设置拇指颜色
    switchControl.thumbTintColor = [UIColor purpleColor];
    // 设置开关开启的颜色
    switchControl.onTintColor = [UIColor yellowColor];
    // 设置事件监听
    switchControl.on = YES;
    [switchControl addTarget:self action:@selector(respondsToControl:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:switchControl];
    
#pragma mark UISlider
    UISlider * slider = [[UISlider alloc]init];
    slider.bounds = CGRectMake(0, 0, CGRectGetWidth(self.view.bounds) - 40, 30);
    slider.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMaxY(switchControl.frame)+ 35);
    // 设置最小值
    slider.minimumValue = 0.0;
    slider.maximumValue = 1.0;
    slider.value = 0.5;
    
    // 设置偏小值指示色
    slider.minimumTrackTintColor = [UIColor darkGrayColor];
    slider.maximumTrackTintColor = [UIColor lightGrayColor];
    // 设置事件监听
    [slider addTarget:self action:@selector(respondsToControl:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];

#pragma mark UIProgressView
    UIProgressView * progressView = [[UIProgressView alloc]initWithProgressViewStyle:UIProgressViewStyleDefault];
    progressView.bounds = slider.bounds;
    progressView.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMaxY(slider.frame) + 35);
    progressView.progress = slider.value;
    progressView.tag = progressViewTag;
    [self.view addSubview:progressView];
    
#pragma mark 
    UISegmentedControl * segmentedControl = [[UISegmentedControl alloc]initWithItems:@[@"棕色", @"橙色", @"蓝色"]];
    segmentedControl.bounds = CGRectMake(0, 0, 220, 30);
    segmentedControl.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMaxY(progressView.frame) + 35);
    [segmentedControl addTarget:self action:@selector(respondsToControl:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:segmentedControl];
}

- (void) respondsToButton : (UIButton *) sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void) respondsToControl : (UIControl *) sender {
    
    if ([sender isKindOfClass:[UISwitch class]]) {
        
        UISwitch * switchControl = (UISwitch*)sender;
        UIActivityIndicatorView * indicatorView = (UIActivityIndicatorView *)[self.view viewWithTag:indicatorViewTag];
        switchControl.isOn ? [indicatorView startAnimating] : [indicatorView stopAnimating];
    }
    else if ([sender isKindOfClass:[UISlider class]]) {
        // 取到滑条控件
        UISlider * slider = (UISlider *) sender;
        NSLog(@"%.2f", slider.value);
        
        // 取到进度条控件
        UIProgressView * progressView = (UIProgressView *)[self.view viewWithTag:progressViewTag];
        progressView.progress = slider.value;
    }
    // 分段控件
    else if ([sender isKindOfClass:[UISegmentedControl class]]) {
        
        UISegmentedControl * segmentedControl = (UISegmentedControl *)sender;
        NSArray * color = @[[UIColor brownColor], [UIColor orangeColor], [UIColor blueColor]];
        self.view.backgroundColor = color[segmentedControl.selectedSegmentIndex];
    }
}
@end
