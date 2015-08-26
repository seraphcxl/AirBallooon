//
//  DCHShotImageUIModel.h
//  FireBalllooon
//
//  Created by Derek Chen on 8/8/15.
//  Copyright (c) 2015 CHEN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DCHShotImageUIModel : NSObject

@property (nonatomic, assign) NSUInteger uuid;
@property (nonatomic, strong) UIImage *hidpiImg;
@property (nonatomic, strong) UIImage *normalImg;
@property (nonatomic, strong) UIImage *teaserImg;

@end
