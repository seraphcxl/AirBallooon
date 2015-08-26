//
//  DCHTeamUIModel.h
//  FireBalllooon
//
//  Created by Derek Chen on 8/8/15.
//  Copyright (c) 2015 CHEN. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DCHDribbbleTeamModel;

@interface DCHTeamUIModel : NSObject

@property (nonatomic, strong) DCHDribbbleTeamModel *teamModel;
@property (nonatomic, assign) NSUInteger uuid;
@property (nonatomic, strong) UIImage *avatorImg;

@end
