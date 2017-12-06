//
//  HellGameViewController.h
//  Arrow
//
//  Created by 宋 奎熹 on 15/10/29.
//  Copyright © 2015年 宋 奎熹. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface HellGameViewController : UIViewController

@property(retain, nonatomic) UIButton *btn;

@property (nonatomic, weak) IBOutlet UILabel *scoreLabel;
@property (nonatomic, weak) IBOutlet UILabel *timerLabel;
@property (nonatomic, weak) IBOutlet UILabel *lifeLabel;

@property (readwrite, weak) IBOutlet UIButton *upButton;
@property (nonatomic, weak) IBOutlet UIButton *downButton;
@property (nonatomic, weak) IBOutlet UIButton *leftButton;
@property (nonatomic, weak) IBOutlet UIButton *rightButton;
@property (readwrite, weak) IBOutlet UIButton *LUButton;
@property (nonatomic, weak) IBOutlet UIButton *LDButton;
@property (nonatomic, weak) IBOutlet UIButton *RUButton;
@property (nonatomic, weak) IBOutlet UIButton *RDButton;

@property (nonatomic) NSMutableArray *arrowNumbers;
@property (nonatomic) NSMutableArray *pressedNumbers;

@property (nonatomic) NSNumber *scoreNumber;
@property (nonatomic) NSNumber *lifeNumber;

@property (nonatomic) int level;
@property (nonatomic) int secondsCountDown;
@property (nonatomic) int counter;
@property (nonatomic) int counterForLife;
@property (nonatomic) int score;
@property (nonatomic) int life;

@property (nonatomic, strong) IBOutletCollection(UIImageView) NSArray *oddArrows;
@property (nonatomic, strong) IBOutletCollection(UIImageView) NSArray *evenArrows;

@property (nonatomic) NSTimer *countDownTimer;
@property (nonatomic) AVAudioPlayer *player;

- (instancetype)initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil;

- (void)timeFireMethod;

- (void)fail;

- (void)start;

- (void)lifeDecrease;

- (IBAction) buttonPressed:(id)sender;

- (void)viewDidLoad;

- (void)viewWillAppear:(BOOL)animated;

@end
