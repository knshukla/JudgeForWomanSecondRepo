//
//  JFWArticleViewController.m
//  JUZ4Women
//
//  Created by Kailash on 5/3/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import "JFWProfileViewController.h"
#import "UIViewController+MMDrawerController.h"
#import "ProfileTableViewCell.h"
#import "JFWWebserviceManager.h"
#import "UserModel.h"
#import "JFWAppConstants.h"
#import "UIImageView+AFNetworking.h"

@interface JFWProfileViewController ()
{
    UIView *headerView;
    UserModel *userModel;
}
@end

@implementation JFWProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self configureLeftNavBar];
    [self fetchUserProfileDetail];
    [self configureHeaderView];
    
    self.profileImageView.layer.cornerRadius = 42;
    self.profileImageView.layer.masksToBounds = YES;
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:14/255.0 green:61.0/255.0 blue:82.0/255.0 alpha:1];
    
    self.title = @"Profile";
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
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //Returing number of rows in section of tableview
    if(section == 0)
    {
        NSArray *postArray = userModel.postArray;
        return postArray.count;
    }
    else
    {
        
        NSArray *articleArray = userModel.articleArray;
        return articleArray.count;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    //Intilizing the table cell
    static NSString* cellIdentifier = @"cellIdentifier";
    self.profileTableView.backgroundColor = [UIColor clearColor];
    ProfileTableViewCell *cell = (ProfileTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil)
    {
        cell = [[ProfileTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"ProfileTableViewCell" owner:self options:nil];
        
        cell =  (ProfileTableViewCell *)[topLevelObjects objectAtIndex:0];
        
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.profileImageView.layer.cornerRadius = 23;
    cell.profileImageView.layer.masksToBounds = YES;
    if(indexPath.section == 0)
    {
       [cell configureCellWithFeedModel:[userModel.postArray objectAtIndex:indexPath.row]];
    }
    else
    {
        
        
         [cell configureCellWithArticleModel:[userModel.articleArray objectAtIndex:indexPath.row]];

    }
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 75.0;
}

- (IBAction)onProfileEditButtonTapped:(id)sender {
}

-(void)fetchUserProfileDetail
{
    JFWWebserviceManager *webServiceManager = [[JFWWebserviceManager alloc]init];
    
    [webServiceManager requestUserProfileApiWithUserModal:nil withSuccessBlock:^(id model)
     {
         userModel = (UserModel *)model;
         [self updateView:userModel];
         [self.profileTableView reloadData];
         
     } withFailureBlock:^(NSError *error)
     {
         
     }];
}

-(void)updateView:(UserModel *)model
{
    self.nameLabel.text = model.userName;
    NSString *userAge = [NSString stringWithFormat:@"%ld years",model.userAge];
    self.ageLabel.text = userAge;
    
    NSString *finalUrl = [NSString stringWithFormat:@"%@/%@",kBaseUrl,model.imageUrl];
    NSMutableURLRequest *imageRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:finalUrl]];
    [self.profileImageView setImageWithURLRequest:imageRequest placeholderImage:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image)
     {
         [self.profileImageView setImage:image];
         
     }failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error)
     {
         
     }];

}

-(void)configureHeaderView
{
    headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 70)];
    /* Create custom view to display section header... */
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 1, tableView.frame.size.width, 18)];
    [label setFont:[UIFont boldSystemFontOfSize:12]];
    NSString *string;
    label.textColor = [UIColor whiteColor];
    if(section == 0)
    {
        string =@"Recent Post";
    }
    else
    {
       string =@"Recent Articles";
    }
    
    
    UIImageView *borderImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 1)];
    
    borderImageView.backgroundColor = [UIColor colorWithRed:130.0/255.0 green:143.0/255.0 blue:160.0/255.0 alpha:1];
    
    [view addSubview:borderImageView];
    view.backgroundColor = [UIColor clearColor];
    
    [label setText:string];
    [view addSubview:label];
    return view;
}
@end
