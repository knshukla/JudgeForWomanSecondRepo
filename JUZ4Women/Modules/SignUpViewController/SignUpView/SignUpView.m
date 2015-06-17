//
//  SignUpView.m
//  JUZ4Women
//
//  Created by Aakash sharma on 14/06/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import "SignUpView.h"
#import "JFWUtilities.h"

@interface SignUpView ()
{
    __weak IBOutlet UIButton *cameraButton;
    __weak IBOutlet UITextField *realNameTextField;
    __weak IBOutlet UITextField *displayNameTextField;
    __weak IBOutlet UIButton *signUpButton;
    
}
- (IBAction)signUpButtonTapped:(id)sender;
- (IBAction)cameraButtonTapped:(id)sender;

@end


@implementation SignUpView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        [self loadNib];
    }
    
    return self;
}

-(void)loadNib
{
    NSArray *nibs = [[NSBundle mainBundle]loadNibNamed:@"SignUpView" owner:self options:nil];
    
    UIView *view = [nibs lastObject];
    
    view.frame = self.bounds;
    
    [self addSubview:view];
    
    [self initView];
}

-(void)initView
{
    [self setTextFieldAppearence];
}

-(void)setTextFieldAppearence
{
    [JFWUtilities setPlaceHolderTextColor:realNameTextField color:[JFWUtilities placeHolderTextColor]];
    [JFWUtilities setPlaceHolderTextColor:displayNameTextField color:[JFWUtilities placeHolderTextColor]];
}

- (IBAction)signUpButtonTapped:(id)sender
{
   if(![self checkAllMandatoryFields])
   {
       [self showAllFieldMandatryAlert];
       return;
   }
    
    if ([self.delegate respondsToSelector:@selector(signUpButtonTapped:andDisplayName:)]) {
        [self.delegate signUpButtonTapped:realNameTextField.text andDisplayName:displayNameTextField.text];
    }
}

- (IBAction)cameraButtonTapped:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(showImagePicker)])
    {
        [self.delegate showImagePicker];
    }
}

-(BOOL)checkAllMandatoryFields
{
    if (realNameTextField.text.length == 0 || displayNameTextField.text.length == 0)
    {
        return NO;
    }
    
    return YES;
}

-(void)showAllFieldMandatryAlert
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"All fieldsare manadatory" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    
    [alert show];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}



@end
