//
//  DCHDribbbleShotCollectionViewCell.m
//  FireBalllooon
//
//  Created by Derek Chen on 8/13/15.
//  Copyright (c) 2015 CHEN. All rights reserved.
//

#import "DCHDribbbleShotCollectionViewCell.h"
#import <Tourbillon/DCHTourbillon.h>
#import "DCHShotUIModel.h"

@interface DCHDribbbleShotCollectionViewCell ()

@property (nonatomic, strong) UIImageView *imgView;
@property (nonatomic, strong) UIImageView *avatorView;
@property (nonatomic, strong) UIImageView *infoBgdView;

@end

@implementation DCHDribbbleShotCollectionViewCell

- (void)updateConstraints {
    do {
        ;
    } while (NO);
}

- (void)updateWithUIModel:(DCHShotUIModel *)uiModel {
    do {
        if (DCH_IsEmpty(uiModel)) {
            break;
        }
    } while (NO);
}

@end
