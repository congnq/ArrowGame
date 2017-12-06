//
//  NumberScoreViewController.h
//  Arrow
//
//  Created by 宋 奎熹 on 15/9/24.
//  Copyright © 2015年 宋 奎熹. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NumberScoreViewController : UIViewController

@property (nonatomic) int thisScore;

@property (nonatomic, weak) IBOutlet UILabel *scoreLabel;
@property (nonatomic, weak) IBOutlet UILabel *highScoreLabel;

@property (nonatomic, weak) IBOutlet UIButton *submitButton;

@end
