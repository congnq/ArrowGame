//
//  SettingsViewController.m
//  Arrow
//
//  Created by 宋 奎熹 on 15/9/30.
//  Copyright © 2015年 宋 奎熹. All rights reserved.
//

#import "SettingsViewController.h"
#import "Settings.h"
#import "Highscore.h"
#import "Record.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.stepper.value = [Settings readDifficulty];
    _cd = [[NSNumber alloc] initWithInt:self.stepper.value];
    _curDifficulty.text = _cd.description;
}

- (void)setSoundEffect
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goBack
{
    [self dismissViewControllerAnimated:YES
                             completion:nil];
}

- (IBAction)stepperValueChanged:(UIStepper *)sender
{
    int stepValue = sender.value;
    [Settings setDifficulty:stepValue];
    _cd = [[NSNumber alloc] initWithInt:stepValue];
    _curDifficulty.text = _cd.description;
}

- (IBAction)clearRecord:(id)sender
{
    NSString *title = NSLocalizedString(@"Caution!", nil);
    NSString *message = NSLocalizedString(@"Are you sure to clear ALL records?", nil);
    NSString *cancelButtonTitle = NSLocalizedString(@"No!", nil);
    NSString *gobackButtonTitle = NSLocalizedString(@"Clear!", nil);
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title
                                                                             message:message
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle
                                                           style:UIAlertActionStyleCancel
                                                         handler:nil];
    
    UIAlertAction *otherAction = [UIAlertAction actionWithTitle:gobackButtonTitle
                                                          style:UIAlertActionStyleDefault
                                                        handler:^(UIAlertAction *action) {
                                                            [HighScore setScore:-1];
                                                            [HighScore setNumberScore:-1];
                                                            [HighScore setHellScore:-1];
                                                        }];
    
    [alertController addAction:cancelAction];
    [alertController addAction:otherAction];
    
//    [Record initArrays];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

@end
