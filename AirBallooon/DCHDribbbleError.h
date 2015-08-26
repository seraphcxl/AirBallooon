//
//  DCHDribbbleError.h
//  FireBalllooon
//
//  Created by Derek Chen on 8/12/15.
//  Copyright (c) 2015 CHEN. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const str_DCHDribbbleErrorDomain;

typedef NS_ENUM(NSUInteger, DCHDribbbleErrorCode) {
    DCHDribbbleErrorCode_responseObjectError,
};

@interface DCHDribbbleError : NSObject

@end
