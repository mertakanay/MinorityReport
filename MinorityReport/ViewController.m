//
//  ViewController.m
//  MinorityReport
//
//  Created by Mert Akanay on 12.03.2015.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *theFutureLabel;
@property (weak, nonatomic) IBOutlet UILabel *thePrecogLabel;
@property CGPoint originalFutureLabelCenter;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.originalFutureLabelCenter = self.theFutureLabel.center;
}

- (IBAction)doDrag:(UIPanGestureRecognizer *)sender
{
    if (sender.state == UIGestureRecognizerStateEnded) {
        [UIView animateWithDuration:5 animations:^{
            self.theFutureLabel.center = self.originalFutureLabelCenter;
            self.theFutureLabel.alpha = 0;
        }completion:^(BOOL finished) {
            //bu bölüm ve altındaki kod animasyon tamamlandıktan sonra ne gerçekleştiğini anlatıyor. Bu kodda 5 saniye sonra yazı geri geliyor.
            [UIView animateWithDuration:5 animations:^{
                self.theFutureLabel.alpha = 1;
            }];

        }];

    }else{
        CGPoint point = [sender locationInView:self.view];
        self.theFutureLabel.center = point;

        if (CGRectContainsPoint(self.thePrecogLabel.frame, point))
        {
            self.theFutureLabel.text = @"It changed to Yay!";
            self.theFutureLabel.backgroundColor = [UIColor blackColor];
            self.theFutureLabel.textColor = [UIColor whiteColor];
            [self.theFutureLabel sizeToFit];
        }
    }
}


@end
