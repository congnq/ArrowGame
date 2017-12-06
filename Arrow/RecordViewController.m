//
//  RecordViewController.m
//  Arrow
//
//  Created by 宋 奎熹 on 15/10/30.
//  Copyright © 2015年 宋 奎熹. All rights reserved.
//

#import "RecordViewController.h"
#import "RecordTableViewCell.h"
#import "Record.h"

@interface RecordViewController ()

@end

@implementation RecordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    _classicRecord = [Record readClassicRecord];
//    _numberRecord = [Record readNumberRecord];
//    _hellRecord = [Record readHellRecord];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *id = @"Cell";
    RecordTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:id];
    if(cell == nil){
        NSArray *views = [[NSBundle mainBundle]
                          loadNibNamed:@"RecordTableViewCell" owner:nil options:nil];
        for(UIView *view in views){
            if([view isKindOfClass:[RecordTableViewCell class]]){
                cell = (RecordTableViewCell *) view;
            }
        }
    }
    
    switch(indexPath.section){
        case 0:
            cell.nameLabel.text = [[_classicRecord objectAtIndex:indexPath.row] objectAtIndex:0];
            cell.scoreLabel.text = [[_classicRecord objectAtIndex:indexPath.row] objectAtIndex:1];
            break;
        case 1:
            cell.nameLabel.text = [[_numberRecord objectAtIndex:indexPath.row] objectAtIndex:0];
            cell.scoreLabel.text = [[_numberRecord objectAtIndex:indexPath.row] objectAtIndex:1];
            break;
        case 2:
            cell.nameLabel.text = [[_hellRecord objectAtIndex:indexPath.row] objectAtIndex:0];
            cell.scoreLabel.text = [[_hellRecord objectAtIndex:indexPath.row] objectAtIndex:1];
            break;
    }
    
    return cell;
}

//Set headers:
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *header;
    switch (section) {
        case 0:
            header = @"Classic";
            break;
        case 1:
            header = @"Arcade";
            break;
        case 2:
            header = @"Hell";
            break;
        default:
            break;
    }
    return header;
}

//return rows of different sections:
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger n = 0;
    switch (section) {
        case 0:
            n = [_classicRecord count];
            break;
        case 1:
            n = [_numberRecord count];
            break;
        case 2:
            n = [_hellRecord count];
            break;
        default:
            break;
    }
    return n;
}

//3 sections
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (IBAction)goBack
{
    [self dismissViewControllerAnimated:YES
                             completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
