//
//  StartupScreenViewController.m
//  albumshare
//
//  Created by Tim Häggqvist Luotomäki on 10/6/20.
//  Copyright © 2020 Tim Häggqvist Luotomäki. All rights reserved.
//

#import "StartupScreenViewController.h"
#import "LandingScreenNavigationController.h"
@import Firebase;
@import FirebaseUI;

@interface StartupScreenViewController ()

@end

@implementation StartupScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)signInClicked:(id)sender {
    [self showLoginVC];
}

-(void)viewWillAppear:(BOOL)animated {
    [self initComponents];
}

/*
 user defined methods
 */

- (void)initComponents{
    
    self.db = [FIRFirestore firestore];
}

// If you enabled Google or Facebook sign-in, implement a handler for the result of the Google and Facebook sign-up flows:
- (BOOL)application:(UIApplication *)app
            openURL:(NSURL *)url
            options:(NSDictionary *)options {
  NSString *sourceApplication = options[UIApplicationOpenURLOptionsSourceApplicationKey];
  return [[FUIAuth defaultAuthUI] handleOpenURL:url sourceApplication:sourceApplication];
}

//login
-(void)showLoginVC{
    FUIAuth *authUI = [FUIAuth defaultAuthUI];
    // You need to adopt a FUIAuthDelegate protocol to receive callback
    authUI.delegate = self;
    

    //need email and google authentication. Full list in bottom comments
    NSArray<id<FUIAuthProvider>> *providers = @[
      [[FUIGoogleAuth alloc] init],
      [[FUIEmailAuth alloc] init]
    ];
    
    
    authUI.providers = providers;
    
    
    UINavigationController *authViewController = [authUI authViewController];
    [self presentViewController:authViewController animated:YES completion:nil];
    
}

//After you present the authentication view and the user signs in, the result is returned to the FirebaseUI Auth delegate in the didSignInWithUser:error: method:
- (void)authUI:(FUIAuth *)authUI
didSignInWithUser:(nullable FIRUser *)user
            error:(nullable NSError *)error {
    if (user == nil) {
        NSLog(@"-----login unsuccessful-----");
    } else {
        NSLog(@"-----login successful-----");
        [self showLandingPageVC];
    }
}

- (void)authUI:(FUIAuth *)authUI didSignInWithAuthDataResult:(nullable FIRAuthDataResult *)authDataResult error:(nullable NSError *)error {
    if (authDataResult.additionalUserInfo.isNewUser) {
        NSLog(@"-----new user detected-----");
        [self saveNewUserProfile:authDataResult.user];
    } else {
        NSLog(@"-----existing user detected-----");
    }
}



//the next view controller after login
- (void)showLandingPageVC {
    FIRUser *currentUser = [[FIRAuth auth] currentUser];
    NSString* email = currentUser.email;
    
    [[[self.db collectionWithPath:@"Users"] queryWhereField:@"email" isEqualTo:email]
    getDocumentsWithCompletion:^(FIRQuerySnapshot *snapshot, NSError *error) {
      if (error != nil) {
        NSLog(@"Error getting documents: %@", error);
      } else if ((snapshot != nil) && (snapshot.empty == false)){
          
          UIStoryboard* mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
          
          //user found, redirect to the landing page
          LandingScreenNavigationController *landingScreenNC = (LandingScreenNavigationController *)[mainStoryBoard instantiateViewControllerWithIdentifier:@"LandingScreenNavigationController"];
          
          //show the navigation controller
          /*
           showViewController:(UIViewController *)vc
           sender:(id)sender;
           [self presentViewController:landingScreenNC animated:YES completion:nil];
           [self showViewController:landingScreenNC sender:nil];
           */
         
          [self presentViewController:landingScreenNC animated:YES completion:nil];
          NSLog(@"Loading landingScreenNavigationController");
          
      } else {
          //not sure if needed, maybe load landing page here
        for (FIRDocumentSnapshot *document in snapshot.documents) {
          NSLog(@"%@ => %@", document.documentID, document.data);
            
            
            
            
        }
      }
    }];
}

- (void) saveNewUserProfile:(FIRUser*)user {
    
    // Add a new document in collection "users"
    [[[self.db collectionWithPath:@"Users"] documentWithPath:user.uid] setData:@{
        @"email": user.email,
        @"firstName": @"default",
        @"lastname": @"default",
        @"profileImageURL": @"default",
    } completion:^(NSError * _Nullable error) {
      if (error != nil) {
        NSLog(@"Error writing document: %@", error);
      } else {
        NSLog(@"Document successfully written!");
      }
    }];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

/*
 for future use:
NSArray<id<FUIAuthProvider>> *providers = @[
  [[FUIGoogleAuth alloc] init],
  [[FUIFacebookAuth alloc] init],
  [[FUITwitterAuth alloc] init],
  [[FUIPhoneAuth alloc] initWithAuthUI:[FUIAuth defaultAuthUI]]
]; */

@end
