//
//  NSDictionary+JSONParser.m
//  game2048
//
//  Created by Cong Nguyen on 11/27/17.
//  Copyright © 2017 Sun Xi. All rights reserved.
//

#import "NSDictionary+JSONParser.h"

@implementation NSDictionary (JSONParser)
- (id)jsonObjectForKey:(id)aKey {
    id object = [self objectForKey:aKey];
    if ([object isKindOfClass:[NSNull class]]) {
        object = nil;
    }
    
    return object;
}
@end
