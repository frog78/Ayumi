//
//  BaseViewController.h
//  Medicare
//
//  Created by admin on 16/6/20.
//  Copyright © 2016年 medicare. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeftViewController.h"
#import "LeftButton.h"

@interface BaseViewController : UIViewController<LeftViewDelegate>

@property (nonatomic, strong)LeftViewController *l;
@property (nonatomic, strong)LeftButton *leftButton;


@end
