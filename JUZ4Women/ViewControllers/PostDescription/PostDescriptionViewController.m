//
//  PostDescriptionViewController.m
//  JUZ4Women
//
//  Created by Kailash on 6/20/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import "PostDescriptionViewController.h"
#import "JFWFeedsModel.h"
#import "UIImageView+AFNetworking.h"
#import "JFWAppConstants.h"
#import "JFWWebserviceManager.h"
#import "JFWFeedsModel.h"
#import "HomeDescriptionCell.h"

@interface PostDescriptionViewController ()

@end

@implementation PostDescriptionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self fetchCommentDetailData];
    [self configureLeftNavBar];
    [self configureView];
    [self downloadProfileImage];
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:14/255.0 green:61.0/255.0 blue:82.0/255.0 alpha:1];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
     self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
    self.title = @"Post";
}

-(void)viewWillAppear:(BOOL)animated
{
    [self addObservers];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [self removeObservers];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onLikeButtonTapped:(id)sender {
}
- (IBAction)onDislikeButtonTapped:(id)sender {
}
- (IBAction)onCommentButtonTapped:(id)sender {
}
- (IBAction)onBlockButtonTapped:(id)sender {
}
- (IBAction)onUploadButtonTapped:(id)sender {
}
- (IBAction)onPostButtonTapped:(id)sender {
}

-(void)configureLeftNavBar
{
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.frame = CGRectMake(0, 0, 30, 30);
    [leftButton setImage:[UIImage imageNamed:@"back_icon"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(onNavBarBackButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
    
}

-(void)onNavBarBackButtonTapped
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)configureView
{
    self.postTitleLabel.text = self.feedModel.postTitle;
    self.postTags.text = self.feedModel.tags;
    //self.postDescriptionTextView.text = self.feedModel.description;
    self.likeCountLabel.text = [NSString stringWithFormat:@"%ld",self.feedModel.likeCount];
    self.dislikeCountLabel.text = [NSString stringWithFormat:@"%ld",self.feedModel.dislikeCount];
    self.commentCountLabel.text = [NSString stringWithFormat:@"%ld",self.feedModel.commentsCount];
    self.likeCountLabel.text = [NSString stringWithFormat:@"%ld",self.feedModel.likeCount];
    
    self.profileImageView.layer.cornerRadius = 25;
    self.profileImageView.layer.masksToBounds = YES;
    
}
-(void)downloadProfileImage
{
    NSString *avatorUrl = self.feedModel.userAvatorUrl;
    
    NSString *finalUrl = [NSString stringWithFormat:@"%@/%@",kBaseUrl,avatorUrl];
    NSMutableURLRequest *imageRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:finalUrl]];
    [self.profileImageView setImageWithURLRequest:imageRequest placeholderImage:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image)
     {
         [self.profileImageView setImage:image];
         
     }failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error)
     {
         
     }];

}

-(void)addObservers
{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyBoardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

-(void)removeObservers
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
}

-(void)keyboardWillShow:(NSNotification *)notify
{
    CGRect frame = self.view.frame;
    frame.origin.y = -250;
    
    [self animateViewWithFrame:frame];
}

-(void)keyBoardWillHide:(NSNotification *)notify
{
    CGRect frame = self.view.frame;
    frame.origin.y = 0;
    
    [self animateViewWithFrame:frame];
}


-(void)animateViewWithFrame:(CGRect)frame
{
    [UIView animateWithDuration:0.35 animations:^{
        
        [self.view setFrame:frame];
        
    }];
}

-(void)fetchCommentDetailData
{
    JFWWebserviceManager *webServiceManager = [[JFWWebserviceManager alloc]init];
    
    
    
    [webServiceManager requestFeedDescriptionWithFeedModel:self.feedModel withSuccessBlock:^(id dataArray)
     {
        
     } withFailureBlock:^(NSError *error)
     {
         
     }];

}

#pragma mark - TableView delegate methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //Returing number of rows in section of tableview
    
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    //Intilizing the table cell
    static NSString* cellIdentifier = @"cellIdentifier";
    
    HomeDescriptionCell *cell = (HomeDescriptionCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil)
    {
        cell = [[HomeDescriptionCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"HomeDescriptionCell" owner:self options:nil];
        cell =  (HomeDescriptionCell *)[topLevelObjects objectAtIndex:0];
        
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    cell.backgroundColor = [UIColor clearColor];
    
//    cell.userImageView.layer.cornerRadius = 25;
//    cell.userImageView.layer.masksToBounds = YES;
//    [cell configureCell:[responseArray objectAtIndex:indexPath.row]];
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 75.0;
}

@end
