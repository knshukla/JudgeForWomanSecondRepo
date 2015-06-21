//
//  JFWForgotPasswordViewController.m
//  JUZ4Women
//
//  Created by Kailash on 5/10/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import "JFWForgotPasswordViewController.h"
#import "JFWUtilities.h"

@interface JFWForgotPasswordViewController ()

@end

@implementation JFWForgotPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
     [JFWUtilities setPlaceHolderTextColor:self.passwordTextField color:[JFWUtilities placeHolderTextColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)onSubmitButtonTapped:(id)sender
{
    [self.delegate onSubmitButtonTapped:self.passwordTextField.text];
}
@end
