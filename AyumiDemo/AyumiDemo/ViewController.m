//
//  ViewController.m
//  AyumiDemo
//
//  Created by admin on 2017/1/3.
//
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    [[UIApplication sharedApplication].keyWindow addSubview:self.l.view];
    [[UIApplication sharedApplication].keyWindow addSubview:self.leftButton];
    
    if (self.l.view.isHidden) {
        self.l.view.hidden = NO;
    }
    
    [self.l showHidenBtn:1];
    
    if (!self.leftButton.isHidden) {
        self.leftButton.hidden = YES;
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
