//
//  DCHDribbbleRequest.m
//  FireBalllooon
//
//  Created by Derek Chen on 8/3/15.
//  Copyright (c) 2015 CHEN. All rights reserved.
//

#import "DCHDribbbleRequest.h"
#import <objc/runtime.h>
#import "AutoCoding.h"

@interface DCHDribbbleRequest ()

@end

@implementation DCHDribbbleRequest
- (NSDictionary *)parameters {
    NSDictionary * parameters = [self dictionaryRepresentation];
    return parameters.count ? parameters : nil;
}

- (NSString *)endpoint {
    NSAssert(self.url && self.url.length, @"Are you kiding ?! The URI endpoint for requset should not be empty");
    
    if ( [self.url hasPrefix:@"/"] ) {
        self.url = [self.url substringFromIndex:1];
    }
    
    NSArray * partials = [self.url componentsSeparatedByString:@"/"];
    
    NSArray * targets = [partials filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF beginswith[c] ':'"]];
    
    __block NSMutableString * path = [self.url mutableCopy];
    
    [targets enumerateObjectsUsingBlock:^(NSString * str, __unused NSUInteger idx, __unused BOOL *stop) {
        NSString * keyPath = [str stringByReplacingOccurrencesOfString:@":" withString:@""];
        keyPath = [keyPath stringByDeletingPathExtension];
        
        NSString * param = [self valueForKeyPath:keyPath];
        
        [path replaceOccurrencesOfString:str withString:[param description] options:NSCaseInsensitiveSearch range:NSMakeRange(0, path.length)];
    }];
    
    return path;
}

@end

@implementation DCHDribbbleListShotsRequest

- (instancetype)init {
    self = [super init];
    if (self) {
        self.url = @"/shots";
    }
    return self;
}

@end

@implementation DCHDribbbleGetOneShotRequest

- (instancetype)init {
    self = [super init];
    if (self) {
        self.url = @"/shots/:id";
    }
    return self;
}

@end

@implementation DCHDribbbleListCommentsForOneShotRequest

- (instancetype)init {
    self = [super init];
    if (self) {
        self.url = @"/shots/:shot/comments";
    }
    return self;
}

@end

@implementation DCHDribbbleQueryOneUserRequest

- (instancetype)init {
    self = [super init];
    if (self) {
        self.url = @"/users/:user";
    }
    return self;
}

@end

@implementation DCHDribbbleListUserShotsRequest

- (instancetype)init {
    self = [super init];
    if (self) {
        self.url = @"/users/:user/shots";
    }
    return self;
}

@end
