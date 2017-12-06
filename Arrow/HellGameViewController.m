//
//  HellGameViewController.m
//  Arrow
//
//  Created by 宋 奎熹 on 15/10/29.
//  Copyright © 2015年 宋 奎熹. All rights reserved.
//

//This is the Hell game page.
//1:Up
//2:Down
//3:Left
//4:Right
//5:LU
//6:LD
//7:RU
//8:RD

#import "HellGameViewController.h"
#import "HighScore.h"

@interface HellGameViewController ()

@end

@implementation HellGameViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    return self;
}

- (void)timeFireMethod
{
    _secondsCountDown--;
    _timerLabel.text=[NSString stringWithFormat:@"%d",_secondsCountDown];
    if(_secondsCountDown == 0){
        [self fail];
    }
}

- (void)fail
{
    [self.countDownTimer invalidate];
    [HighScore setHellScore:(_score)];
    [self dismissViewControllerAnimated:YES
                             completion:^{[[NSNotificationCenter defaultCenter]
                                           postNotificationName:@"hellFail"
                                           object:self
                                           userInfo:[NSDictionary dictionaryWithObjectsAndKeys:
                                                     [NSNumber numberWithInt:_score], @"hellScore", nil]];}];
}

- (void)start
{
    _counter = 0;
    
    _arrowNumbers = [[NSMutableArray alloc] init];
    _pressedNumbers = [[NSMutableArray alloc] init];
    
    [self.countDownTimer invalidate];
    //Set Countdown Seconds
    _secondsCountDown = 6;
    _timerLabel.text=[NSString stringWithFormat:@"%d",_secondsCountDown];
    _countDownTimer = [NSTimer scheduledTimerWithTimeInterval:1
                                                       target:self
                                                     selector:@selector(timeFireMethod)
                                                     userInfo:nil
                                                      repeats:YES];
    //Set Levels
    //Max:6 arrows
    if(_score >= 0 && _score < 5){
        _level = 1;
    }else if(_score >= 5 && _score < 15){
        _level = 2;
    }else if(_score >= 15 && _score < 30){
        _level = 3;
    }else if(_score >= 30 && _score < 50){
        _level = 4;
    }else if(_score >= 50 && _score < 100){
        _level = 5;
    }else if(_score >= 100){
        _level = 6;
    }else if(_score >= 160){
        _level = 7;
    }
    
    //random number from 1 to 16
    if(self){
        if(_level % 2 == 1 ){
            for(UIImageView *image in _evenArrows){
                image.hidden = YES;
            }
            for(UIImageView *image in _oddArrows){
                image.hidden = NO;
            }
            for(int i = 3 - (_level - 1) / 2; i <= 3 + (_level - 1) / 2; i++){
                NSNumber *tempNum = [NSNumber numberWithInt: 1 + arc4random() % 16];
                switch([tempNum intValue]){
                    case 1:
                        [_arrowNumbers addObject:[NSNumber numberWithInt:1]];
                        [_oddArrows[i] setImage:[UIImage imageNamed:@"W UP.png"]];
                        [_oddArrows[i] setTag: 1];
                        break;
                    case 2:
                        [_arrowNumbers addObject:[NSNumber numberWithInt:2]];
                        [_oddArrows[i] setImage:[UIImage imageNamed:@"W DOWN.png"]];
                        [_oddArrows[i] setTag: 2];
                        break;
                    case 3:
                        [_arrowNumbers addObject:[NSNumber numberWithInt:3]];
                        [_oddArrows[i] setImage:[UIImage imageNamed:@"W LEFT.png"]];
                        [_oddArrows[i] setTag: 3];
                        break;
                    case 4:
                        [_arrowNumbers addObject:[NSNumber numberWithInt:4]];
                        [_oddArrows[i] setImage:[UIImage imageNamed:@"W RIGHT.png"]];
                        [_oddArrows[i] setTag: 4];
                        break;
                        //reversed arrows
                    case 5:
                        [_arrowNumbers addObject:[NSNumber numberWithInt:5]];
                        [_oddArrows[i] setImage:[UIImage imageNamed:@"B LEFT.png"]];
                        [_oddArrows[i] setTag: 5];
                        break;
                    case 6:
                        [_arrowNumbers addObject:[NSNumber numberWithInt:6]];
                        [_oddArrows[i] setImage:[UIImage imageNamed:@"B RIGHT.png"]];
                        [_oddArrows[i] setTag: 6];
                        break;
                    case 7:
                        [_arrowNumbers addObject:[NSNumber numberWithInt:7]];
                        [_oddArrows[i] setImage:[UIImage imageNamed:@"B UP.png"]];
                        [_oddArrows[i] setTag: 7];
                        break;
                    case 8:
                        [_arrowNumbers addObject:[NSNumber numberWithInt:8]];
                        [_oddArrows[i] setImage:[UIImage imageNamed:@"B DOWN.png"]];
                        [_oddArrows[i] setTag: 8];
                        break;
                        //
                    case 9:
                        [_arrowNumbers addObject:[NSNumber numberWithInt:9]];
                        [_oddArrows[i] setImage:[UIImage imageNamed:@"W LU.png"]];
                        [_oddArrows[i] setTag: 9];
                        break;
                    case 10:
                        [_arrowNumbers addObject:[NSNumber numberWithInt:10]];
                        [_oddArrows[i] setImage:[UIImage imageNamed:@"W LD.png"]];
                        [_oddArrows[i] setTag: 10];
                        break;
                    case 11:
                        [_arrowNumbers addObject:[NSNumber numberWithInt:11]];
                        [_oddArrows[i] setImage:[UIImage imageNamed:@"W RU.png"]];
                        [_oddArrows[i] setTag: 11];
                        break;
                    case 12:
                        [_arrowNumbers addObject:[NSNumber numberWithInt:12]];
                        [_oddArrows[i] setImage:[UIImage imageNamed:@"W RD.png"]];
                        [_oddArrows[i] setTag: 12];
                        break;
                        //
                    case 13:
                        [_arrowNumbers addObject:[NSNumber numberWithInt:13]];
                        [_oddArrows[i] setImage:[UIImage imageNamed:@"B RD.png"]];
                        [_oddArrows[i] setTag: 13];
                        break;
                    case 14:
                        [_arrowNumbers addObject:[NSNumber numberWithInt:14]];
                        [_oddArrows[i] setImage:[UIImage imageNamed:@"B RU.png"]];
                        [_oddArrows[i] setTag: 14];
                        break;
                    case 15:
                        [_arrowNumbers addObject:[NSNumber numberWithInt:15]];
                        [_oddArrows[i] setImage:[UIImage imageNamed:@"B LD.png"]];
                        [_oddArrows[i] setTag: 15];
                        break;
                    case 16:
                        [_arrowNumbers addObject:[NSNumber numberWithInt:16]];
                        [_oddArrows[i] setImage:[UIImage imageNamed:@"B LU.png"]];
                        [_oddArrows[i] setTag: 16];
                        break;
                }
            }
        }else{
            for(UIImageView *image in _oddArrows){
                image.hidden = YES;
            }
            for(UIImageView *image in _evenArrows){
                image.hidden = NO;
            }
            for(int i = 3 - _level / 2; i <= 2 + _level / 2; i++){
                NSNumber *tempNum = [NSNumber numberWithInt: 1 + arc4random() % 12];
                switch([tempNum intValue]){
                    case 1:
                        [_arrowNumbers addObject:[NSNumber numberWithInt:1]];
                        [_evenArrows[i] setImage:[UIImage imageNamed:@"W UP.png"]];
                        [_evenArrows[i] setTag: 1];
                        break;
                    case 2:
                        [_arrowNumbers addObject:[NSNumber numberWithInt:2]];
                        [_evenArrows[i] setImage:[UIImage imageNamed:@"W DOWN.png"]];
                        [_evenArrows[i] setTag: 2];
                        break;
                    case 3:
                        [_arrowNumbers addObject:[NSNumber numberWithInt:3]];
                        [_evenArrows[i] setImage:[UIImage imageNamed:@"W LEFT.png"]];
                        [_evenArrows[i] setTag: 3];
                        break;
                    case 4:
                        [_arrowNumbers addObject:[NSNumber numberWithInt:4]];
                        [_evenArrows[i] setImage:[UIImage imageNamed:@"W RIGHT.png"]];
                        [_evenArrows[i] setTag: 4];
                        break;
                        //reversed arrows
                    case 5:
                        [_arrowNumbers addObject:[NSNumber numberWithInt:5]];
                        [_evenArrows[i] setImage:[UIImage imageNamed:@"B LEFT.png"]];
                        [_evenArrows[i] setTag: 5];
                        break;
                    case 6:
                        [_arrowNumbers addObject:[NSNumber numberWithInt:6]];
                        [_evenArrows[i] setImage:[UIImage imageNamed:@"B RIGHT.png"]];
                        [_evenArrows[i] setTag: 6];
                        break;
                    case 7:
                        [_arrowNumbers addObject:[NSNumber numberWithInt:7]];
                        [_evenArrows[i] setImage:[UIImage imageNamed:@"B UP.png"]];
                        [_evenArrows[i] setTag: 7];
                        break;
                    case 8:
                        [_arrowNumbers addObject:[NSNumber numberWithInt:8]];
                        [_evenArrows[i] setImage:[UIImage imageNamed:@"B DOWN.png"]];
                        [_evenArrows[i] setTag: 8];
                        break;
                        //
                    case 9:
                        [_arrowNumbers addObject:[NSNumber numberWithInt:9]];
                        [_evenArrows[i] setImage:[UIImage imageNamed:@"W LU.png"]];
                        [_evenArrows[i] setTag: 9];
                        break;
                    case 10:
                        [_arrowNumbers addObject:[NSNumber numberWithInt:10]];
                        [_evenArrows[i] setImage:[UIImage imageNamed:@"W LD.png"]];
                        [_evenArrows[i] setTag: 10];
                        break;
                    case 11:
                        [_arrowNumbers addObject:[NSNumber numberWithInt:11]];
                        [_evenArrows[i] setImage:[UIImage imageNamed:@"W RU.png"]];
                        [_evenArrows[i] setTag: 11];
                        break;
                    case 12:
                        [_arrowNumbers addObject:[NSNumber numberWithInt:12]];
                        [_evenArrows[i] setImage:[UIImage imageNamed:@"W RD.png"]];
                        [_evenArrows[i] setTag: 12];
                        break;
                        //
                    case 13:
                        [_arrowNumbers addObject:[NSNumber numberWithInt:13]];
                        [_evenArrows[i] setImage:[UIImage imageNamed:@"B RD.png"]];
                        [_evenArrows[i] setTag: 13];
                        break;
                    case 14:
                        [_arrowNumbers addObject:[NSNumber numberWithInt:14]];
                        [_evenArrows[i] setImage:[UIImage imageNamed:@"B RU.png"]];
                        [_evenArrows[i] setTag: 14];
                        break;
                    case 15:
                        [_arrowNumbers addObject:[NSNumber numberWithInt:15]];
                        [_evenArrows[i] setImage:[UIImage imageNamed:@"B LD.png"]];
                        [_evenArrows[i] setTag: 15];
                        break;
                    case 16:
                        [_arrowNumbers addObject:[NSNumber numberWithInt:16]];
                        [_evenArrows[i] setImage:[UIImage imageNamed:@"B LU.png"]];
                        [_evenArrows[i] setTag: 16];
                        break;
                }
            }
        }
    }
}

