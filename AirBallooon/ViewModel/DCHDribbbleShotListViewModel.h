//
//  DCHDribbbleShotListViewModel.h
//  FireBalllooon
//
//  Created by Derek Chen on 8/6/15.
//  Copyright (c) 2015 CHEN. All rights reserved.
//

#import "DCHViewModel.h"
#import "DCHMVVMKit.h"

@interface DCHDribbbleShotListViewModel : DCHViewModel

@property (nonatomic, strong, readonly) DCHMVVMCommand *listShotsCmd;

@property (nonatomic, strong, readonly) NSArray *shotList;

@end
