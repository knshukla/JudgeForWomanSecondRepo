//
//  SignUpViewCell.h
//  JUZ4Women
//
//  Created by Aakash sharma on 03/05/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "JFWAppConstants.h"
@class UserModel;

@protocol  SignUpViewCellDelegate <NSObject>

-(void)disableNextButton:(BOOL)mode;

-(void)signUpOptionSelected:(SignUpOption)option;

@end

@interface SignUpViewCell : UICollectionViewCell<UITextFieldDelegate>
{
    __weak IBOutlet UIImageView *backgroundImage;
    
    // date of birth cell Outlets
    __weak IBOutlet UIView *dateOfBirthContainerView;
    
    __weak IBOutlet UITextField *yearTextField;
    __weak IBOutlet UITextField *monthTextField;
    __weak IBOutlet UITextField *dateTextField;
    
    // signUp option cell outlets
    
    __weak IBOutlet UIView *signupOptionContainerView;
    
    // user name/password fields outlet
    
    __weak IBOutlet UIView *usernamePasswordContainerView;
    __weak IBOutlet UITextField *passwordTextField;
    __weak IBOutlet UITextField *emailTextField;
    
    // Select Country View
    
    __weak IBOutlet UIView *securityCodeContainerView;
    __weak IBOutlet UITextField *countryTextField;
    __weak IBOutlet UITextField *cityTextField;
    __weak IBOutlet UIView *selectCountryContainerView;
    
    // SecurityCode Container View
    
    __weak IBOutlet UITextField *securityCodeTextField;
    __weak IBOutlet UILabel *securityCodeMessageLabel;
    
}

// signUp option Button Events
- (IBAction)emailButtonTapped:(id)sender;
- (IBAction)mobileButtonTapped:(id)sender;

@property(nonatomic,weak)id <SignUpViewCellDelegate> delegate;

@property(nonatomic, assign)SignUpScreenType signUpScreenType;
@property(nonatomic, assign)SignUpOption signUpOption;

@property(nonatomic, retain) UserModel *user;

-(void)setDataOnCell;
-(BOOL)checkAllMandatoryFieldsFilled;

@end
