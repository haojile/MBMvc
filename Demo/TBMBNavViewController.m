//
//  TBMBNavViewController.m
//  MBMvc
//
//  Created by 黄 若慧 on 11/09/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TBMBNavViewController.h"
#import "TBMBBind.h"
#import "TBMBNavViewDO.h"
#import "TBMBNavView.h"
#import "TBMBDemoStep1ViewController.h"


@interface TBMBNavViewController ()
@property(nonatomic, strong) TBMBNavViewDO *viewDO;
@end

@implementation TBMBNavViewController

//当self.viewDO.demoStep的值改变时 触发的操作
TBMBWhenThisKeyPathChange(viewDO, demoStep)
{
    if (!isInit && new) {   //当初始化和new没有值时不响应
        TBMBDemoStep step = (TBMBDemoStep) [new intValue];
        UIViewController *controller = nil;
        switch (step) {

            case TBMB_DEMO_STEP01:
                controller = [[TBMBDemoStep1ViewController alloc] initWithNibName:nil bundle:nil];
                break;
            case TBMB_DEMO_END:
                break;
        }
        if (controller) {
            [self.navigationController pushViewController:controller animated:YES];
        }

    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.viewDO = [[TBMBNavViewDO alloc] init];
    }
    return self;
}

- (void)loadView {
    [super loadView];
    TBMBNavView *navView = [[TBMBNavView alloc] initWithFrame:self.view.frame withViewDO:self.viewDO];
    [self.view addSubview:navView];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

@end