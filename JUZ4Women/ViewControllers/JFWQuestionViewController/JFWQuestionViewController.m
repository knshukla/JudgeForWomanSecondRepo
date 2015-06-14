//
//  JFWQuestionViewController.m
//  JUZ4Women
//
//  Created by Gautam Arora on 13/06/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import "JFWQuestionViewController.h"
//models
#import "OptionModel.h"



@implementation JFWQuestionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self doSettingsForNavigationBar];

}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self loadQuestionView];
}

#pragma mark - Navigation bar methods
-(void)doSettingsForNavigationBar
{
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.title = @"Polls";
}


#pragma mark - View loading methods
-(void)loadQuestionView
{
    if(!jFWQuestionViewObj)
    {
        jFWQuestionViewObj = [[JFWQuestionView alloc]initWithFrame:self.view.bounds];
        jFWQuestionViewObj.delegate = self;
        [self.view addSubview:jFWQuestionViewObj];
    }
    
    [jFWQuestionViewObj loadOptionsData:[self getOptionsArray]];
}



#pragma mark - Delegate methods
-(void)optionSelected
{
    
}

-(void)submitButtonTapped
{
    NSLog(@"submit button event on controller");
}

#pragma mark - Helper methods

-(NSMutableArray *)getOptionsArray
{
    NSMutableArray *optionsArray = [[NSMutableArray alloc]init];
    
    OptionModel *optionModelObj =  [[OptionModel alloc]init];
    optionModelObj.optionText = @"Yes";
    [optionsArray addObject:optionModelObj];
    
    optionModelObj =  [[OptionModel alloc]init];
    optionModelObj.optionText = @"No";
    [optionsArray addObject:optionModelObj];
    
    
    optionModelObj =  [[OptionModel alloc]init];
    optionModelObj.optionText = @"Don't Know";
    [optionsArray addObject:optionModelObj];
    
    
    optionModelObj =  [[OptionModel alloc]init];
    optionModelObj.optionText = @"I Don't Care";
    [optionsArray addObject:optionModelObj];
    
    return optionsArray;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
