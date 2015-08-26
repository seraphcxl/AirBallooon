//
//  DCHUserUIModel.h
//  FireBalllooon
//
//  Created by Derek Chen on 8/8/15.
//  Copyright (c) 2015 CHEN. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DCHDribbbleUserModel;

@interface DCHUserUIModel : NSObject

@property (nonatomic, strong) DCHDribbbleUserModel *userModel;
@property (nonatomic, assign) NSUInteger uuid;
@property (nonatomic, strong) UIImage *avatorImg;

@end
