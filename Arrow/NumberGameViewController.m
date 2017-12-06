//
//  NumberGameViewController.m
//  Arrow
//
//  Created by 宋 奎熹 on 15/9/24.
//  Copyright © 2015年 宋 奎熹. All rights reserved.
//

#import "NumberGameViewController.h"
#import "HighScore.h"
#import "Record.h"

@interface NumberGameViewController ()

@end

@implementation NumberGameViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    _score = 0;
    self.scoreLabel.text = @"0";
    //Set the Countdown seconds
    _secondsCountDown = 20;
    _timerLabel.text=[NSString stringWithFormat:@"%d",_secondsCountDown];
    _countDownTimer = [NSTimer scheduledTimerWithTimeInterval:1
                                                       target:self
                                                     selector:@selector(timeFireMethod)
                                                     userInfo:nil
                                                      repeats:YES];
    return self;
}

- (void)timeFireMethod
{
    _secondsCountDown--;
    _timerLabel.text=[NSString stringWithFormat:@"%d",_secondsCountDown];
    if(_secondsCountDown == 0){
        //set Highscore
        [HighScore setNumberScore:_score];
        //set Record
//        [Record setNumberRecord:_score];
        [self dismissViewControllerAnimated:YES
                                 completion:^{[[NSNotificationCenter defaultCenter]
                                               postNotificationName:@"numberFail"
                                               object:self
                                               userInfo:[NSDictionary dictionaryWithObjectsAndKeys:
                                                         [NSNumber numberWithInt:_score], @"numberScore", nil]];}];
    }
}

- (void)fail
{
    _score -= 3;
    
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    
    _scoreNumber = [NSNumber numberWithInt:_score];
    self.scoreLabel.text = _scoreNumber.description;
    
    switch ([_arrows[_counter - 1] tag]){
        case 1:
            [_arrows[_counter - 1] setImage:[UIImage imageNamed:@"R UP 2.png"]];
            break;
        case 2:
            [_arrows[_counter - 1] setImage:[UIImage imageNamed:@"R DOWN 2.png"]];
            break;
        case 3:
            [_arrows[_counter - 1] setImage:[UIImage imageNamed:@"R LEFT 2.png"]];
            break;
        case 4:
            [_arrows[_counter - 1] setImage:[UIImage imageNamed:@"R RIGHT 2.png"]];
            break;
        case 5:
            [_arrows[_counter - 1] setImage:[UIImage imageNamed:@"R LEFT.png"]];
            break;
        case 6:
            [_arrows[_counter - 1] setImage:[UIImage imageNamed:@"R RIGHT.png"]];
            break;
        case 7:
            [_arrows[_counter - 1] setImage:[UIImage imageNamed:@"R UP.png"]];
            break;
        case 8:
            [_arrows[_counter - 1] setImage:[UIImage imageNamed:@"R DOWN.png"]];
            break;
    }
    
    if(_counter == [_arrowNumbers count]){
        [self start];
    }

}

- (void)success
{
    _score ++;
    
    _scoreNumber = [NSNumber numberWithInt:_score];
    self.scoreLabel.text = _scoreNumber.description;
    
    switch ([_arrows[_counter - 1] tag]){
        case 1:
            [_arrows[_counter - 1] setImage:[UIImage imageNamed:@"G UP 2.png"]];
            break;
        case 2:
            [_arrows[_counter - 1] setImage:[UIImage imageNamed:@"G DOWN 2.png"]];
            break;
        case 3:
            [_arrows[_counter - 1] setImage:[UIImage imageNamed:@"G LEFT 2.png"]];
            break;
        case 4:
            [_arrows[_counter - 1] setImage:[UIImage imageNamed:@"G RIGHT 2.png"]];
            break;
        case 5:
            [_arrows[_counter - 1] setImage:[UIImage imageNamed:@"G LEFT.png"]];
            break;
        case 6:
            [_arrows[_counter - 1] setImage:[UIImage imageNamed:@"G RIGHT.png"]];
            break;
        case 7:
            [_arrows[_counter - 1] setImage:[UIImage imageNamed:@"G UP.png"]];
            break;
        case 8:
            [_arrows[_counter - 1] setImage:[UIImage imageNamed:@"G DOWN.png"]];
            break;
    }
    
    if(_counter == [_arrowNumbers count]){
        [self start];
    }
}

