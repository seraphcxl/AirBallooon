//
//  DCHDribbbleShotViewModel.h
//  FireBalllooon
//
//  Created by Derek Chen on 8/6/15.
//  Copyright (c) 2015 CHEN. All rights reserved.
//

#import "DCHViewModel.h"
#import "DCHMVVMKit.h"

@class DCHShotUIModel;
@class DCHCommetUIModel;
@class DCHDribbbleShotModel;

@interface DCHDribbbleShotViewModel : DCHViewModel

@property (nonatomic, strong, readonly) DCHMVVMCommand *getOneShotCmd;
@property (nonatomic, strong, readonly) DCHMVVMCommand *listCommentsForOneShotCmd;

@property (nonatomic, strong, readonly) DCHShotUIModel *shotUIModel;
@property (nonatomic, strong, readonly) NSArray *commentList;

- (instancetype)initWithShotModel:(DCHDribbbleShotModel *)shotModel;

@end
