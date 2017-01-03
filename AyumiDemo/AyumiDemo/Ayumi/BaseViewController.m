//
//  BaseViewController.m
//  Medicare
//
//  Created by admin on 16/6/20.
//  Copyright © 2016年 medicare. All rights reserved.
//

#import "BaseViewController.h"


@interface BaseViewController () {
    
    CGRect hideFrame;
    CGRect showFrame;
    CGFloat pointY;
    
    __block float beginX;

}

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    if (!_leftButton) {
        _leftButton = [LeftButton share];
        
        if (_leftButton.isLeftSide) {
            
            if ([SDiPhoneVersion deviceSize] == iPhone35inch) {
                
                _leftButton.frame = CGRectMake(0, _leftButton.frame.origin.y, 18, 36);
                
            } else if ([SDiPhoneVersion deviceSize] == iPhone55inch) {
                
                _leftButton.frame = CGRectMake(0, _leftButton.frame.origin.y, 23, 46);
                
            } else {
                
                _leftButton.frame = CGRectMake(0, _leftButton.frame.origin.y, 20, 40);
                
            }
            
            [_leftButton setBackgroundImage:IMAGE(@"icon_left_menu_layout") forState:0];
            
        } else {
            
            if ([SDiPhoneVersion deviceSize] == iPhone35inch) {
                
                _leftButton.frame = CGRectMake(kScreenWidth - 18, _leftButton.frame.origin.y, 18, 36);
                
            } else if ([SDiPhoneVersion deviceSize] == iPhone55inch) {
                
                _leftButton.frame = CGRectMake(kScreenWidth - 23, _leftButton.frame.origin.y, 23, 46);
                
            }  else {
                
                _leftButton.frame = CGRectMake(kScreenWidth - 20, _leftButton.frame.origin.y, 20, 40);
            }
            
            [_leftButton setBackgroundImage:IMAGE(@"icon_right_menu_layout") forState:0];
        }
        
        _leftButton.layer.borderWidth = 0;
        
        
        [_leftButton setBackgroundImages:IMAGE(@"icon_left_menu_layout") right:IMAGE(@"icon_right_menu_layout")];
        
        [_leftButton addTarget:self action:@selector(leftButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [_leftButton addTarget:self action:@selector(leftButtonDown:) forControlEvents:UIControlEventTouchDown];
        _leftButton.hidden = YES;
        
//        __weak __typeof(self) weakself = self;
        
        _leftButton.dragDoneBlock = ^(RCDraggableButton *sender, BOOL isLeft) {
            
//            [weakself getLViewPosition:isLeft];
            
        };

    }
    
    if (!_l) {
        _l = [LeftViewController share];
        
        [self getLViewPosition:_leftButton.isLeftSide];

    }
    
    //添加手势收起键盘
    UITapGestureRecognizer *tableViewGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTouchInside)];
    tableViewGesture.numberOfTapsRequired = 1;
    tableViewGesture.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tableViewGesture];
    
    [self.navigationController.interactivePopGestureRecognizer addTarget:self action:@selector(handleGesture:)];
}



- (void)onShowStart {
    _l.view.frame = showFrame;
}

- (void)onShowCompleted {
    if (!self.leftButton.isHidden) {
        self.leftButton.hidden = YES;
    }
}

- (void)onHideCompleted {
    if (self.leftButton.isHidden) {
        self.l.view.hidden = YES;
        self.leftButton.hidden = NO;
    }
    self.l.view.frame = hideFrame;
}

- (void)leftButtonDown:(LeftButton *)sender {
    
    pointY = sender.frame.origin.y;
}



- (void)leftButtonClicked:(LeftButton *)sender {
    BOOL i = YES;
    BOOL x = YES;
    
    if (sender.frame.origin.y - pointY ==0) {
        x = NO;
    }
    
    if (_leftButton.frame.origin.x+40 == kScreenWidth && ([SDiPhoneVersion deviceVersion] == iPhone6S || [SDiPhoneVersion deviceVersion] == iPhone6SPlus)) {
        i = NO;
    }

    if (sender.isDragging && (i == YES && x==YES)) {
        return;
    }
    [self getLViewPosition:self.leftButton.isLeftSide];
    if (!sender.isHidden) {
        sender.hidden = YES;
        self.l.view.hidden = NO;
        
        [self.l showView];
    }
}

