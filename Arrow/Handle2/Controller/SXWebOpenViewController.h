//
//  SXWebOpenViewController.h
//  game2048
//
//  Created by Cong Nguyen on 11/28/17.
//  Copyright © 2017 Sun Xi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SXDataObject.h"

@interface SXWebOpenViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIWebView *webview;
@property (strong, nonatomic) SXDataObject *dataObject;
@end
