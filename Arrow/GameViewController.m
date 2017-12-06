//
//  ViewController.m
//  Arrow
//
//  Created by 宋 奎熹 on 15/9/20.
//  Copyright © 2015年 宋 奎熹. All rights reserved.
//

//This is the game page.
//1:Up
//2:Down
//3:Left
//4:Right

//Multiple Lives to be added.

#import "GameViewController.h"
#import "HighScore.h"
#import "Settings.h"

@interface GameViewController ()

@end

@implementation GameViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    _level = 1;
//    _score = 0;
//    self.scoreLabel.text = @"0";
//    _life = 3;
//    _lifeNumber = [NSNumber numberWithInt:_life];
//    self.lifeLabel.text = _lifeNumber.description;
//    _counterForLife = 0;
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
    
    [HighScore setScore:(_score)];
    
    [self dismissViewControllerAnimated:YES
                             completion:^{[[NSNotificationCenter defaultCenter]
                                           postNotificationName:@"fail"
                                                         object:self
                                                       userInfo:[NSDictionary dictionaryWithObjectsAndKeys:
                                                                 [NSNumber numberWithInt:_score], @"score", nil]];}];
}

- (void)start
{
    _counter = 0;
    
    _arrowNumbers = [[NSMutableArray alloc] init];
    _pressedNumbers = [[NSMutableArray alloc] init];
  
    [self.countDownTimer invalidate];
    //Set Countdown Seconds
    _secondsCountDown = [Settings readDifficulty];
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
    }else if(_score >= 50 && _score < 80){
        _level = 5;
    }else if(_score >= 80){
        _level = 6;
    }
    
    //random number from 1 to 8
    if(self){
        if(_level % 2 == 1 ){
            for(UIImageView *image in _evenArrows){
                image.hidden = YES;
            }
            for(UIImageView *image in _oddArrows){
                image.hidden = NO;
            }
            for(int i = 3 - (_level - 1) / 2; i <= 3 + (_level - 1) / 2; i++){
                NSNumber *tempNum = [NSNumber numberWithInt: 1 + arc4random() % 12];
                switch([tempNum intValue]){
                    case 1:
                    case 2:
                        [_arrowNumbers addObject:[NSNumber numberWithInt:1]];
                        [_oddArrows[i] setImage:[UIImage imageNamed:@"W UP.png"]];
                        [_oddArrows[i] setTag: 1];
                        break;
                    case 3:
                    case 4:
                        [_arrowNumbers addObject:[NSNumber numberWithInt:2]];
                        [_oddArrows[i] setImage:[UIImage imageNamed:@"W DOWN.png"]];
                        [_oddArrows[i] setTag: 2];
                        break;
                    case 5:
                    case 6:
                        [_arrowNumbers addObject:[NSNumber numberWithInt:3]];
                        [_oddArrows[i] setImage:[UIImage imageNamed:@"W LEFT.png"]];
                        [_oddArrows[i] setTag: 3];
                        break;
                    case 7:
                    case 8:
                        [_arrowNumbers addObject:[NSNumber numberWithInt:4]];
                        [_oddArrows[i] setImage:[UIImage imageNamed:@"W RIGHT.png"]];
                        [_oddArrows[i] setTag: 4];
                        break;
                        //reversed arrows
                    case 9:
                        [_arrowNumbers addObject:[NSNumber numberWithInt:5]];
                        [_oddArrows[i] setImage:[UIImage imageNamed:@"B LEFT.png"]];
                        [_oddArrows[i] setTag: 5];
                        break;
                    case 10:
                        [_arrowNumbers addObject:[NSNumber numberWithInt:6]];
                        [_oddArrows[i] setImage:[UIImage imageNamed:@"B RIGHT.png"]];
                        [_oddArrows[i] setTag: 6];
                        break;
                    case 11:
                        [_arrowNumbers addObject:[NSNumber numberWithInt:7]];
                        [_oddArrows[i] setImage:[UIImage imageNamed:@"B UP.png"]];
                        [_oddArrows[i] setTag: 7];
                        break;
                    case 12:
                        [_arrowNumbers addObject:[NSNumber numberWithInt:8]];
                        [_oddArrows[i] setImage:[UIImage imageNamed:@"B DOWN.png"]];
                        [_oddArrows[i] setTag: 8];
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
                    case 2:
                        [_arrowNumbers addObject:[NSNumber numberWithInt:1]];
                        [_evenArrows[i] setImage:[UIImage imageNamed:@"W UP.png"]];
                        [_evenArrows[i] setTag: 1];
                        break;
                    case 3:
                    case 4:
                        [_arrowNumbers addObject:[NSNumber numberWithInt:2]];
                        [_evenArrows[i] setImage:[UIImage imageNamed:@"W DOWN.png"]];
                        [_evenArrows[i] setTag: 2];
                        break;
                    case 5:
                    case 6:
                        [_arrowNumbers addObject:[NSNumber numberWithInt:3]];
                        [_evenArrows[i] setImage:[UIImage imageNamed:@"W LEFT.png"]];
                        [_evenArrows[i] setTag: 3];
                        break;
                    case 7:
                    case 8:
                        [_arrowNumbers addObject:[NSNumber numberWithInt:4]];
                        [_evenArrows[i] setImage:[UIImage imageNamed:@"W RIGHT.png"]];
                        [_evenArrows[i] setTag: 4];
                        break;
                        //reversed arrows
                    case 9:
                        [_arrowNumbers addObject:[NSNumber numberWithInt:5]];
                        [_evenArrows[i] setImage:[UIImage imageNamed:@"B LEFT.png"]];
                        [_evenArrows[i] setTag: 5];
                        break;
                    case 10:
                        [_arrowNumbers addObject:[NSNumber numberWithInt:6]];
                        [_evenArrows[i] setImage:[UIImage imageNamed:@"B RIGHT.png"]];
                        [_evenArrows[i] setTag: 6];
                        break;
                    case 11:
                        [_arrowNumbers addObject:[NSNumber numberWithInt:7]];
                        [_evenArrows[i] setImage:[UIImage imageNamed:@"B UP.png"]];
                        [_evenArrows[i] setTag: 7];
                        break;
                    case 12:
                        [_arrowNumbers addObject:[NSNumber numberWithInt:8]];
                        [_evenArrows[i] setImage:[UIImage imageNamed:@"B DOWN.png"]];
                        [_evenArrows[i] setTag: 8];
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
    }
    
    if(_counterForLife == 50 || _counterForLife == 51){
        _life++;
        _lifeNumber = [NSNumber numberWithInt:_life];
        self.lifeLabel.text = _lifeNumber.description;
        _counterForLife = 0;
    }
    
//    NSNumber *cfl = [NSNumber numberWithInt:_counterForLife];
//    NSLog(cfl.description);
    
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
