//
//  LeftViewButton.m
//  Medicare
//
//  Created by admin on 16/5/27.
//  Copyright © 2016年 medicare. All rights reserved.
//

#import "LeftViewButton.h"
#import "SDiPhoneVersion.h"

@implementation LeftViewButton

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    
    if ([SDiPhoneVersion deviceSize] == iPhone35inch) {
        
        return CGRectMake(5, 16, 25, 14);
        
    } else if ([SDiPhoneVersion deviceSize] == iPhone55inch) {
        
        return CGRectMake(15, 31, 30, 17);
        
    }
    
    return CGRectMake(10, 26, 25, 13);
    
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    
    if ([SDiPhoneVersion deviceSize] == iPhone35inch) {
        
        return CGRectMake(8, 2, 14, 14);
        
    } else if ([SDiPhoneVersion deviceSize] == iPhone55inch) {
        
        return CGRectMake(10, 2, 30, 30);
        
    }
    
    return CGRectMake(9, 2, 22, 22);
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
