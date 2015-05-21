//
//  JFWLoginViewController.h
//  JUZ4Women
//
//  Created by Kailash on 5/10/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JFWLoginViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIScrollView *scrollViewObj;

@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UIImageView *logoImageView;

@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;



- (IBAction)onSignInButtonTapped:(id)sender;

- (IBAction)onFacebookButtonTapped:(id)sender;

- (IBAction)onGooglePlusButtonTapped:(id)sender;

- (IBAction)onForgotPasswordButtonTapped:(id)sender;

- (IBAction)onSignUpButtonTapped:(id)sender;


@end
