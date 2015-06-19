//
//  JFWForgotPasswordViewController.h
//  JUZ4Women
//
//  Created by Kailash on 5/10/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ForgetPasswordDelegate

- (void)onSubmitButtonTapped:(NSString *)password;

@end
@interface JFWForgotPasswordViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

- (IBAction)onSubmitButtonTapped:(id)sender;

@property (nonatomic) id <ForgetPasswordDelegate> delegate;

@end
