//
//  ScoreViewController.m
//  Arrow
//
//  Created by 宋 奎熹 on 15/9/22.
//  Copyright © 2015年 宋 奎熹. All rights reserved.
//

#import "ScoreViewController.h"
#import "HighScore.h"

@interface ScoreViewController ()

@end

@implementation ScoreViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *thisScore = [[NSString alloc] initWithFormat:@"%d",_thisScore];
    _scoreLabel.text = thisScore;
    NSString *highScore = [[NSString alloc] initWithFormat:@"%d",[HighScore readHighScore]];
    _highScoreLabel.text = highScore;
    NSString *difficulty = [[NSString alloc] initWithFormat:@"%d",[HighScore readDifficulty]];
    _difficultyLabel.text = difficulty;
    
}

- (IBAction)showNameInput
{
    
    UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"Please enter your name:"
                                                                message:@""
                                                         preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel"
                                                           style:UIAlertActionStyleCancel
                                                         handler: ^(UIAlertAction *action) {
                                                             [self dismissViewControllerAnimated:YES
                                                                                      completion:nil];}];
    
    UIAlertAction *submitAction = [UIAlertAction actionWithTitle:@"Submit"
                                                           style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction *action){
                                                             NSLog(@"Submitted!");
                                                         }];
    
    [ac addTextFieldWithConfigurationHandler:^(UITextField *name){
        name.placeholder = @"Name";
    }];
    
    [ac addAction:cancelAction];
    [ac addAction:submitAction];
    
    [self presentViewController:ac animated:YES completion:nil];
    
}

- (IBAction)goBack:(id)sender
{
    [self dismissViewControllerAnimated:YES
                             completion:nil];
}

- (IBAction)againButtonPressed:(id)sender
{
    [self dismissViewControllerAnimated:YES
                             completion:^{[[NSNotificationCenter defaultCenter]
                                           postNotificationName:@"again"
                                           object:self];}];
}


@end
