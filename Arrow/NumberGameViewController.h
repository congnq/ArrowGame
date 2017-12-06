//
//  NumberGameViewController.h
//  Arrow
//
//  Created by 宋 奎熹 on 15/9/24.
//  Copyright © 2015年 宋 奎熹. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>

@interface NumberGameViewController : UIViewController

@property(retain, nonatomic) UIButton *btn;

@property (nonatomic, weak) IBOutlet UILabel *scoreLabel;
@property (nonatomic, weak) IBOutlet UILabel *timerLabel;

@property (readwrite, weak) IBOutlet UIButton *upButton;
@property (nonatomic, weak) IBOutlet UIButton *downButton;
@property (nonatomic, weak) IBOutlet UIButton *leftButton;
@property (nonatomic, weak) IBOutlet UIButton *rightButton;

@property (nonatomic, weak) IBOutlet UIButton *backButton;

@property (nonatomic) NSMutableArray *arrowNumbers;
@property (nonatomic) NSMutableArray *pressedNumbers;
@property (nonatomic) NSString *arrowNumberLabel;
@property (nonatomic) NSString *pressedNumberLabel;
@property (nonatomic) NSNumber *scoreNumber;

@property (nonatomic) int secondsCountDown;
@property (nonatomic) int counter;
@property (nonatomic) int score;

@property (nonatomic) int tempTime;

@property (nonatomic, strong) IBOutletCollection(UIImageView) NSArray *arrows;

@property (nonatomic) NSTimer *countDownTimer;
@property (nonatomic) AVAudioPlayer *player;

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil;

- (void)timeFireMethod;

- (void)fail;

- (void)start;

- (IBAction) buttonPressed:(id)sender;

- (IBAction)goBack;

- (void)continueTimer;

- (void)showOkayCancelAlert;

- (void)viewDidLoad;

- (void)viewWillAppear:(BOOL)animated;

@end
