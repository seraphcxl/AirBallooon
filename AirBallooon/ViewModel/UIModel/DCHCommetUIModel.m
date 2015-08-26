//
//  DCHCommetUIModel.m
//  FireBalllooon
//
//  Created by Derek Chen on 8/12/15.
//  Copyright (c) 2015 CHEN. All rights reserved.
//

#import "DCHCommetUIModel.h"
#import "DCHUserUIModel.h"
#import "DCHDribbbleUserModel.h"
#import "DCHDribbbleCommentModel.h"
#import <Tourbillon/DCHTourbillon.h>

@implementation DCHCommetUIModel

- (instancetype)initWithCommentModel:(DCHDribbbleCommentModel *)commentModel {
    if (DCH_IsEmpty(commentModel)) {
        return nil;
    }
    self = [self init];
    if (self) {
        self.commentModel = commentModel;
        
        self.userUIModel = [[DCHUserUIModel alloc] init];
        self.userUIModel.userModel = commentModel.user;
        self.userUIModel.uuid = commentModel.user.id;
    }
    return self;
}

@end
