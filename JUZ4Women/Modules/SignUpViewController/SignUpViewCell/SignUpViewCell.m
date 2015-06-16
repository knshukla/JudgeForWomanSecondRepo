//
//  SignUpViewCell.m
//  JUZ4Women
//
//  Created by Aakash sharma on 03/05/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import "SignUpViewCell.h"

#import "JFWUtilities.h"
#import "ImageContstants.h"
#import "UserModel.h"
#import "DateModel.h"

@implementation SignUpViewCell

- (void)awakeFromNib
{
    // Initialization code
    [dateTextField setDelegate:self];
    [JFWUtilities setPlaceHolderTextColor:dateTextField color:[JFWUtilities placeHolderTextColor]];
    
    [monthTextField setDelegate:self];
    [JFWUtilities setPlaceHolderTextColor:monthTextField color:[JFWUtilities placeHolderTextColor]];
    
    [yearTextField setDelegate:self];
    [JFWUtilities setPlaceHolderTextColor:yearTextField color:[JFWUtilities placeHolderTextColor]];
    
    [countryTextField setDelegate:self];
    [JFWUtilities setPlaceHolderTextColor:countryTextField color:[JFWUtilities placeHolderTextColor]];
    
    [securityCodeTextField setDelegate:self];
    
    [cityTextField setDelegate:self];
    [JFWUtilities setPlaceHolderTextColor:cityTextField color:[JFWUtilities placeHolderTextColor]];
    
    [emailTextField setDelegate:self];
    [JFWUtilities setPlaceHolderTextColor:emailTextField color:[JFWUtilities placeHolderTextColor]];
    
    [passwordTextField setDelegate:self];
    [JFWUtilities setPlaceHolderTextColor:passwordTextField color:[JFWUtilities placeHolderTextColor]];
    
}


-(void)setDataOnCell
{
    [self showSignUpView];
    
    [self setCellBackgroundImage];
}

-(void)showSignUpView
{
    switch (self.signUpScreenType)
    {
        case DATE_OF_BIRTH_SCREEN:
            
            [self showView:dateOfBirthContainerView mode:YES];
            [self showView:signupOptionContainerView mode:NO];
            [self showView:usernamePasswordContainerView mode:NO];
            [self showView:securityCodeContainerView mode:NO];
            [self showView:selectCountryContainerView mode:NO];
            
            break;
            
        case SIGNUP_OPTION_TYPE_SCREEN:
            
            [self showView:dateOfBirthContainerView mode:NO];
            [self showView:signupOptionContainerView mode:YES];
            [self showView:usernamePasswordContainerView mode:NO];
            [self showView:securityCodeContainerView mode:NO];
            [self showView:selectCountryContainerView mode:NO];
            
            break;
            
        case USERNAME_PASSWORD_SCREEN:
            
            [self showView:dateOfBirthContainerView mode:NO];
            [self showView:signupOptionContainerView mode:NO];
            [self showView:usernamePasswordContainerView mode:YES];
            [self showView:securityCodeContainerView mode:NO];
            [self showView:selectCountryContainerView mode:NO];
            
            [self setSignInPlaceHolderText];
            
            break;
            
        case SECURITY_CODE_SCREEN:
            
            [self showView:dateOfBirthContainerView mode:NO];
            [self showView:signupOptionContainerView mode:NO];
            [self showView:usernamePasswordContainerView mode:NO];
            [self showView:securityCodeContainerView mode:YES];
            [self showView:selectCountryContainerView mode:NO];
            
            [self setSecurityCodeMessage];
            
            break;
            
        case LOCATION_SCREEN:
            
            [self showView:dateOfBirthContainerView mode:NO];
            [self showView:signupOptionContainerView mode:NO];
            [self showView:usernamePasswordContainerView mode:NO];
            [self showView:securityCodeContainerView mode:NO];
            [self showView:selectCountryContainerView mode:YES];
            
            break;
            
        default:
            break;
    }
}

-(void)setCellBackgroundImage
{
    UIImage *image = nil;
    
    switch (self.signUpScreenType)
    {
        case DATE_OF_BIRTH_SCREEN:
            
            image = [UIImage imageNamed:DATE_OF_BIRTH_CELL_BACKGROUND_IMAGE];
            
            break;
            
        case SIGNUP_OPTION_TYPE_SCREEN:
            
            image = [UIImage imageNamed:SIGNUP_OPTION_CELL_BACKGROUND_IMAGE];
            
            break;
            
        case USERNAME_PASSWORD_SCREEN:
            
            if (self.signUpOption == EMAIL)
                image = [UIImage imageNamed:MAIL_CELL_BACKGROUND_IMAGE];
            else
                image = [UIImage imageNamed:MOBILE_PASSWORD_CELL_BACKGROUND_IMAGE];
            
            break;
            
        case SECURITY_CODE_SCREEN:
            
            if (self.signUpOption == EMAIL)
                image = [UIImage imageNamed:EMAIL_VERIFICATION_CELL_BACKGROUND_IMAGE];
            else
                image = [UIImage imageNamed:PHONE_BACKGROUND_IMAGE];
            
            break;
            
        case LOCATION_SCREEN:
            
            image = [UIImage imageNamed:CITY_CELL_BACKGROUND_IMAGE];
            
            break;
            
        default:
            break;
    }
    
    [backgroundImage setImage:image];
}

