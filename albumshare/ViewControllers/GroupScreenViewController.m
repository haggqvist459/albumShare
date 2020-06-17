//
//  GroupScreenViewController.m
//  albumshare
//
//  Created by Tim Häggqvist Luotomäki on 6/6/20.
//  Copyright © 2020 Tim Häggqvist Luotomäki. All rights reserved.
//

#import "GroupScreenViewController.h"

@interface GroupScreenViewController ()
{
    NSArray *album;
}
@end

@implementation GroupScreenViewController

static NSString * const reuseIdentifier = @"albumCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.albumCollectionView.dataSource = self;
    self.albumCollectionView.delegate = self;
    
    self.NavigationTitle.title = _selectedGroup;
    
    album= @[
    @[@"Space",
      @"BlueMountains",
      @"Aquarium"
    ]];
}

- ( UICollectionViewCell *)collectionView:( UICollectionView *)collectionView cellForItemAtIndexPath:( NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:(reuseIdentifier) forIndexPath: indexPath];
    
    UIImageView* albumCell = [[UIImageView alloc] initWithFrame:cell.frame];
    albumCell.image = [UIImage imageNamed:album[indexPath.section][indexPath.item]];
    albumCell.contentMode = UIViewContentModeScaleAspectFill;
    cell.backgroundView = albumCell;
    
    return cell;
}



- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [[album objectAtIndex:section] count];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat padding = 3;
    CGFloat cellSize = collectionView.frame.size.width - padding;
    return CGSizeMake(cellSize / 2, cellSize / 2);
}








#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
