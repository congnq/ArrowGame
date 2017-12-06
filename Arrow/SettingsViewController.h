//
//  SettingsViewController.h
//  Arrow
//
//  Created by 宋 奎熹 on 15/9/30.
//  Copyright © 2015年 宋 奎熹. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController

@property (nonatomic, weak) IBOutlet UIButton *backButton;

@property (nonatomic, weak) IBOutlet UILabel *curDifficulty;

@property (nonatomic, weak) IBOutlet UIStepper *stepper;

@property (nonatomic) NSNumber *cd;

@end