-(void)showView:(UIView *)view mode:(BOOL)mode
{
    if (!view)
    {
        return;
    }
    
    [view setHidden:!mode];
}

-(void)setSecurityCodeMessage
{
    NSString *message = nil;
    
    switch (self.signUpOption)
    {
        case EMAIL:
            message = NSLocalizedString(@"EMAIL_SECURITY_CODE_TEXT", nil);
            break;
            
        case MOBILE:
            message = NSLocalizedString(@"MOBILE_SECURITY_CODE_TEXT", nil);
            break;
            
        default:
            break;
    }
    
    [securityCodeMessageLabel setText:message];
}

-(void)setSignInPlaceHolderText
{
    NSString *message = nil;
    
    switch (self.signUpOption)
    {
        case EMAIL:
            message = NSLocalizedString(@"EMAIL_TEXT", nil);
            
            [emailTextField setKeyboardType:UIKeyboardTypeDefault];
            break;
            
        case MOBILE:
            message = NSLocalizedString(@"MOBILE_NUMBER", nil);
            [emailTextField setKeyboardType:UIKeyboardTypeNamePhonePad];
            break;
            
        default:
            break;
    }
    
    [emailTextField setPlaceholder:message];
    [JFWUtilities setPlaceHolderTextColor:emailTextField color:[JFWUtilities placeHolderTextColor]];
}

-(BOOL)checkAllMandatoryFieldsFilled
{
    BOOL mode = YES;
    
    switch (self.signUpScreenType)
    {
        case DATE_OF_BIRTH_SCREEN:
            
            if (dateTextField.text.length == 0 || monthTextField.text.length == 0 || yearTextField.text.length == 0)
                mode = NO;
            
            break;
            
        case SIGNUP_OPTION_TYPE_SCREEN:
            
            mode = NO;
            
            break;
            
        case USERNAME_PASSWORD_SCREEN:
            
            if (emailTextField.text.length == 0 || passwordTextField.text.length == 0)
                mode = NO;
            else if (self.signUpOption == EMAIL && ![JFWUtilities validateEmailWithString:emailTextField.text])
                mode = NO;
            else if (self.signUpOption == MOBILE && emailTextField.text.length !=10)
                mode = NO;
            
            break;
            
        case SECURITY_CODE_SCREEN:
            
            if (securityCodeTextField.text.length == 0)
                mode = NO;
            
            break;
            
        case LOCATION_SCREEN:
         
         if (countryTextField.text.length == 0 || cityTextField.text.length == 0)
             mode = NO;
            break;
            
        default:
            break;
    }
    
    return mode;

}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self endEditing:YES];
}

#pragma mark - UITextField Delegate methods

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
    return YES;
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    BOOL mode = [self checkAllMandatoryFieldsFilled];
    
    [self fillUserModel];

    if ([self.delegate respondsToSelector:@selector(disableNextButton:)])
    {
        [self.delegate disableNextButton:!mode];
    }
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}


#pragma mark - UIButton event methods

- (IBAction)emailButtonTapped:(id)sender
{
    self.user.signUpOption = EMAIL;
    
    [self signUpOptionDidSelect:EMAIL];
}

- (IBAction)mobileButtonTapped:(id)sender
{
    self.user.signUpOption = MOBILE;
    
    [self signUpOptionDidSelect:MOBILE];
}

-(void)signUpOptionDidSelect:(SignUpOption)option
{
    if ([self.delegate respondsToSelector:@selector(signUpOptionSelected:)])
    {
        [self.delegate signUpOptionSelected:option];
    }
}

-(void)fillUserModel
{
    switch (self.signUpScreenType)
    {
        case DATE_OF_BIRTH_SCREEN:
            
            if (!self.user.dateOfBirth) {
                self.user.dateOfBirth = [[DateModel alloc]initWithDay:[dateTextField.text intValue] month:[monthTextField.text intValue] andYear:[yearTextField.text intValue]];
            }
            
            self.user.dateOfBirth.dd = [dateTextField.text intValue];
            self.user.dateOfBirth.mm = [monthTextField.text intValue];
            self.user.dateOfBirth.yyyy = [yearTextField.text intValue];
            
            break;
            
        case USERNAME_PASSWORD_SCREEN:
            
            if (self.signUpOption == MOBILE) {
                self.user.mobileNumber = [NSNumber numberWithInteger:[emailTextField.text integerValue]];
            }
            else
                self.user.emailAddress = emailTextField.text;
            self.user.password = passwordTextField.text;
            
            break;
            
        case SECURITY_CODE_SCREEN:
            
            self.user.verificationCode = [NSNumber numberWithInt:[securityCodeTextField.text intValue]];
            
            break;
            
        case LOCATION_SCREEN:
            
            self.user.city = cityTextField.text;
            self.user.country = countryTextField.text;
            
            break;
            
        default:
            break;
    }
}
@end

@implementation UITextField (CUSTOM_BOUNDS)

- (CGRect)textRectForBounds:(CGRect)bounds
{
    return CGRectInset( bounds , 10 , 10 );
}

// text position
- (CGRect)editingRectForBounds:(CGRect)bounds {
    return CGRectInset( bounds , 10 , 10 );
}

@end
