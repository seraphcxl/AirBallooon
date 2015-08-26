//
//  DCHJSONResponseSerializer.m
//  FireBalllooon
//
//  Created by Derek Chen on 8/4/15.
//  Copyright (c) 2015 CHEN. All rights reserved.
//

#import "DCHJSONResponseSerializer.h"
#import <Tourbillon/DCHTourbillon.h>

NSString * const kJSONRootArray = @"kJSONRootArray";

@implementation DCHJSONResponseSerializer

#pragma mark - AFURLResponseSerialization

- (id)responseObjectForResponse:(NSURLResponse *)response
                           data:(NSData *)data
                          error:(NSError *__autoreleasing *)error {
    id result = nil;
    do {
        result = [super responseObjectForResponse:response data:data error:error];
        
        if (!DCH_IsEmpty(result)) {
            if ([result isKindOfClass:[NSArray class]]) {
                return @{kJSONRootArray: result};
            }
        }
    } while (NO);
    return result;
}

@end
