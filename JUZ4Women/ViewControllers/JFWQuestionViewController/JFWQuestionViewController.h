//
//  JFWQuestionViewController.h
//  JUZ4Women
//
//  Created by Gautam Arora on 13/06/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "JFWQuestionView.h"

@interface JFWQuestionViewController : UIViewController<JFWQuestionViewDelegate>
{
    JFWQuestionView *jFWQuestionViewObj;
}

@end
