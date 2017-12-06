//
//  SXNetworkHelper.h
//  game2048
//
//  Created by Cong Nguyen on 11/28/17.
//  Copyright © 2017 Sun Xi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SXDataObject.h"

typedef void(^CompletionHandler)(id data, NSError *error);
@interface SXNetworkHelper : NSObject
+ (instancetype)sharedInstance;
-(void) requestDataForAppWithCompletionBlock:(CompletionHandler) handle;

@end
