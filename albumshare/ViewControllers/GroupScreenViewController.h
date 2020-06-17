//
//  GroupScreenViewController.h
//  albumshare
//
//  Created by Tim Häggqvist Luotomäki on 6/6/20.
//  Copyright © 2020 Tim Häggqvist Luotomäki. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GroupScreenViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *albumCollectionView;

@property (nonatomic) NSString *selectedGroup;
- (void) setSelectedGroup:(NSString * _Nonnull)selectedGroup;

@property (weak, nonatomic) IBOutlet UINavigationItem *NavigationTitle;



@end

NS_ASSUME_NONNULL_END
