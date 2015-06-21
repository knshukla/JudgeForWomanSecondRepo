//
//  JFWGraphViewController.m
//  JUZ4Women
//
//  Created by Gautam Arora on 21/06/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import "JFWGraphViewController.h"

@interface JFWGraphViewController ()

@end

@implementation JFWGraphViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillAppear:(BOOL)animated
{
    NSMutableArray *dataArray = [NSMutableArray arrayWithCapacity:10];
    
    for(int i = 0; i < 2; i ++)
    {
        //Generate Random Number
        NSNumber *one = [NSNumber numberWithInt:rand()%60+20];
        [dataArray addObject:one];
    }
    
    // Pass View for Array with array to get a pie chart
    [chartView renderInLayer:chartView dataArray:dataArray];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
