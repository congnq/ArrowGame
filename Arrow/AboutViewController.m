//
//  AboutViewController.m
//  Arrow
//
//  Created by 宋 奎熹 on 15/9/26.
//  Copyright © 2015年 宋 奎熹. All rights reserved.
//

#import "AboutViewController.h"
#import <MessageUI/MessageUI.h>

@interface AboutViewController ()

@end

@implementation AboutViewController

- (IBAction)sendBugEmail
{
    if (![MFMailComposeViewController canSendMail]) {
        NSLog(@"NO!");
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error!"
                                                            message:@"Cannot send email, perhaps you haven't set your email in settings."
                                                           delegate:self
                                                  cancelButtonTitle:@"Cancel"
                                                  otherButtonTitles:@"OK", nil];
        [alertView show];
        return;
    }
    
    MFMailComposeViewController *wMailViewController = [[MFMailComposeViewController alloc]init];
    wMailViewController.mailComposeDelegate = self;
    
    NSString *title = [NSString stringWithFormat:@"Arrow Feedbacks"];
    [wMailViewController setSubject:title];
    
    [wMailViewController setToRecipients:[NSArray arrayWithObject:@"krayc@foxmail.com"]];
    
    
    NSString *phoneVersion = [[UIDevice currentDevice] systemVersion];
    NSString *phoneModel  = [[UIDevice currentDevice] model];
    NSString *appVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    
    NSString *emailBody = [NSMutableString stringWithFormat:@"Arrows\n\nBugs:\n\nSuggestions:\n\nYour Name:\n\n"];
    emailBody = [emailBody stringByAppendingString: @"Phone Model:"];
    emailBody = [emailBody stringByAppendingString: phoneModel.description];
    emailBody = [emailBody stringByAppendingString: @"\niOS Version:"];
    emailBody = [emailBody stringByAppendingString: phoneVersion.description];
    emailBody = [emailBody stringByAppendingString: @"\nApp Version:"];
    emailBody = [emailBody stringByAppendingString: appVersion.description];

    [wMailViewController setMessageBody:emailBody isHTML:NO];
    
    [self presentViewController:wMailViewController animated:YES completion:nil];
}

- (IBAction)goBack
{
    [self dismissViewControllerAnimated:YES
                             completion:nil];
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result) {
        case MFMailComposeResultSent:
            NSLog(@"You sent the email.");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"You saved a draft of this email");
            break;
        case MFMailComposeResultCancelled:
            NSLog(@"You cancelled sending this email.");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail failed:  An error occurred when trying to compose this email");
            break;
        default:
            NSLog(@"An error occurred when trying to compose this email");
            break;
    }
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
