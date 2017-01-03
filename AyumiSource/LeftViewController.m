//
//  LeftViewController.m
//  Medicare
//
//  Created by admin on 16/5/27.
//  Copyright © 2016年 medicare. All rights reserved.
//

#import "LeftViewController.h"


static LeftViewController *_lfVC = nil;

@interface LeftViewController () {
    
    int margin;
    NSMutableArray *bArray;
    LeftViewButton *lastSelected;
    
    int BUTTON_WIDTH;
    int VIEW_WIDTH;
}

@property (nonatomic, strong) LeftViewButton *infoButton;
@property (nonatomic, strong) LeftViewButton *adviceButton;
@property (nonatomic, strong) LeftViewButton *caseButton;
@property (nonatomic, strong) LeftViewButton *checkButton;
@property (nonatomic, strong) LeftViewButton *testButton;
@property (nonatomic, strong) LeftViewButton *ECGButton;
@property (nonatomic, strong) LeftViewButton *pathologyButton;
@property (nonatomic, strong) LeftViewButton *featureButton;


@end

@implementation LeftViewController

+ (LeftViewController *)share {
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        _lfVC = [[self alloc] init];
    });
    return _lfVC;
}

//初始化
-(instancetype)init {
    self = [super init];
    if (self) {
        if ([SDiPhoneVersion deviceSize] == iPhone35inch) {
            BUTTON_WIDTH = 30;
            VIEW_WIDTH = 40;
        }  else if ([SDiPhoneVersion deviceSize] == iPhone55inch) {
            
            BUTTON_WIDTH = 50;
            VIEW_WIDTH = 60;
            
        } else {
            BUTTON_WIDTH = 40;
            VIEW_WIDTH = 50;
        }
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    margin = (VIEW_WIDTH - BUTTON_WIDTH) / 2;
    bArray = [NSMutableArray arrayWithCapacity:0];
    [self initView];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}



- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
}