- (IBAction)buttonPressed:(id)sender
{
    _counter++;
    
    //Read Sound Effect from the Settings.
    NSString *path = [[NSBundle mainBundle] pathForResource:@"RingerChanged 1"
                                                     ofType:@"wav"];
    NSURL *url = [[NSURL alloc] initFileURLWithPath:path];
    _player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [_player play];
    
    UIButton *button = (UIButton*)sender;
    long btnTag = [button tag];
    [_pressedNumbers addObject:[NSNumber numberWithInt:(int)btnTag]];
    if([_arrowNumbers[_counter - 1] description].intValue >= 1 && [_arrowNumbers[_counter - 1] description].intValue <= 4){
        if(_pressedNumbers[_counter - 1] == _arrowNumbers[_counter - 1]){
            
            _score++;
            
            _counterForLife++;
            
            _scoreNumber = [NSNumber numberWithInt:_score];
            self.scoreLabel.text = _scoreNumber.description;
            
            switch ([_oddArrows[_counter + 2 - (_level - 1) / 2] tag]){
                case 1:
                    [_oddArrows[_counter + 2 - (_level - 1) / 2] setImage:[UIImage imageNamed:@"G UP 2.png"]];
                    break;
                case 2:
                    [_oddArrows[_counter + 2 - (_level - 1) / 2] setImage:[UIImage imageNamed:@"G DOWN 2.png"]];
                    break;
                case 3:
                    [_oddArrows[_counter + 2 - (_level - 1) / 2] setImage:[UIImage imageNamed:@"G LEFT 2.png"]];
                    break;
                case 4:
                    [_oddArrows[_counter + 2 - (_level - 1) / 2] setImage:[UIImage imageNamed:@"G RIGHT 2.png"]];
                    break;
            }
            
            switch ([_evenArrows[_counter + 2 - _level / 2] tag]){
                case 1:
                    [_evenArrows[_counter + 2 - _level / 2] setImage:[UIImage imageNamed:@"G UP 2.png"]];
                    break;
                case 2:
                    [_evenArrows[_counter + 2 - _level / 2] setImage:[UIImage imageNamed:@"G DOWN 2.png"]];
                    break;
                case 3:
                    [_evenArrows[_counter + 2 - _level / 2] setImage:[UIImage imageNamed:@"G LEFT 2.png"]];
                    break;
                case 4:
                    [_evenArrows[_counter + 2 - _level / 2] setImage:[UIImage imageNamed:@"G RIGHT 2.png"]];
                    break;
            }
            
            if(_counter == [_arrowNumbers count]){
                [self start];
            }
            
        }else{
            [self lifeDecrease];
        }
    }else if ([_arrowNumbers[_counter - 1] description].intValue >= 5 && [_arrowNumbers[_counter - 1] description].intValue <= 8){
        if([_pressedNumbers[_counter - 1] description].intValue == 9 - [_arrowNumbers[_counter - 1] description].intValue){
            //if it is a reversed arrow, score + 2
            _score+=2;
            //counterForLife + 2
            _counterForLife+=2;
            
            _scoreNumber = [NSNumber numberWithInt:_score];
            self.scoreLabel.text = _scoreNumber.description;
            
            switch ([_oddArrows[_counter + 2 - (_level - 1) / 2] tag]){
                case 5:
                    [_oddArrows[_counter + 2 - (_level - 1) / 2] setImage:[UIImage imageNamed:@"G LEFT.png"]];
                    break;
                case 6:
                    [_oddArrows[_counter + 2 - (_level - 1) / 2] setImage:[UIImage imageNamed:@"G RIGHT.png"]];
                    break;
                case 7:
                    [_oddArrows[_counter + 2 - (_level - 1) / 2] setImage:[UIImage imageNamed:@"G UP.png"]];
                    break;
                case 8:
                    [_oddArrows[_counter + 2 - (_level - 1) / 2] setImage:[UIImage imageNamed:@"G DOWN.png"]];
                    break;
            }
            switch ([_evenArrows[_counter + 2 - _level / 2] tag]){
                case 5:
                    [_evenArrows[_counter + 2 - _level / 2] setImage:[UIImage imageNamed:@"G LEFT.png"]];
                    break;
                case 6:
                    [_evenArrows[_counter + 2 - _level / 2] setImage:[UIImage imageNamed:@"G RIGHT.png"]];
                    break;
                case 7:
                    [_evenArrows[_counter + 2 - _level / 2] setImage:[UIImage imageNamed:@"G UP.png"]];
                    break;
                case 8:
                    [_evenArrows[_counter + 2 - _level / 2] setImage:[UIImage imageNamed:@"G DOWN.png"]];
                    break;
            }
            
            if(_counter == [_arrowNumbers count]){
                [self start];
            }
            
        }else{
            [self lifeDecrease];
        }
    }else if([_arrowNumbers[_counter - 1] description].intValue >= 9 && [_arrowNumbers[_counter - 1] description].intValue <= 12){
        if([_pressedNumbers[_counter - 1] description].intValue + 4
           == [_arrowNumbers[_counter - 1] description].intValue){
            
            _score++;
            
            _counterForLife++;
            
            _scoreNumber = [NSNumber numberWithInt:_score];
            self.scoreLabel.text = _scoreNumber.description;
            
            switch ([_oddArrows[_counter + 2 - (_level - 1) / 2] tag]){
                case 9:
                    [_oddArrows[_counter + 2 - (_level - 1) / 2] setImage:[UIImage imageNamed:@"G LU 2.png"]];
                    break;
                case 10:
                    [_oddArrows[_counter + 2 - (_level - 1) / 2] setImage:[UIImage imageNamed:@"G LD 2.png"]];
                    break;
                case 11:
                    [_oddArrows[_counter + 2 - (_level - 1) / 2] setImage:[UIImage imageNamed:@"G RU 2.png"]];
                    break;
                case 12:
                    [_oddArrows[_counter + 2 - (_level - 1) / 2] setImage:[UIImage imageNamed:@"G RD 2.png"]];
                    break;
            }
            
            switch ([_evenArrows[_counter + 2 - _level / 2] tag]){
                case 9:
                    [_evenArrows[_counter + 2 - _level / 2] setImage:[UIImage imageNamed:@"G LU.png"]];
                    break;
                case 10:
                    [_evenArrows[_counter + 2 - _level / 2] setImage:[UIImage imageNamed:@"G LD.png"]];
                    break;
                case 11:
                    [_evenArrows[_counter + 2 - _level / 2] setImage:[UIImage imageNamed:@"G RU.png"]];
                    break;
                case 12:
                    [_evenArrows[_counter + 2 - _level / 2] setImage:[UIImage imageNamed:@"G RD.png"]];
                break;
            }
            
            if(_counter == [_arrowNumbers count]){
                [self start];
            }
            
        }else{
            [self lifeDecrease];
        }
    }else if([_arrowNumbers[_counter - 1] description].intValue >= 13 && [_arrowNumbers[_counter - 1] description].intValue <= 16){
        if([_pressedNumbers[_counter - 1] description].intValue + 8 == [_arrowNumbers[_counter - 1] description].intValue){
            //if it is a reversed arrow, score + 2
            _score+=2;
            //counterForLife + 2
            _counterForLife+=2;
            
            _scoreNumber = [NSNumber numberWithInt:_score];
            self.scoreLabel.text = _scoreNumber.description;
            
            switch ([_oddArrows[_counter + 2 - (_level - 1) / 2] tag]){
                case 13:
                    [_oddArrows[_counter + 2 - (_level - 1) / 2] setImage:[UIImage imageNamed:@"G RD.png"]];
                    break;
                case 14:
                    [_oddArrows[_counter + 2 - (_level - 1) / 2] setImage:[UIImage imageNamed:@"G RU.png"]];
                    break;
                case 15:
                    [_oddArrows[_counter + 2 - (_level - 1) / 2] setImage:[UIImage imageNamed:@"G LD.png"]];
                    break;
                case 16:
                    [_oddArrows[_counter + 2 - (_level - 1) / 2] setImage:[UIImage imageNamed:@"G LU.png"]];
                    break;
            }
            switch ([_evenArrows[_counter + 2 - _level / 2] tag]){
                case 13:
                    [_evenArrows[_counter + 2 - _level / 2] setImage:[UIImage imageNamed:@"G RD.png"]];
                    break;
                case 14:
                    [_evenArrows[_counter + 2 - _level / 2] setImage:[UIImage imageNamed:@"G RU.png"]];
                    break;
                case 15:
                    [_evenArrows[_counter + 2 - _level / 2] setImage:[UIImage imageNamed:@"G LD.png"]];
                    break;
                case 16:
                    [_evenArrows[_counter + 2 - _level / 2] setImage:[UIImage imageNamed:@"G LU.png"]];
                    break;
            }
            
            if(_counter == [_arrowNumbers count]){
                [self start];
            }
            
        }else{
            [self lifeDecrease];
        }

    }

    if(_counterForLife == 50 || _counterForLife == 51){
        _life++;
        _lifeNumber = [NSNumber numberWithInt:_life];
        self.lifeLabel.text = _lifeNumber.description;
        _counterForLife = 0;
    }
    
}

