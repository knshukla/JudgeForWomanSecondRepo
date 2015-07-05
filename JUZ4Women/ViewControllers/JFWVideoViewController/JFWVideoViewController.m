//
//  JFWVideoViewController.m
//  JUZ4Women
//
//  Created by Kailash on 5/3/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import "JFWVideoViewController.h"
#import "UIViewController+MMDrawerController.h"
#import "JFWVideoCell.h"
#import "JFWAddVideoViewController.h"
#import "JFWWebserviceManager.h"
#import "FilterViewController.h"
#import "JFWUtilities.h"
#import "VideoModel.h"
#import "VideoDescriptionViewController.h"

@interface JFWVideoViewController ()<FilterDelegate, VideoCellDelegate>
{
    NSArray *responseArray;
    FilterViewController *viewController;
}
@end

@implementation JFWVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fetchVideoFeedDetail];
    // Do any additional setup after loading the view.
    [self configureLeftNavBar];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:14/255.0 green:61.0/255.0 blue:82.0/255.0 alpha:1];
    self.title = @"Videos";
     self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)configureLeftNavBar
{
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    rightButton.frame = CGRectMake(0, 0, 30, 30);
    
    [rightButton setImage:[UIImage imageNamed:@"column_icon"] forState:UIControlStateNormal];
    
    [rightButton addTarget:self action:@selector(onNavBarButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
    
}

-(void)onNavBarButtonTapped
{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}


#pragma mark - TableView delegate methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //Returing number of rows in section of tableview
    
    return responseArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    //Intilizing the table cell
    static NSString* cellIdentifier = @"cellIdentifier";
    
    JFWVideoCell *cell = (JFWVideoCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil)
    {
        cell = [[JFWVideoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"JFWVideoCell" owner:self options:nil];
        cell =  (JFWVideoCell *)[topLevelObjects objectAtIndex:0];
        
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        [cell setDelegate:self];
    }
    cell.backgroundColor = [UIColor clearColor];
    [cell configureCellWithModel:[responseArray objectAtIndex:indexPath.row]];
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self pushToVideoPlayerWithModel:[responseArray objectAtIndex:indexPath.row]];
}


- (IBAction)onAddVideoButtonTapped:(id)sender
{
    JFWAddVideoViewController *addPostViewControllerObj = [self.storyboard instantiateViewControllerWithIdentifier:@"JFWAddVideoViewController"];
    
    UINavigationController *navControllerObj = [[UINavigationController alloc] initWithRootViewController:addPostViewControllerObj];
    
    [self presentViewController:navControllerObj animated:YES completion:nil];
}

- (IBAction)onFilterButtonTapped:(id)sender
{
    viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"FilterViewController"];
    viewController.filterType = 1;

    viewController.delegate = self;
    
    // [self addChildViewController:viewController];
    
    [viewController.view setFrame:CGRectMake(20, 130, 280, 230)];
    
    viewController.view.layer.cornerRadius = 5.0;
    viewController.view.layer.masksToBounds = YES;
    
    [self.navigationController.view addSubview:viewController.view];
    
    [viewController didMoveToParentViewController:self];

}

-(void)fetchVideoFeedDetail
{
    JFWWebserviceManager *webServiceManager = [[JFWWebserviceManager alloc]init];
    
    [webServiceManager requestVideoFeedApiWithVideoModel:nil withSuccessBlock:^(id dataArray)
     {
         responseArray = (NSArray *)dataArray;
         [self.videoTableView reloadData];
     } withFailureBlock:^(NSError *error)
     {
         
     }];
}
- (void)onCancelButtonTapped
{
    [viewController.view removeFromSuperview];
}

#pragma mark - video cell delegate methods

-(void)likeInspiredButtonTapped:(VideoModel *)videoModel andValue:(LikeInspiredValue)inspiredValue
{
    JFWWebserviceManager *webServiceManager = [[JFWWebserviceManager alloc]init];
    
    [webServiceManager requestVideoLikeApiWithVideoModal:videoModel inspiredValue:inspiredValue withSuccessBlock:^(NSDictionary *responseDic)
    {
        if (!responseDic)
        {
            [JFWUtilities showAlert:@"Unknown error occured"];
            
            return;
        }
        
        if ([[responseDic allKeys] containsObject:kMessageKey])
        {
            [JFWUtilities showAlert:[responseDic objectForKey:kMessageKey]];
        }
        
        videoModel.videoLikes = [[responseDic valueForKey:kNumOfLikesKey] longValue];
        videoModel.videoInspire = [[responseDic valueForKey:kNumOfInspiredKey] longValue];
        
        [self reloadVideoCell:videoModel];
        
    } withFailureBlock:^(NSError *error)
     {
         [JFWUtilities showAlert:error.description];
    }];

}

-(void)reloadVideoCell:(VideoModel *)videoModelObj
{
    [self.videoTableView reloadData];
}

-(void)pushToVideoPlayerWithModel:(VideoModel *)modelObj
{
    if(!modelObj)
        return;
    
    VideoDescriptionViewController *videoDescriptionViewControllerObj = [[VideoDescriptionViewController alloc] initWithNibName:@"VideoDescriptionViewController" bundle:nil];
    
    [videoDescriptionViewControllerObj setVideoModelObj:modelObj];
    
    [self.navigationController pushViewController:videoDescriptionViewControllerObj animated:YES];
}



@end
