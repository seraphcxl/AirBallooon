//
//  DCHDribbbleShotListModel.h
//  FireBalllooon
//
//  Created by Derek Chen on 8/4/15.
//  Copyright (c) 2015 CHEN. All rights reserved.
//

#import "DCHOptionalJSONModel.h"
#import "DCHDribbbleShotModel.h"
#import "DCHJSONResponseSerializer.h"

@protocol DCHDribbbleShotListModel <NSObject> @end

@interface DCHDribbbleShotListModel : DCHOptionalJSONModel

@property (strong, nonatomic) NSArray<DCHDribbbleShotModel>* kJSONRootArray;

@end
