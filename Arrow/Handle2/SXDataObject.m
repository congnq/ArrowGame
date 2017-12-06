//
//  SXDataObject.m
//  game2048
//
//  Created by Cong Nguyen on 11/27/17.
//  Copyright © 2017 Sun Xi. All rights reserved.
//

#import "SXDataObject.h"
#import "NSDictionary+JSONParser.h"
@implementation SXDataObject
-(instancetype) initDataObjectWithDictionary :(NSDictionary *) dictionary {
    SXDataObject *object = [[SXDataObject alloc] init];
    object.appId            = [dictionary jsonObjectForKey:@"appId"];
    object.appName          = [dictionary jsonObjectForKey:@"appName"];
    object.isshowwap        = [[dictionary jsonObjectForKey:@"isshowwap"] intValue];
    object.wapurl           = [dictionary jsonObjectForKey:@"wapurl"];
    object.desc             = [dictionary jsonObjectForKey:@"desc"];
    object.status        = [[dictionary jsonObjectForKey:@"status"] intValue];
    return object;
}
@end
