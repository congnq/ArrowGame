//
//  RecordViewController.h
//  Arrow
//
//  Created by 宋 奎熹 on 15/10/30.
//  Copyright © 2015年 宋 奎熹. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecordViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UIButton *backButton;

@property (nonatomic) NSArray *classicName;
@property (nonatomic) NSArray *numberName;
@property (nonatomic) NSArray *hellName;

@property (nonatomic) NSArray *classicRecord;
@property (nonatomic) NSArray *numberRecord;
@property (nonatomic) NSArray *hellRecord;

@end