- (void)initView {
    
    if (!self.infoButton) {
        
        self.infoButton = [[LeftViewButton alloc] initWithFrame:CGRectMake(margin - BUTTON_WIDTH / 2, margin, BUTTON_WIDTH, BUTTON_WIDTH)];
        [self.infoButton setBackgroundImage:IMAGE(@"bg_sidemenu_unselect") forState:0];
        [self.infoButton setBackgroundImage:IMAGE(@"bg_sidemenu_select") forState:UIControlStateSelected];
        [self.infoButton setImage:IMAGE(@"icon_advice_unselect") forState:0];
        [self.infoButton setImage:IMAGE(@"icon_advice_select") forState:UIControlStateSelected];
        [self.infoButton setTitle:@"信息" forState:0];
        [self.infoButton setTitleColor:[UIColor grayColor] forState:0];
        [self.infoButton setTitleColor:RGB(60, 164, 241) forState:UIControlStateSelected];
        self.infoButton.layer.anchorPoint = CGPointMake(0, 0.5);
        self.infoButton.titleLabel.font = [UIFont systemFontOfSize:10];
        self.infoButton.tag = 0;
        [self.infoButton addTarget:self action:@selector(leftClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    if (!self.adviceButton) {
        
        self.adviceButton = [[LeftViewButton alloc] initWithFrame:CGRectMake(margin - BUTTON_WIDTH / 2, margin * 2 + BUTTON_WIDTH, BUTTON_WIDTH, BUTTON_WIDTH)];
        [self.adviceButton setBackgroundImage:IMAGE(@"bg_sidemenu_unselect") forState:0];
        [self.adviceButton setBackgroundImage:IMAGE(@"bg_sidemenu_select") forState:UIControlStateSelected];
        [self.adviceButton setImage:IMAGE(@"icon_advice_unselect") forState:0];
        [self.adviceButton setImage:IMAGE(@"icon_advice_select") forState:UIControlStateSelected];
        [self.adviceButton setTitle:@"信息" forState:0];
        [self.adviceButton setTitleColor:[UIColor grayColor] forState:0];
        [self.adviceButton setTitleColor:RGB(60, 164, 241) forState:UIControlStateSelected];
        self.adviceButton.layer.anchorPoint = CGPointMake(0, 0.5);
        self.adviceButton.titleLabel.font = [UIFont systemFontOfSize:10];
        self.adviceButton.tag = 1;
        [self.adviceButton addTarget:self action:@selector(leftClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    if (!self.caseButton) {
        
        self.caseButton = [[LeftViewButton alloc] initWithFrame:CGRectMake(margin - BUTTON_WIDTH / 2, margin * 3 + BUTTON_WIDTH * 2, BUTTON_WIDTH, BUTTON_WIDTH)];
        [self.caseButton setBackgroundImage:IMAGE(@"bg_sidemenu_unselect") forState:0];
        [self.caseButton setBackgroundImage:IMAGE(@"bg_sidemenu_select") forState:UIControlStateSelected];
        [self.caseButton setImage:IMAGE(@"icon_advice_unselect") forState:0];
        [self.caseButton setImage:IMAGE(@"icon_advice_select") forState:UIControlStateSelected];
        [self.caseButton setTitle:@"信息" forState:0];
        [self.caseButton setTitleColor:[UIColor grayColor] forState:0];
        [self.caseButton setTitleColor:RGB(60, 164, 241) forState:UIControlStateSelected];
        self.caseButton.layer.anchorPoint = CGPointMake(0, 0.5);
        self.caseButton.titleLabel.font = [UIFont systemFontOfSize:10];
        self.caseButton.tag = 2;
        [self.caseButton addTarget:self action:@selector(leftClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    if (!self.checkButton) {
        
        self.checkButton = [[LeftViewButton alloc] initWithFrame:CGRectMake(margin - BUTTON_WIDTH / 2, margin * 4 + BUTTON_WIDTH * 3, BUTTON_WIDTH, BUTTON_WIDTH)];
        [self.checkButton setBackgroundImage:IMAGE(@"bg_sidemenu_unselect") forState:0];
        [self.checkButton setBackgroundImage:IMAGE(@"bg_sidemenu_select") forState:UIControlStateSelected];
        [self.checkButton setImage:IMAGE(@"icon_advice_unselect") forState:0];
        [self.checkButton setImage:IMAGE(@"icon_advice_select") forState:UIControlStateSelected];
        [self.checkButton setTitle:@"信息" forState:0];
        [self.checkButton setTitleColor:[UIColor grayColor] forState:0];
        [self.checkButton setTitleColor:RGB(60, 164, 241) forState:UIControlStateSelected];
        self.checkButton.layer.anchorPoint = CGPointMake(0, 0.5);
        self.checkButton.titleLabel.font = [UIFont systemFontOfSize:10];
        self.checkButton.tag = 3;
        [self.checkButton addTarget:self action:@selector(leftClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    if (!self.testButton) {
        
        self.testButton = [[LeftViewButton alloc] initWithFrame:CGRectMake(margin - BUTTON_WIDTH / 2, margin * 5 + BUTTON_WIDTH * 4, BUTTON_WIDTH, BUTTON_WIDTH)];
        [self.testButton setBackgroundImage:IMAGE(@"bg_sidemenu_unselect") forState:0];
        [self.testButton setBackgroundImage:IMAGE(@"bg_sidemenu_select") forState:UIControlStateSelected];
        [self.testButton setImage:IMAGE(@"icon_advice_unselect") forState:0];
        [self.testButton setImage:IMAGE(@"icon_advice_select") forState:UIControlStateSelected];
        [self.testButton setTitle:@"信息" forState:0];
        [self.testButton setTitleColor:[UIColor grayColor] forState:0];
        [self.testButton setTitleColor:RGB(60, 164, 241) forState:UIControlStateSelected];
        self.testButton.layer.anchorPoint = CGPointMake(0, 0.5);
        self.testButton.titleLabel.font = [UIFont systemFontOfSize:10];
        self.testButton.tag = 4;
        [self.testButton addTarget:self action:@selector(leftClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    if (!self.ECGButton) {
        
        self.self.ECGButton = [[LeftViewButton alloc] initWithFrame:CGRectMake(margin - BUTTON_WIDTH / 2, margin * 6 + BUTTON_WIDTH * 5, BUTTON_WIDTH, BUTTON_WIDTH)];
        [self.ECGButton setBackgroundImage:IMAGE(@"bg_sidemenu_unselect") forState:0];
        [self.ECGButton setBackgroundImage:IMAGE(@"bg_sidemenu_select") forState:UIControlStateSelected];
        [self.ECGButton setImage:IMAGE(@"icon_advice_unselect") forState:0];
        [self.ECGButton setImage:IMAGE(@"icon_advice_select") forState:UIControlStateSelected];
        [self.ECGButton setTitle:@"信息" forState:0];
        [self.ECGButton setTitleColor:[UIColor grayColor] forState:0];
        [self.ECGButton setTitleColor:RGB(60, 164, 241) forState:UIControlStateSelected];
        self.ECGButton.layer.anchorPoint = CGPointMake(0, 0.5);
        self.ECGButton.titleLabel.font = [UIFont systemFontOfSize:10];
        self.ECGButton.tag = 5;
        [self.ECGButton addTarget:self action:@selector(leftClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    if (!self.pathologyButton) {
        
        self.pathologyButton = [[LeftViewButton alloc] initWithFrame:CGRectMake(margin - BUTTON_WIDTH / 2, margin * 7 + BUTTON_WIDTH * 6, BUTTON_WIDTH, BUTTON_WIDTH)];
        [self.pathologyButton setBackgroundImage:IMAGE(@"bg_sidemenu_unselect") forState:0];
        [self.pathologyButton setBackgroundImage:IMAGE(@"bg_sidemenu_select") forState:UIControlStateSelected];
        [self.pathologyButton setImage:IMAGE(@"icon_advice_unselect") forState:0];
        [self.pathologyButton setImage:IMAGE(@"icon_advice_select") forState:UIControlStateSelected];
        [self.pathologyButton setTitle:@"信息" forState:0];
        [self.pathologyButton setTitleColor:[UIColor grayColor] forState:0];
        [self.pathologyButton setTitleColor:RGB(60, 164, 241) forState:UIControlStateSelected];
        self.pathologyButton.layer.anchorPoint = CGPointMake(0, 0.5);
        self.pathologyButton.titleLabel.font = [UIFont systemFontOfSize:10];
        self.pathologyButton.tag = 6;
        [self.pathologyButton addTarget:self action:@selector(leftClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    if (!self.featureButton) {
        
        self.featureButton = [[LeftViewButton alloc] initWithFrame:CGRectMake(margin - BUTTON_WIDTH / 2, margin * 8 + BUTTON_WIDTH * 7, BUTTON_WIDTH, BUTTON_WIDTH)];
        [self.featureButton setBackgroundImage:IMAGE(@"bg_sidemenu_unselect") forState:0];
        [self.featureButton setBackgroundImage:IMAGE(@"bg_sidemenu_select") forState:UIControlStateSelected];
        [self.featureButton setImage:IMAGE(@"icon_advice_unselect") forState:0];
        [self.featureButton setImage:IMAGE(@"icon_advice_select") forState:UIControlStateSelected];
        [self.featureButton setTitle:@"信息" forState:0];
        [self.featureButton setTitleColor:[UIColor grayColor] forState:0];
        [self.featureButton setTitleColor:RGB(60, 164, 241) forState:UIControlStateSelected];
        self.featureButton.layer.anchorPoint = CGPointMake(0, 0.5);
        self.featureButton.titleLabel.font = [UIFont systemFontOfSize:10];
        self.featureButton.tag = 7;
        [self.featureButton addTarget:self action:@selector(leftClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    

    [bArray addObject:self.infoButton];
    [bArray addObject:self.adviceButton];
    [bArray addObject:self.caseButton];
    [bArray addObject:self.checkButton];
    [bArray addObject:self.testButton];
    [bArray addObject:self.ECGButton];
    [bArray addObject:self.pathologyButton];
    [bArray addObject:self.featureButton];
    
    
    [self.view addSubview:self.infoButton];
    [self.view addSubview:self.adviceButton];
    [self.view addSubview:self.caseButton];
    [self.view addSubview:self.checkButton];
    [self.view addSubview:self.testButton];
    [self.view addSubview:self.ECGButton];
    [self.view addSubview:self.pathologyButton];
    [self.view addSubview:self.featureButton];
}

- (void)leftClicked:(LeftViewButton *)sender {
    
    if (sender.tag == lastSelected.tag) {
        if (!sender.isSelected) {
            [sender setSelected:YES];
        }
        [self hideView];
        return;
    }
    
    [sender setSelected:YES];
    
    if (self.lvDelegate) {
        [self.lvDelegate itemClicked:sender last:lastSelected];
    }
    
    [self hideView];
    if (lastSelected) {
        [lastSelected setSelected:NO];
    }
    
    lastSelected = sender;
}


- (void)showView {
    
    if (self.lvDelegate) {
        [self.lvDelegate onShowStart];
    }
    
    for (int i = 0; i < bArray.count; i ++) {
        
        UIButton *b = bArray[i];
        CATransform3D rotate1 = CATransform3DMakeRotation(- M_PI / 2, 0, 1, 0);
        
        b.layer.transform = rotate1;
        b.alpha = 0;
    }
    
    for (int i = 0; i < bArray.count; i ++) {
        [self performSelector:@selector(show:) withObject:[NSNumber numberWithInt:i] afterDelay:i * 0.05];
    }
    
}

- (void)hideView {
    
    for (int i = 0; i < bArray.count; i ++) {
        [self performSelector:@selector(hide:) withObject:[NSNumber numberWithInt:i] afterDelay:i * 0.08];
    }
}

- (void)hide:(NSNumber *)index {
    
    UIButton *b = bArray[[index intValue]];
    
    [UIView animateWithDuration:0.5 animations:^{
        
        
        CATransform3D rotate = CATransform3DMakeRotation(- M_PI / 2, 0, 1, 0);
        
        b.layer.transform = rotate;

        b.alpha = 0;
        
    } completion:^(BOOL finished) {
        
        b.hidden = YES;
        
        if ([index intValue] == bArray.count - 1) {
            [self.lvDelegate onHideCompleted];
        }
        
    }];
}

- (void)show:(NSNumber *)index {
    
    UIButton *b = bArray[[index intValue]];
    b.hidden = NO;
    
    [UIView animateWithDuration:0.5 animations:^{
        
        CATransform3D rotate = CATransform3DMakeRotation(0, 0, 1, 0);
        b.layer.transform = rotate;

        b.alpha = 1;
        
    } completion:^(BOOL finished) {
        
        if ([index intValue] == bArray.count - 1) {
            [self.lvDelegate onShowCompleted];
        }
        
    }];
}

- (void)showHidenBtn:(NSInteger)tag {
    
    for (LeftViewButton *btn in bArray) {
        
        if (btn.isHidden) {
            btn.hidden = NO;
            btn.alpha = 1;
            CATransform3D rotate = CATransform3DMakeRotation(0, 0, 1, 0);
            btn.layer.transform = rotate;

        }
        if (btn.tag == tag) {
            [btn setSelected:YES];
            lastSelected = btn;
        }
    }
}


- (void)selectItem:(NSInteger)item {
    
    [self clearSelected];
    LeftViewButton *btn = [self getButtonWithTag:item];
    
    if (!btn.isSelected) {
        [btn setSelected:YES];
        lastSelected = btn;
    }
    
}

- (LeftViewButton *)getButtonWithTag:(NSInteger)tag {
    switch (tag) {
        case 0:
            return _infoButton;
            break;
        case 1:
            return _adviceButton;
            break;
        case 2:
            return _caseButton;
            break;
        case 3:
            return _checkButton;
            break;
        case 4:
            return _testButton;
            break;
        case 5:
            return _ECGButton;
            break;
        case 6:
            return _pathologyButton;
            break;
        default:
            return _featureButton;
            break;
    }
}

- (void)clearSelected {
    for (LeftViewButton *btn in bArray) {
        
        if (btn.isSelected) {
            
            [btn setSelected:NO];
        }
        
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
