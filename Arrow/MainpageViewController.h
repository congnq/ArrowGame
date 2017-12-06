//
//  MainpageViewController.h
//  Arrow
//
//  Created by 宋 奎熹 on 15/9/22.
//  Copyright © 2015年 宋 奎熹. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface MainpageViewController : UIViewController

@property (nonatomic, weak) IBOutlet UIButton *gameButton;
@property (nonatomic, weak) IBOutlet UIButton *numberGameButton;
@property (nonatomic, weak) IBOutlet UIButton *hellGameButton;

@property (nonatomic, weak) IBOutlet UIButton *aboutButton;
@property (nonatomic, weak) IBOutlet UIButton *tutorialButton;
@property (nonatomic, weak) IBOutlet UIButton *settingsButton;
@property (nonatomic, weak) IBOutlet UIButton *soundButton;
@property (nonatomic, weak) IBOutlet UIButton *recordButton;

@property (nonatomic) AVAudioPlayer* avAudioPlayer;

@property (nonatomic) NSNotificationCenter *nc;

- (IBAction)tutorial;

- (IBAction)about;

- (IBAction)settings;

- (IBAction)startGame;

- (void)sendScore:(NSNotification*)sender;

- (IBAction)startNumberGame;

- (void)sendNumberScore:(NSNotification*)sender;

- (IBAction)startHellGame;

- (void)sendHellScore:(NSNotification*)sender;

- (void)playBackgroundMusic;

- (IBAction)muteOrActiveBGMusic;

@end