- (void)start
{
    _counter = 0;
    
    _arrowNumbers = [[NSMutableArray alloc] init];
    _arrowNumberLabel = [[NSString alloc] init];
    _pressedNumbers = [[NSMutableArray alloc] init];
    _pressedNumberLabel = [[NSString alloc] init];
    
    //random number from 1 to 8
    if(self){
        for(int i = 0; i < 10; i++){
            NSNumber *tempNum = [NSNumber numberWithInt: 1 + arc4random() % 12];
            switch([tempNum intValue]){
                case 1:
                case 2:
                    [_arrowNumbers addObject:[NSNumber numberWithInt:1]];
                    [_arrows[i] setImage:[UIImage imageNamed:@"W UP.png"]];
                    [_arrows[i] setTag: 1];
                    break;
                case 3:
                case 4:
                    [_arrowNumbers addObject:[NSNumber numberWithInt:2]];
                    [_arrows[i] setImage:[UIImage imageNamed:@"W DOWN.png"]];
                    [_arrows[i] setTag: 2];
                    break;
                case 5:
                case 6:
                    [_arrowNumbers addObject:[NSNumber numberWithInt:3]];
                    [_arrows[i] setImage:[UIImage imageNamed:@"W LEFT.png"]];
                    [_arrows[i] setTag: 3];
                    break;
                case 7:
                case 8:
                    [_arrowNumbers addObject:[NSNumber numberWithInt:4]];
                    [_arrows[i] setImage:[UIImage imageNamed:@"W RIGHT.png"]];
                    [_arrows[i] setTag: 4];
                    break;
                    //reversed arrows
                case 9:
                    [_arrowNumbers addObject:[NSNumber numberWithInt:5]];
                    [_arrows[i] setImage:[UIImage imageNamed:@"B LEFT.png"]];
                    [_arrows[i] setTag: 5];
                    break;
                case 10:
                    [_arrowNumbers addObject:[NSNumber numberWithInt:6]];
                    [_arrows[i] setImage:[UIImage imageNamed:@"B RIGHT.png"]];
                    [_arrows[i] setTag: 6];
                    break;
                case 11:
                    [_arrowNumbers addObject:[NSNumber numberWithInt:7]];
                    [_arrows[i] setImage:[UIImage imageNamed:@"B UP.png"]];
                    [_arrows[i] setTag: 7];
                    break;
                case 12:
                    [_arrowNumbers addObject:[NSNumber numberWithInt:8]];
                    [_arrows[i] setImage:[UIImage imageNamed:@"B DOWN.png"]];
                    [_arrows[i] setTag: 8];
                    break;
            }
        }
    }
}

- (IBAction) buttonPressed:(id)sender
{
    _counter++;
    
    //Read Sound Effect from the Settings.
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Tock"
                                                     ofType:@"caf"];
    NSURL *url = [[NSURL alloc] initFileURLWithPath:path];
    _player = [[AVAudioPlayer alloc] initWithContentsOfURL:url
                                                     error:nil];
    [_player play];

    UIButton *button = (UIButton*)sender;
    long btnTag = [button tag];
    
    [_pressedNumbers addObject:[NSNumber numberWithInt:(int)btnTag]];
    
    if([_arrowNumbers[_counter - 1] description].intValue >= 1 && [_arrowNumbers[_counter - 1] description].intValue <= 4){
        if(_pressedNumbers[_counter - 1] == _arrowNumbers[_counter - 1]){
            [self success];
        }else{
            [self fail];
        }
    }else if ([_arrowNumbers[_counter - 1] description].intValue >= 5 && [_arrowNumbers[_counter - 1] description].intValue <= 8){
        if([_pressedNumbers[_counter - 1] description].intValue == 9 - [_arrowNumbers[_counter - 1] description].intValue){
            _score++;
            [self success];
        }else{
            [self fail];
        }
    }
    
}

- (IBAction)goBack
{
    [self showOkayCancelAlert];
}

- (void)showOkayCancelAlert
{
    _tempTime = _secondsCountDown;
    [_countDownTimer invalidate];
    
    NSString *title = NSLocalizedString(@"Caution!", nil);
    NSString *message = NSLocalizedString(@"Are you sure to go back to the mainpage?", nil);
    NSString *cancelButtonTitle = NSLocalizedString(@"No!", nil);
    NSString *gobackButtonTitle = NSLocalizedString(@"Go Back!", nil);
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title
                                                                             message:message
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle
                                                           style:UIAlertActionStyleCancel
                                                         handler:^(UIAlertAction *action) {
                                                             [self continueTimer];}];
    
    UIAlertAction *otherAction = [UIAlertAction actionWithTitle:gobackButtonTitle
                                                          style:UIAlertActionStyleDefault
                                                        handler:^(UIAlertAction *action) {
                                                            [self dismissViewControllerAnimated:YES
                                                                                     completion:nil];}];
    
    [alertController addAction:cancelAction];
    [alertController addAction:otherAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)continueTimer
{
    _secondsCountDown = _tempTime;
    _timerLabel.text=[NSString stringWithFormat:@"%d",_secondsCountDown];
    _countDownTimer = [NSTimer scheduledTimerWithTimeInterval:1
                                                       target:self
                                                     selector:@selector(timeFireMethod)
                                                     userInfo:nil
                                                      repeats:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [_upButton setImage:[UIImage imageNamed:@"W UP.png"] forState:UIControlStateNormal];
    [_downButton setImage:[UIImage imageNamed:@"W DOWN.png"] forState:UIControlStateNormal];
    [_leftButton setImage:[UIImage imageNamed:@"W LEFT.png"] forState:UIControlStateNormal];
    [_rightButton setImage:[UIImage imageNamed:@"W RIGHT.png"] forState:UIControlStateNormal];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.scoreLabel.text = @"0";
    _score = 0;
    _counter = 0;
    _timerLabel.text = @"20";
    [self start];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
