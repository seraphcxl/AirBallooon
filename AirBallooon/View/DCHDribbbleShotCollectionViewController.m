//
//  DCHDribbbleShotCollectionViewController.m
//  FireBalllooon
//
//  Created by Derek Chen on 8/6/15.
//  Copyright (c) 2015 CHEN. All rights reserved.
//

#import "DCHDribbbleShotCollectionViewController.h"

#import "DCHDribbbleRequest.h"
#import "DCHDribbbleAPIHelper.h"

#import "DCHDribbbleShotListModel.h"
#import "DCHDribbbleShotModel.h"
#import "DCHDribbbleShotImagesModel.h"
#import "DCHDribbbleUserModel.h"
#import "DCHDribbbleTeamModel.h"

#import "DCHDribbbleShotListViewModel.h"
#import "DCHDribbbleShotViewModel.h"

#import <KVOController/FBKVOController.h>

@interface DCHDribbbleShotCollectionViewController ()

@property (nonatomic, strong) DCHDribbbleShotListViewModel *shotListVM;

@end

@implementation DCHDribbbleShotCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    DCHDribbbleListShotsRequest *listShotsReq = [[DCHDribbbleListShotsRequest alloc] init];
    listShotsReq.page = 1;
    listShotsReq.perPage = 12;
    
    //    [[DCHDribbbleAPIHelper sharedDCHDribbbleAPIHelper] listShots:listShotsReq withCompletion:^(id content, NSError *error) {
    //        do {
    //            if (!DCH_IsEmpty(content)) {
    //                DCHDribbbleShotListModel *listModel = (DCHDribbbleShotListModel *)content;
    //                int i = 0;
    //            }
    //        } while (NO);
    //    }];
    
    self.shotListVM = [[DCHDribbbleShotListViewModel alloc] init];
    [self.shotListVM.listShotsCmd resetExecuteObserver:^(DCHMVVMCommand *command, BOOL executing) {
        do {
            NSLog(@"%@ %d", command, executing);
        } while (NO);
    }];
    
    [self.KVOController observe:self.shotListVM keyPath:@"shotList" options:NSKeyValueObservingOptionNew block:^(id observer, id object, NSDictionary *change) {
        do {
            int i = 0;
        } while (NO);
    }];
    
    [self.shotListVM.listShotsCmd asyncExecute:@[listShotsReq]];
    
    // Register cell classes
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
#warning Incomplete method implementation -- Return the number of sections
    return 0;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete method implementation -- Return the number of items in the section
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
