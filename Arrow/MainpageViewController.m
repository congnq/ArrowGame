//
//  MainpageViewController.m
//  Arrow
//
//  Created by 宋 奎熹 on 15/9/22.
//  Copyright © 2015年 宋 奎熹. All rights reserved.
//

/*
 * Classic -- Game
 * Arcade --- Number
 * Report --- About
 */

#import "MainpageViewController.h"
#import "GameViewController.h"
#import "ScoreViewController.h"
#import "NumberGameViewController.h"
#import "NumberScoreViewController.h"
#import "HellGameViewController.h"
#import "HellScoreViewController.h"
#import "AboutViewController.h"
#import "TutorialViewController.h"
#import "SettingsViewController.h"
#import "RecordViewController.h"

@interface MainpageViewController ()

@end

@implementation MainpageViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    _nc = [NSNotificationCenter defaultCenter];
    return self;
}

- (IBAction)about
{
    AboutViewController *aboutViewController = [[AboutViewController alloc] init];
    [self presentViewController:aboutViewController
                       animated:YES
                     completion:nil];
}

- (IBAction)tutorial
{
    TutorialViewController *tutorialViewController = [[TutorialViewController alloc] init];
    [self presentViewController:tutorialViewController
                       animated:YES
                     completion:nil];
}

- (IBAction)settings
{
    SettingsViewController *settingsViewController = [[SettingsViewController alloc] init];
    [self presentViewController:settingsViewController
                       animated:YES
                     completion:nil];
}

- (IBAction)record
{
    RecordViewController *recordViewController = [[RecordViewController alloc] init];
    [self presentViewController:recordViewController
                       animated:YES
                     completion:nil];
}

//Classic
- (IBAction)startGame
{
    GameViewController *gameViewController = [[GameViewController alloc] init];
    [self presentViewController:gameViewController
                       animated:YES
                     completion:nil];
}

- (void)sendScore:(NSNotification*)sender
{
    NSString *getScore = [[sender userInfo] valueForKey:@"score"];
    ScoreViewController *scoreViewController = [[ScoreViewController alloc] init];
    scoreViewController.thisScore = getScore.intValue;
    [self presentViewController:scoreViewController
                       animated:YES
                     completion:nil];
}

//Arcade
- (IBAction)startNumberGame
{
    NumberGameViewController *numberGameViewController = [[NumberGameViewController alloc] init];
    [self presentViewController:numberGameViewController
                       animated:YES
                     completion:nil];
}

- (void)sendNumberScore:(NSNotification*)sender
{
    NSString *getScore = [[sender userInfo] valueForKey:@"numberScore"];
    NumberScoreViewController *numberScoreViewController = [[NumberScoreViewController alloc] init];
    numberScoreViewController.thisScore = getScore.intValue;
    [self presentViewController:numberScoreViewController
                       animated:YES
                     completion:nil];
}

//Hell
- (IBAction)startHellGame
{
    HellGameViewController *hellGameViewController = [[HellGameViewController alloc] init];
    [self presentViewController:hellGameViewController
                       animated:YES
                     completion:nil];
}

- (void)sendHellScore:(NSNotification*)sender
{
    NSString *getScore = [[sender userInfo] valueForKey:@"hellScore"];
    HellScoreViewController *hellScoreViewController = [[HellScoreViewController alloc] init];
    hellScoreViewController.thisScore = getScore.intValue;
    [self presentViewController:hellScoreViewController
                       animated:YES
                     completion:nil];
}

- (void)viewDidLoad {
    
    [_nc addObserver:self
            selector:@selector(sendScore:)
                name:@"fail"
              object:nil];
    
    [_nc addObserver:self
            selector:@selector(startGame)
                name:@"again"
              object:nil];
    
    [_nc addObserver:self
            selector:@selector(startNumberGame)
                name:@"numberAgain"
              object:nil];

    [_nc addObserver:self
            selector:@selector(sendNumberScore:)
                name:@"numberFail"
              object:nil];
    
    [_nc addObserver:self
            selector:@selector(startHellGame)
                name:@"hellAgain"
              object:nil];
    
    [_nc addObserver:self
            selector:@selector(sendHellScore:)
                name:@"hellFail"
              object:nil];

    [self playBackgroundMusic];
    
    [super viewDidLoad];
}

- (void)playBackgroundMusic
{
    [_soundButton setImage: [UIImage imageNamed:@"NoMute Button.png"] forState:UIControlStateNormal];
    NSString *string = [[NSBundle mainBundle] pathForResource:@"BGMUSIC1"
                                                       ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:string];
    _avAudioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    _avAudioPlayer.volume = 1;
    _avAudioPlayer.numberOfLoops = -1;
    [_avAudioPlayer play];
}

- (IBAction)muteOrActiveBGMusic
{
    if(_avAudioPlayer.volume == 1){
        _avAudioPlayer.volume = 0;
        [_soundButton setImage: [UIImage imageNamed:@"Mute Button.png"] forState:UIControlStateNormal];
    }else if(_avAudioPlayer.volume == 0){
        _avAudioPlayer.volume = 1;
        [_soundButton setImage: [UIImage imageNamed:@"NoMute Button.png"] forState:UIControlStateNormal];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