- (void)itemClicked:(LeftViewButton *)sender last:(LeftViewButton *)last {
    
    switch (sender.tag) {
    
        case 0:
        {
        
        }
            break;
        
        case 1:
        {
            
        }
            break;
            
        case 2:
        {
            
        }
            break;
            
        case 3:
        {
            
        }
            
            break;
            
        case 4:
        {
            
        }
            break;
            
        case 5:
        {
            
        }
            break;
            
        case 6:
        {
            
        }
            break;
            
        case 7:
        {
            
        }
            break;
            
        case 8:
        {
            
        }
            break;
            
        case 9:
        {
            
        }
            break;
            
        default:
        {
            
        }
            break;
    }
}

- (void)viewTouchInside {
    
    [self.l hideView];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    if (self.l.lvDelegate) {
        self.l.lvDelegate = nil;
        if (!self.leftButton.isHidden) {
            self.leftButton.hidden = YES;
        }
    }
    [self.navigationController.interactivePopGestureRecognizer removeTarget:self action:@selector(handleGesture:)];
    self.l.view.frame = hideFrame;
}

- (void)viewWillAppear:(BOOL)animated {
    if (!self.l.lvDelegate) {
        self.l.lvDelegate = self;
    }
    [self.navigationController.interactivePopGestureRecognizer addTarget:self action:@selector(handleGesture:)];
}

- (void)viewDidAppear:(BOOL)animated {
    if (!self.leftButton.isHidden) {
        self.l.view.frame = hideFrame;
    }
}

- (void)handleGesture:(UITapGestureRecognizer *)gestureRecognizer {
    if (!self.l.view.isHidden) {
        self.l.view.hidden = YES;
    }
    
    CGPoint a = [gestureRecognizer locationInView:[UIApplication sharedApplication].keyWindow];
    
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
        beginX = a.x;
    }
    
    if (gestureRecognizer.state == UIGestureRecognizerStateEnded) {
        if (a.x - beginX <= kScreenWidth / 2) {
            
        } else {
            
//            BaseViewController *b = self.navigationController.viewControllers[self.navigationController.viewControllers.count - 1];
            
        }
    }
}


- (void)getLViewPosition:(BOOL)isLeft {
    
    if (isLeft) {
        
        if ([SDiPhoneVersion deviceSize] == iPhone35inch) {
            
            showFrame = CGRectMake(0, 80, 40, 350);
            hideFrame = CGRectMake(0, 80, 0, 350);
            
        } else if ([SDiPhoneVersion deviceSize] == iPhone55inch) {
            
            showFrame = CGRectMake(0, 120, 60, 530);
            hideFrame = CGRectMake(0, 120, 0, 530);
            
        } else {
            
            showFrame = CGRectMake(0, 100, 50, 450);
            hideFrame = CGRectMake(0, 100, 0, 450);
        }
        
    } else {
        
        if ([SDiPhoneVersion deviceSize] == iPhone35inch) {
            
            showFrame = CGRectMake(kScreenWidth - 40, 80, 40, 350);
            hideFrame = CGRectMake(kScreenWidth - 40, 80, 0, 350);
            
        } else if ([SDiPhoneVersion deviceSize] == iPhone55inch) {
            
            showFrame = CGRectMake(kScreenWidth - 60, 120, 60, 530);
            hideFrame = CGRectMake(kScreenWidth - 60, 120, 0, 530);
            
        } else {
            
            showFrame = CGRectMake(kScreenWidth - 50, 100, 50, 450);
            hideFrame = CGRectMake(kScreenWidth - 50, 100, 0, 450);
        }
    }
     _l.view.frame = showFrame;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
