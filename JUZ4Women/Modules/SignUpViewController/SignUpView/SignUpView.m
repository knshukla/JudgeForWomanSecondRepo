//
//  SignUpView.m
//  JUZ4Women
//
//  Created by Aakash sharma on 14/06/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import "SignUpView.h"

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

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (IBAction)signUpButtonTapped:(id)sender {
}

- (IBAction)cameraButtonTapped:(id)sender {
}
@end
