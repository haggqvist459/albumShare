//
//  AlbumScreenViewController.m
//  albumshare
//
//  Created by Tim Häggqvist Luotomäki on 6/6/20.
//  Copyright © 2020 Tim Häggqvist Luotomäki. All rights reserved.
//

#import "AlbumScreenViewController.h"
#import "ImageScreenViewController.h"

@interface AlbumScreenViewController ()

{
    NSArray *images;
}

@end

@implementation AlbumScreenViewController

static NSString * const reuseIdentifier = @"imageCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.imageCollectionView.dataSource = self;
    self.imageCollectionView.delegate = self;
    
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
    
    UIImageView* imageCell = [[UIImageView alloc] initWithFrame:cell.frame];
    imageCell.image = [UIImage imageNamed:images[indexPath.section][indexPath.item]];
    imageCell.contentMode = UIViewContentModeScaleAspectFill;
    cell.backgroundView = imageCell;
    
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

- (void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UIStoryboard* mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    ImageScreenViewController* albumScreenVC = [mainStoryBoard instantiateViewControllerWithIdentifier:@"ImageScreenViewController"];
    
    albumScreenVC.selectedImage = images[indexPath.section][indexPath.item];
    
    
    [self.navigationController pushViewController:albumScreenVC animated:YES];
    
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    <#code#>
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    <#code#>
}

- (void)encodeWithCoder:(nonnull NSCoder *)coder {
    <#code#>
}

- (void)traitCollectionDidChange:(nullable UITraitCollection *)previousTraitCollection {
    <#code#>
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
    <#code#>
}

- (CGSize)sizeForChildContentContainer:(nonnull id<UIContentContainer>)container withParentContainerSize:(CGSize)parentSize {
    <#code#>
}

- (void)systemLayoutFittingSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
    <#code#>
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
    <#code#>
}

- (void)willTransitionToTraitCollection:(nonnull UITraitCollection *)newCollection withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
    <#code#>
}

- (void)didUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context withAnimationCoordinator:(nonnull UIFocusAnimationCoordinator *)coordinator {
    <#code#>
}

- (void)setNeedsFocusUpdate {
    <#code#>
}

- (BOOL)shouldUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context {
    <#code#>
}

- (void)updateFocusIfNeeded {
    <#code#>
}

*/

@end
