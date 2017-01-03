//
//  LeftViewController.h
//  Medicare
//
//  Created by admin on 16/5/27.
//  Copyright © 2016年 medicare. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeftViewButton.h"
#import "SDiPhoneVersion.h"

#define RGB(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define IMAGE(imageName) [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageName]]
#define kScreenHeight CGRectGetHeight([[UIScreen mainScreen] bounds])
#define kScreenWidth  CGRectGetWidth([[UIScreen mainScreen] bounds])


@protocol LeftViewDelegate <NSObject>

@required
- (void)itemClicked:(LeftViewButton *)sender last:(LeftViewButton *)last;

- (void)onShowStart;

- (void)onShowCompleted;

- (void)onHideCompleted;

@end

@interface LeftViewController : UIViewController

@property (nonatomic, weak)id<LeftViewDelegate>lvDelegate;

+ (LeftViewController *)share;

- (void)showView;

- (void)hideView;

- (void)showHidenBtn:(NSInteger)tag;

- (void)selectItem:(NSInteger)item;

- (void)clearSelected;

@end
