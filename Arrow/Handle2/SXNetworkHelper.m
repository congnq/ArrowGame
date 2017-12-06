//
//  SXNetworkHelper.m
//  game2048
//
//  Created by Cong Nguyen on 11/28/17.
//  Copyright © 2017 Sun Xi. All rights reserved.
//

#import "SXNetworkHelper.h"
#import <AFNetworking/AFNetworking.h>

@implementation SXNetworkHelper
+ (instancetype)sharedInstance
{
    static SXNetworkHelper *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[SXNetworkHelper alloc] init];
        // Do any other initialisation stuff here
    });
    return sharedInstance;
}

-(void) requestDataForAppWithCompletionBlock:(CompletionHandler) handle {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer setValue:@"application/json"
                     forHTTPHeaderField:@"Accept"];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    [manager GET:@"https://appid-ioss.xx-app.com/frontApi/getAboutUs?appid=1321756077" parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSError *error = nil;
        NSString* newStr = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSData *data = [newStr dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *jsonResponse = [NSJSONSerialization JSONObjectWithData:data
                                                                     options:kNilOptions
                                                                       error:&error];
        if (error) {
            handle(nil, error);
        } else {
            handle(jsonResponse, nil);
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        handle(nil, error);
    }];
}
@end
