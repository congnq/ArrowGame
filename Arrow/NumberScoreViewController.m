//
//  NumberScoreViewController.m
//  Arrow
//
//  Created by 宋 奎熹 on 15/9/24.
//  Copyright © 2015年 宋 奎熹. All rights reserved.
//

#import "NumberScoreViewController.h"
#import "HighScore.h"

@interface NumberScoreViewController ()

@end

@implementation NumberScoreViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _submitButton.hidden = YES;
    
    NSString *thisScore = [[NSString alloc] initWithFormat:@"%d",_thisScore];
    _scoreLabel.text = thisScore;
    NSString *highScore = [[NSString alloc] initWithFormat:@"%d",[HighScore readNumberHighScore]];
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

    UIAlertAction *submitAction = [UIAlertAction actionWithTitle:@"Submit"
                                                       style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction *action){
                                                         NSLog(@"Submitted!");}];
    
    [ac addTextFieldWithConfigurationHandler:^(UITextField *name){
        name.placeholder = @"Name";}];
    
    [ac addAction:cancelAction];
    [ac addAction:submitAction];
    
    [self presentViewController:ac animated:YES completion:nil];
    
}

- (void)sendNameAndScore
{
    
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
                                           postNotificationName:@"numberAgain"
                                           object:self];}];
}

@end
