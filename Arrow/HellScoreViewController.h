//
//  HellScoreViewController.h
//  Arrow
//
//  Created by 宋 奎熹 on 15/10/29.
//  Copyright © 2015年 宋 奎熹. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HellScoreViewController : UIViewController

@property (nonatomic) int thisScore;

@property (nonatomic, weak) IBOutlet UILabel *scoreLabel;
@property (nonatomic, weak) IBOutlet UILabel *highScoreLabel;

@property (nonatomic, weak) IBOutlet UIButton *submitButton;

@end
