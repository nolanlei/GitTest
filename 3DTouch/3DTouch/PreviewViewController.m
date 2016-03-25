//
//  PreviewViewController.m
//  3DTouch
//
//  Created by xalo on 16/1/21.
//  Copyright © 2016年 LeiGaoWei. All rights reserved.
//

#import "PreviewViewController.h"

@interface PreviewViewController ()

@end

@implementation PreviewViewController


- (void)dismissMe{
    // dismiss this view controller
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor orangeColor];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissMe)];
    [self.view addGestureRecognizer:tap];
    
    
    
    [self previewActionItems];
    
    
    


    
    
//    self.previewActionItems
    // Do any additional setup after loading the view.
}


- (NSArray<id<UIPreviewActionItem>> *)previewActionItems {
    UIPreviewAction *previewAction = [UIPreviewAction actionWithTitle:@"previewAction" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"previewAction被触发了");
    }];
    NSArray *actions = @[previewAction];
    return actions;
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
