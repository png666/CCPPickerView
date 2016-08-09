//
//  CCPPickerViewTwo.m
//  CCPPickerView
//
//  Created by CCP on 16/7/7.
//  Copyright © 2016年 CCP. All rights reserved.
//

#import "CCPPickerViewTwo.h"
#import "UIView+MTExtension.h"
#import "UIAlertView+XDExtension.h"

#define CCPWIDTH [UIScreen mainScreen].bounds.size.width
#define CCPHEIGHT [UIScreen mainScreen].bounds.size.height

@interface CCPPickerViewTwo ()<UIPickerViewDataSource,UIPickerViewDelegate>

@property (strong, nonatomic) NSMutableArray *dateArray;
@property (nonatomic,strong)UIPickerView *pickerViewLoanLine;
@property (nonatomic,strong)UIToolbar *toolBarTwo;
//组合view
@property (nonatomic,strong) UIView *containerView;

@property (copy, nonatomic) NSString *string1;
@property (copy, nonatomic) NSString *string2;
@property (assign, nonatomic)NSInteger index1;
@property (assign, nonatomic)NSInteger index2;

@property (copy,nonatomic)NSString *titleString;
@property (copy,nonatomic)NSString *leftString;
@property (copy,nonatomic)NSString *rightString;


@end


@implementation CCPPickerViewTwo

- (NSMutableArray *)dateArray {
    
    if (_dateArray == nil) {
        _dateArray = [NSMutableArray array];
        for (int i = 1; i < 13; i ++) {
            NSString *motnthDate = [NSString stringWithFormat:@"%d个月",i];
            [_dateArray addObject:motnthDate];
        }
        
        for (int i = 2; i < 31; i ++) {
            NSString *yearDate = [NSString stringWithFormat:@"%d年",i];
            [_dateArray addObject:yearDate];
        }
    }
    
    return _dateArray;
}


- (UIPickerView *)pickerViewLoanLine {
    
    if (_pickerViewLoanLine == nil) {
        _pickerViewLoanLine = [[UIPickerView alloc] init];
        _pickerViewLoanLine.backgroundColor=[UIColor whiteColor];
        _pickerViewLoanLine.delegate = self;
        _pickerViewLoanLine.dataSource = self;
        _pickerViewLoanLine.frame = CGRectMake(0, 40, CCPWIDTH, 216);
    }
    return _pickerViewLoanLine;
}

- (UIToolbar *)toolBarTwo {
    
    if (_toolBarTwo == nil) {
        
        _toolBarTwo = [self setToolbarStyle:self.titleString andCancel:self.leftString andSure:self.rightString];
    }
    
    return _toolBarTwo;
}

- (UIToolbar *)setToolbarStyle:(NSString *)titleString andCancel:(NSString *)cancelString andSure:(NSString *)sureString{
    
    UIToolbar *toolbar=[[UIToolbar alloc] init];
    toolbar.frame = CGRectMake(0, 0, CCPWIDTH, 40);
    
    UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CCPWIDTH , 40)];
    lable.backgroundColor =  [UIColor colorWithRed:42/255.0 green:115/255.0 blue:241/255.0 alpha:1.0]
