//
//  CCPPickerView.h
//  CCPPickerView
//
//  Created by CCP on 16/7/7.
//  Copyright © 2016年 CCP. All rights reserved.
//

#import "UIAlertView+XDExtension.h"

@implementation UIAlertView (XDExtension)

+ (void) alert:(NSString *) message{
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:message delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil];
    [alert show];
}

+ (void) alert2:(NSString *) message{
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:message delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}

+ (void)alert3:(NSString *)message {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:message delegate:self cancelButtonTitle:nil otherButtonTitles:nil];
    
    [alert show];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [alert dismissWithClickedButtonIndex:0 animated:YES];
        
    });
    
}

@end
