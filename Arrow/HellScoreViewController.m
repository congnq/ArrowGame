//
//  HellScoreViewController.m
//  Arrow
//
//  Created by 宋 奎熹 on 15/10/29.
//  Copyright © 2015年 宋 奎熹. All rights reserved.
//

#import "HellScoreViewController.h"
#import "HighScore.h"

@interface HellScoreViewController ()

@end

@implementation HellScoreViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _submitButton.hidden = YES;
    
    NSString *thisScore = [[NSString alloc] initWithFormat:@"%d",_thisScore];
    _scoreLabel.text = thisScore;
    NSString *highScore = [[NSString alloc] initWithFormat:@"%d",[HighScore readHellHighScore]];
    _highScoreLabel.text = highScore;
    
    if(_thisScore == [HighScore readNumberHighScore]){
        _submitButton.hidden = NO;
    }
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
    
    //Add method to submit to the record.
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
                                           postNotificationName:@"hellAgain"
                                           object:self];}];
}


@end
