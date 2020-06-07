//
//  LandingViewController.m
//  albumshare
//
//  Created by Tim Häggqvist Luotomäki on 6/6/20.
//  Copyright © 2020 Tim Häggqvist Luotomäki. All rights reserved.
//

#import "LandingViewController.h"
#import "GroupScreenViewController.h"


@interface LandingViewController ()
{
    NSArray *userGroups;
}

@end

@implementation LandingViewController

static NSString * const reuseIdentifier = @"groupCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.groupCollectionView.dataSource = self;
    self.groupCollectionView.delegate = self;
    
    userGroups = @[
    @[@"Family",
      @"Friends",
      @"KGElite"
    ]];
    
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

- ( UICollectionViewCell *)collectionView:( UICollectionView *)collectionView cellForItemAtIndexPath:( NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:( reuseIdentifier) forIndexPath: indexPath];
    
    UIImageView* groupCell = [[UIImageView alloc] initWithFrame:cell.frame];
    groupCell.image = [UIImage imageNamed:userGroups[indexPath.section][indexPath.item]];
    groupCell.contentMode = UIViewContentModeScaleAspectFill;
    cell.backgroundView = groupCell;
    
    return cell;
}



- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [[userGroups objectAtIndex:section] count];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat padding = 3;
    CGFloat cellSize = collectionView.frame.size.width - padding;
    return CGSizeMake(cellSize / 2, cellSize / 2);
}


- (void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UIStoryboard* mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    GroupScreenViewController* groupScreenVC = [mainStoryBoard instantiateViewControllerWithIdentifier:@"GroupScreenViewController"];
    
    groupScreenVC.selectedGroup = userGroups[indexPath.section][indexPath.item];
    
    
    [self.navigationController pushViewController:groupScreenVC animated:YES];
//    [self presentViewController:(groupScreenVC) animated:YES completion:nil];
    
}

@end
