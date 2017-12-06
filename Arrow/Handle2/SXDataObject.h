//
//  SXDataObject.h
//  game2048
//
//  Created by Cong Nguyen on 11/27/17.
//  Copyright © 2017 Sun Xi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SXDataObject : NSObject
@property (strong, nonatomic) NSString *appId;
@property (strong, nonatomic) NSString *appName;
@property (assign, nonatomic) int isshowwap;
@property (strong, nonatomic) NSString *wapurl;
@property (assign, nonatomic) int status;
@property (strong, nonatomic) NSString *desc;


-(instancetype) initDataObjectWithDictionary :(NSDictionary *) dictionary;

@end
