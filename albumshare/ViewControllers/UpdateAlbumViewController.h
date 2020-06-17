//
//  UpdateAlbumViewController.h
//  albumshare
//
//  Created by Tim Häggqvist Luotomäki on 6/6/20.
//  Copyright © 2020 Tim Häggqvist Luotomäki. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UpdateAlbumViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *updateAlbumCollectionView;

@end

NS_ASSUME_NONNULL_END
