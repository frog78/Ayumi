//
//  LeftButton.m
//  Medicare
//
//  Created by admin on 16/5/31.
//  Copyright © 2016年 medicare. All rights reserved.
//

#import "LeftButton.h"
static LeftButton *_lb = nil;

@implementation LeftButton


+ (LeftButton *)share {
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        _lb = [[self alloc] init];
    });
    return _lb;
}


//初始化
-(instancetype)init {
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 250, 0, 0);
    }
    return self;
}


//扩大button的响应面积
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    //increase touch area for control in all directions by 20
    CGFloat margin = 20.0;
    CGRect area = CGRectInset(self.bounds, -margin, -margin);
    return CGRectContainsPoint(area, point);
}



@end
