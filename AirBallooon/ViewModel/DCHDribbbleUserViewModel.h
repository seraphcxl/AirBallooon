//
//  DCHDribbbleUserViewModel.h
//  FireBalllooon
//
//  Created by Derek Chen on 8/12/15.
//  Copyright (c) 2015 CHEN. All rights reserved.
//

#import "DCHViewModel.h"
#import "DCHMVVMKit.h"

@interface DCHDribbbleUserViewModel : DCHViewModel

@property (nonatomic, strong, readonly) DCHMVVMCommand *queryOneUserCmd;
@property (nonatomic, strong, readonly) DCHMVVMCommand *listUserShotsCmd;

@end
