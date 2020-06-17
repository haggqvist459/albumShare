//
//  ImageScreenViewController.h
//  albumshare
//
//  Created by Tim Häggqvist Luotomäki on 6/6/20.
//  Copyright © 2020 Tim Häggqvist Luotomäki. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ImageScreenViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *selectedPhotoImageView;

@property (nonatomic) NSString *selectedImage;
- (void) setSelectedImage:(NSString * _Nonnull)selectedImage;

@end

NS_ASSUME_NONNULL_END
