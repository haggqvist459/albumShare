//
//  CreateAlbumViewController.m
//  albumshare
//
//  Created by Tim Häggqvist Luotomäki on 6/6/20.
//  Copyright © 2020 Tim Häggqvist Luotomäki. All rights reserved.
//

#import "CreateAlbumViewController.h"

@interface CreateAlbumViewController ()    
{
    NSArray *images;
}
@end

@implementation CreateAlbumViewController

static NSString * const reuseIdentifier = @"createAlbumCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.createAlbumCollectionView.dataSource = self;
    self.createAlbumCollectionView.delegate = self;
    
    images= @[
    @[@"space1",
      @"space2",
      @"space3",
      @"space4",
      @"space5",
      @"space6",
      @"space7",
      @"space8",
      @"space9",
      @"space10",
      @"space11",
      @"space12",
      @"space13",
      @"space14",
      @"space15",
      @"space16",
      @"space17",
      @"space18",
      @"space19",
      @"space20",
      @"space21",
      @"space22",
      @"space23",
      @"space24",
      @"space25",
      @"space26"
    ]];
}



- ( UICollectionViewCell *)collectionView:( UICollectionView *)collectionView cellForItemAtIndexPath:( NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:(reuseIdentifier) forIndexPath: indexPath];
    
    UIImageView* createAlbumCell = [[UIImageView alloc] initWithFrame:cell.frame];
    createAlbumCell.image = [UIImage imageNamed:images[indexPath.section][indexPath.item]];
    createAlbumCell.contentMode = UIViewContentModeScaleAspectFill;
    cell.backgroundView = createAlbumCell;
    
    return cell;
}



- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [[images objectAtIndex:section] count];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat padding = 3;
    CGFloat cellSize = collectionView.frame.size.width - padding;
    return CGSizeMake(cellSize / 3, cellSize / 3);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
