//
//  SignUpView.h
//  JUZ4Women
//
//  Created by Aakash sharma on 14/06/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SignUpViewDelegate <NSObject>

-(void)signUpButtonTapped:(NSString *)realName andDisplayName:(NSString *)displayName;

@end

@interface SignUpView : UIView
{
    
}

@property(nonatomic, weak)id<SignUpViewDelegate> delegate;

@end