;
    lable.text = titleString;
    lable.textAlignment = 1;
    lable.textColor = [UIColor whiteColor];
    lable.numberOfLines = 1;
    lable.font = [UIFont systemFontOfSize:18];
    [toolbar addSubview:lable];
    
    UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelBtn.backgroundColor = [UIColor clearColor];
    cancelBtn.frame = CGRectMake(0, 5, 40, 35);
    cancelBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    cancelBtn.layer.cornerRadius = 2;
    cancelBtn.layer.masksToBounds = YES;
    [cancelBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [cancelBtn setTitle:cancelString forState:UIControlStateNormal];
    [cancelBtn addTarget:self action:@selector(remove:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *chooseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    chooseBtn.backgroundColor = [UIColor clearColor];
    chooseBtn.frame = CGRectMake(0, 5, 40, 35);
    chooseBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    chooseBtn.layer.cornerRadius = 2;
    chooseBtn.layer.masksToBounds = YES;
    [chooseBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [chooseBtn setTitle:sureString forState:UIControlStateNormal];
    [chooseBtn addTarget:self action:@selector(doneItemClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftItem=[[UIBarButtonItem alloc] initWithCustomView:cancelBtn];
    
    UIBarButtonItem *centerSpace=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    centerSpace.width = 70;
    
    UIBarButtonItem *rightItem=[[UIBarButtonItem alloc] initWithCustomView:chooseBtn];
    
    toolbar.items=@[leftItem,centerSpace,rightItem];
    toolbar.backgroundColor = [UIColor greenColor];
    
    return toolbar;
}

- (UIView *)containerView {
    
    if (_containerView == nil) {
        
        _containerView = [[UIView alloc] initWithFrame:CGRectMake(0, CCPHEIGHT - 256, CCPWIDTH, 256)];
        _containerView.backgroundColor = [UIColor redColor];
        
        [_containerView addSubview:self.toolBarTwo];
        [_containerView addSubview:self.pickerViewLoanLine];
        
    }
    return _containerView;
    
}

-  (instancetype)initWithpickerViewWithCenterTitle:(NSString *)title andCancel:(NSString *)cancel andSure:(NSString *)sure {
    
    if (self = [super initWithFrame:[UIScreen mainScreen].bounds]) {
        self.string1 = @"1个月";
        self.string2 = @"1个月";
        self.titleString = title;
        self.leftString = cancel;
        self.rightString = sure;
        [self addSubview:self.containerView];
        UIWindow *currentWindows = [UIApplication sharedApplication].keyWindow;
        self.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.2];
        [currentWindows addSubview:self];
    }
    
    return self;
}

- (void)pickerVIewClickCancelBtnBlock:(clickCancelBtn)cancelBlock
                          sureBtClcik:(clickSureBtn)sureBlock {
    
    self.clickCancelBtn = cancelBlock;
    
    self.clickSureBtn = sureBlock;
    
}

//点击取消按钮
- (void)remove:(UIButton *) btn {
    
    if (self.clickCancelBtn) {
        
        self.clickCancelBtn();
        
    }
    [self dissMissView];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dissMissView];
}
- (void)dissMissView{
    
    [UIView animateWithDuration:0.3 animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
        self.containerView.frame = CGRectMake(0, CCPHEIGHT, CCPWIDTH, 256);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

//点击确定按钮
- (void)doneItemClick:(UIButton *) btn {
    
    NSString *leftString = nil;
    NSString *rightString = nil;
    NSString *leftAndRightString = nil;
 
    if (self.index1 > self.index2) {
        
        [UIAlertView alert3:@"请正确选择时间区间"];
        
    } else if (self.index1 == self.index2 ) {
        
        leftAndRightString = [NSString stringWithFormat:@"%@",self.string2];
        
        /**
         *  数据请求
         */
        NSUInteger a = 0;
        
        NSUInteger index = [self.dateArray indexOfObject:self.string2];
        
        if (index > 11) {
            
            a = (index - 10) *12;
            
        } else {
            
            a = index + 1;
        }
        NSString *maxStr = [NSString stringWithFormat:@"%lu",(unsigned long)a];
        
        leftString = rightString = maxStr;
        
    }else {
        
        leftAndRightString = [NSString stringWithFormat:@"%@~%@",self.string1,self.string2];
        
        NSUInteger a = 0;
        
        NSUInteger index1 = [self.dateArray indexOfObject:self.string1];
        
        if (index1 > 11) {
            
            a = (index1 - 10) *12;
            
        } else {
            
            a = index1 + 1;
        }
        NSString *minStr = [NSString stringWithFormat:@"%lu",(unsigned long)a];
        leftString = minStr;
        NSUInteger b = 0;
        
        NSUInteger index2 = [self.dateArray indexOfObject:self.string2];
        
        if (index2 > 11) {
            
            b = (index2 - 10) *12;
            
        } else {
            
            b = index2 + 1;
        }
        NSString *maxStr = [NSString stringWithFormat:@"%lu",(unsigned long)b];
        
        rightString = maxStr;
     
    }
    
    if (self.clickSureBtn) {
        
        self.clickSureBtn(leftString,rightString,leftAndRightString);
        
    }
    
    [self dissMissView];
}



#pragma pickerViewDelegate
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    return 3;
    
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    if (component == 0) {
        
        return self.dateArray.count;
        
    } else if (component == 1) {
        
        return 1;
        
    } else {
        
        return self.dateArray.count;
    }

}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    switch (component) {
        case 0:
            
            return  self.dateArray[row];
            
            break;
            
        case 1:
            
            return  @"~";
            
            break;
        case 2:
            
            return  self.dateArray[row];
            
            break;
            
        default:
            return nil;
    }

}

// 选中某一组中的某一行时调用
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    NSString *selStr = self.dateArray[row];

    switch(component) {
        case 0:
            
            self.string1 = selStr;
            
            self.index1 = [self.dateArray indexOfObject:selStr];
            
            if (self.index1 < self.index2) {
                
            } else {
                
                [self.pickerViewLoanLine selectRow:row inComponent:2 animated:YES];
                self.index2 = self.index1;
                
                self.string2 = self.string1;
            }
            
            break;
            
        case 2:
            
            self.string2 = selStr;
            
            self.index2 = [self.dateArray indexOfObject:selStr];
            
            if (self.index2 < self.index1) {
                
                [self.pickerViewLoanLine selectRow:self.index1 inComponent:2 animated:YES];
                
                self.string2 = self.dateArray[self.index1];
                
                self.index2 = self.index1;
                
            } else {
                
                self.string2 = self.dateArray[self.index2];
                
            }
            
        default:
            break;
    }

}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    
    UILabel* pickerLabel = (UILabel*)view;
    if (!pickerLabel){
        
        pickerLabel = [[UILabel alloc] init];
        pickerLabel.font = [UIFont systemFontOfSize:16];
        pickerLabel.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1.0];
        [pickerLabel setTextAlignment:NSTextAlignmentCenter];
        [pickerLabel setBackgroundColor:[UIColor clearColor]];
    }
    pickerLabel.text=[self pickerView:pickerView titleForRow:row forComponent:component];
    return pickerLabel;
}

@end
