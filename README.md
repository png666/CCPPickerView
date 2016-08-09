# CCPPickerView

a.解决的需求

0.通过对PickerView的封装完成金额选择与时间选择

1.左边选择的金额或者月份不能大于右侧选择的金额或者月份,并且进行联动.

3.在确定的回调中将选择的数据(左侧的数据,右侧的数据以及拼接完成的数据进行返回)

4.注意金额按万为单位返回,时间按月份为单位返回.

b.效果图 

![Image text](https://github.com/IMCCP/CCPPickerView/blob/master/CCPPickerView/Image/20160712220535022.gif)

c.使用示例

- (IBAction)clickIt:(UIButton *)sender {
    
    CCPPickerView *pickerView = [[CCPPickerView alloc] initWithpickerViewWithCenterTitle:@"选择金额" andCancel:@"取消" andSure:@"确定"];
    
    [pickerView pickerVIewClickCancelBtnBlock:^{
        
        NSLog(@"取消");
        
    } sureBtClcik:^(NSString *leftString, NSString *rightString, NSString *leftAndRightString) {
        
        NSLog(@"%@=======%@=======%@",leftString,rightString,leftAndRightString);
        
    }];
 }

[博客地址:http://blog.csdn.net/aoxiangccp](http://blog.csdn.net/aoxiangccp) 
