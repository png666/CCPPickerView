//
//  ViewController.m
//  CCPPickerView
//
//  Created by C CP on 16/7/7.
//  Copyright © 2016年 C CP. All rights reserved.
//

#import "ViewController.h"
#import "CCPPickerView.h"
#import "CCPPickerViewTwo.h"
#import "UIView+MTExtension.h"
#define CCPWIDTH [UIScreen mainScreen].bounds.size.width
#define CCPHEIGHT [UIScreen mainScreen].bounds.size.height
@interface ViewController ()
@property (weak,nonatomic) UIView *oneView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)clickIt:(UIButton *)sender {
    
    CCPPickerView *pickerView = [[CCPPickerView alloc] initWithpickerViewWithCenterTitle:@"选择金额" andCancel:@"取消" andSure:@"确定"];
    
    [pickerView pickerVIewClickCancelBtnBlock:^{
        
        NSLog(@"取消");
        
    } sureBtClcik:^(NSString *leftString, NSString *rightString, NSString *leftAndRightString) {
        
        NSLog(@"%@=======%@=======%@",leftString,rightString,leftAndRightString);
        
    }];
    
}

- (IBAction)clickItTwo:(UIButton *)sender {
    
    CCPPickerViewTwo *pickerViewTwo = [[CCPPickerViewTwo alloc] initWithpickerViewWithCenterTitle:@"选择时间" andCancel:@"取消" andSure:@"确定"];
    
    [pickerViewTwo pickerVIewClickCancelBtnBlock:^{
        
        NSLog(@"取消");
        
    } sureBtClcik:^(NSString *leftString, NSString *rightString, NSString *leftAndRightString) {
        
        NSLog(@"%@=======%@=======%@",leftString,rightString,leftAndRightString);
        
    }];
    
}

@end
