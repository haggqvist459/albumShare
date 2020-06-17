//
//  StartupScreenViewController.h
//  albumshare
//
//  Created by Tim Häggqvist Luotomäki on 10/6/20.
//  Copyright © 2020 Tim Häggqvist Luotomäki. All rights reserved.
//

#import <UIKit/UIKit.h>
@import Firebase;
@import FirebaseUI;

NS_ASSUME_NONNULL_BEGIN

@interface StartupScreenViewController : UIViewController <FUIAuthDelegate>

@property FIRFirestore *db;

@end

NS_ASSUME_NONNULL_END
