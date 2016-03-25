//
//  ViewController.m
//  3DTouch
//
//  Created by xalo on 16/1/21.
//  Copyright © 2016年 LeiGaoWei. All rights reserved.
//

#import "ViewController.h"
#import "PreviewViewController.h"

@interface ViewController ()<UIViewControllerPreviewingDelegate>

@end

@implementation ViewController

- (void)check3DTouch {
    if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable) {
        //  第一步：Registers a view controller to participate with 3D Touch preview (peek) and commit (pop).
        //  Delegate 和 sourceView 解释说明
        //  The delegate object mediates the presentation of views from the preview (peek) view controller and the commit (pop) view controller. In practice, these two are typically the same view controller. The delegate performs this mediation through your implementation of the methods of the UIViewControllerPreviewingDelegate protocol.
        //  The view, in the view hierarchy of the receiver of this method call, that invokes a preview when pressed by the user.
        //  When lightly pressed, the source view remains visually sharp while surrounding content blurs. When pressed more deeply, the system calls the previewingContext:viewControllerForLocation: method in your delegate object, which presents the preview (peek) view from another view controller.
        [self registerForPreviewingWithDelegate:self sourceView:self.view];
        NSLog(@"3DTouch有效");
    } else {
        NSLog(@"3DTouch无效");
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor yellowColor];
    [self check3DTouch];


}

#pragma mark UIViewControllerPreviewingDelegate
//  Implement the methods of this protocol to respond, with a preview view controller and a commit view controller, to the user pressing a view object on the screen of a device that supports 3D Touch
- (nullable UIViewController *)previewingContext:(id <UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location {
    PreviewViewController *previewVC = [[PreviewViewController alloc] init];
    previewVC.view.backgroundColor = [UIColor redColor];
    previewVC.preferredContentSize = CGSizeMake(0.0f, 300.0f);
    CGRect rect = CGRectMake(10, location.y - 10, self.view.frame.size.width - 20,20);
    previewingContext.sourceRect = rect;
    return previewVC;
}
- (void)previewingContext:(id <UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit {
    [self showViewController:viewControllerToCommit sender:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
