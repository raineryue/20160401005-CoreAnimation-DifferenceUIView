//
//  ViewController.m
//  20160401005-CoreAnimation-DifferenceUIView
//
//  Created by Rainer on 16/4/1.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *redViwe;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    CABasicAnimation *basicAnimation = [CABasicAnimation animation];
//    
//    basicAnimation.keyPath = @"position";
//    basicAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(160, 500)];
//    // 注意：取消反弹效果必须要放在图层添加动画之前
//    basicAnimation.removedOnCompletion = NO;
//    basicAnimation.fillMode = kCAFillModeForwards;
//    basicAnimation.delegate = self;
//    
//    [self.redViwe.layer addAnimation:basicAnimation forKey:nil];
    
    // 小结：如果以后需要做动画时，不需要与用户交互通常用核心动画（如：转场）
    //      UIView动画必须通过修改属性的真实值才会有动画效果
    
    [UIView animateWithDuration:0.25 animations:^{
        self.redViwe.transform = CGAffineTransformMakeTranslation(160, 500);
    } completion:^(BOOL finished) {
        // 这里可以证明：UIView动画可以真实改编图层的属性值
        NSLog(@"%@", NSStringFromCGPoint(self.redViwe.layer.position));
    }];
}

/**
 *  动画完成时调用的代理方法
 */
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    // 这里可以证明：核心动画一切都是假象，并不会真实改变图层的属性值
    NSLog(@"%@", NSStringFromCGPoint(self.redViwe.layer.position));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