- (void)lifeDecrease
{
    if(_life > 0){
        _life--;
        _lifeNumber = [NSNumber numberWithInt:_life];
        self.lifeLabel.text = _lifeNumber.description;
        _counterForLife = 0;
        [self start];
    }else{
        [self fail];
    }
}

- (void)viewDidLoad
{
    [_upButton setImage:[UIImage imageNamed:@"W UP.png"] forState:UIControlStateNormal];
    [_downButton setImage:[UIImage imageNamed:@"W DOWN.png"] forState:UIControlStateNormal];
    [_leftButton setImage:[UIImage imageNamed:@"W LEFT.png"] forState:UIControlStateNormal];
    [_rightButton setImage:[UIImage imageNamed:@"W RIGHT.png"] forState:UIControlStateNormal];
    [_LUButton setImage:[UIImage imageNamed:@"W LU.png"] forState:UIControlStateNormal];
    [_LDButton setImage:[UIImage imageNamed:@"W LD.png"] forState:UIControlStateNormal];
    [_RUButton setImage:[UIImage imageNamed:@"W RU.png"] forState:UIControlStateNormal];
    [_RDButton setImage:[UIImage imageNamed:@"W RD.png"] forState:UIControlStateNormal];
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    _life = 3;
    _lifeNumber = [NSNumber numberWithInt:_life];
    self.lifeLabel.text = _lifeNumber.description;
    self.scoreLabel.text = @"0";
    _score = 0;
    _counter = 0;
    _counterForLife = 0;
    [self start];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
