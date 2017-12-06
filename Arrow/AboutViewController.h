//
//  AboutViewController.h
//  Arrow
//
//  Created by 宋 奎熹 on 15/9/26.
//  Copyright © 2015年 宋 奎熹. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h> 

@interface AboutViewController : UIViewController<MFMailComposeViewControllerDelegate>

@property (nonatomic, weak) IBOutlet UIButton *sendButton;
@property (nonatomic, weak) IBOutlet UIButton *backButton;

@end
