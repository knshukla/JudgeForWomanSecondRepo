//
//  MenuViewController.m
//  SlideMenu
//
//  Created by Aryan Gh on 4/24/13.
//  Copyright (c) 2013 Aryan Ghassemi. All rights reserved.
//

#import "IGLeftMenuViewController.h"
#import "SlideNavigationContorllerAnimatorFade.h"
#import "SlideNavigationContorllerAnimatorSlide.h"
#import "SlideNavigationContorllerAnimatorScale.h"
#import "SlideNavigationContorllerAnimatorScaleAndFade.h"
#import "SlideNavigationContorllerAnimatorSlideAndFade.h"
#import "MMDrawerController+Subclass.h"
#import "MMDrawerController.h"
#import "MMDrawerVisualState.h"
#import "LeftMenuCellTableViewCell.h"
#import "JFWAppDelegate.h"
#import "UIViewController+MMDrawerController.h"
#import "JFWMenuItemModel.h"
#import "JFWAboutUsViewController.h"
#import "JFWArticleViewController.h"
#import "JFWPollsViewController.h"
#import "JFWPostViewController.h"
#import "JFWSignOutViewController.h"
#import "JFWVideoViewController.h"
#import "JFWContactUsViewController.h"
#import "JFWLegalAdviseViewController.h"
#import "JFWSuccessStoriesViewController.h"
#import "JFWNotificationViewController.h"
#import "JFWWebserviceManager.h"
#import "JFWLeftMenuModel.h"
#import "UserModel.h"
#import "UIImageView+AFNetworking.h"
#import "JFWAppConstants.h"
@interface IGLeftMenuViewController()
{
    NSMutableArray *menuItemArray;
}

@end

@implementation IGLeftMenuViewController

#pragma mark - UIViewController Methods -

- (id)initWithCoder:(NSCoder *)aDecoder
{
	self.slideOutAnimationEnabled = YES;
	
	return [super initWithCoder:aDecoder];
}

- (void)viewDidLoad
{
	[super viewDidLoad];
    NSLog(@"Controll came here");
    
      menuItemArray = [self createMenuItemArray];
    
    self.title = @"Player List";
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"app_back.png"]];
    
    self.profileImageView.layer.cornerRadius = 25;
    self.profileImageView.layer.masksToBounds = YES;
    
    [self fetchLeftMenuDetails];
    
}

-(void)fetchLeftMenuDetails
{
    JFWWebserviceManager *webServiceManager = [[JFWWebserviceManager alloc]init];
    
    [webServiceManager requestLeftMenuApiWithLeftMenuModel:nil withSuccessBlock:^(id modal)
    {
        UserModel *userModel = (UserModel *)modal;
        [self updateView:userModel];
    } withFailureBlock:^(NSError *error) {
        
    }];
}

-(void)updateView:(UserModel *)userModel
{
    self.nameLableObj.text = userModel.userName;
    self.emailLabelObj.text = userModel.displayName;
    NSString *postText = [NSString stringWithFormat:@"%ld",userModel.userTotalPostCount];
    NSString *commentsViewText = [NSString stringWithFormat:@"%ld",userModel.userTotalComments];
    NSString *profileViewText = [NSString stringWithFormat:@"%ld",userModel.userTotalProfileViews];
    NSString *postSharedText = [NSString stringWithFormat:@"%ld",userModel.userTotalPostShares];
    self.postLabel.text = postText;
    self.profileViewLabel.text = profileViewText;
    self.commentsLabel.text = commentsViewText;
    self.postSharedLabel.text = postSharedText;
    
    [self downloadProfileImage:self.profileImageView withUrl:userModel.imageUrl];

}

#pragma mark - UITableView Delegate & Datasrouce -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(!menuItemArray)
        return 0;
	return menuItemArray.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellIdentifier = @"LeftMenuCellTableViewCell";

    
    LeftMenuCellTableViewCell *cell = (LeftMenuCellTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil)
    {
        cell = [[LeftMenuCellTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"LeftMenuCellTableViewCell" owner:self options:nil];
        cell =  (LeftMenuCellTableViewCell *)[topLevelObjects objectAtIndex:0];
        
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        
    }
    cell.borderImageView.image = [UIImage imageNamed:@"devider.png"];
    cell.backgroundColor = [UIColor clearColor];
	
    [cell configureCellWith:[menuItemArray objectAtIndex:indexPath.row]];
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	
	UIViewController *viewControllerObj ;
    
    if(indexPath.row !=6)
    {
        switch (indexPath.row)
        {
            case 0:
            {
                viewControllerObj = [self.storyboard instantiateViewControllerWithIdentifier:@"JFWNotificationViewController"];
                break;
            }
            case 1:
            {
                viewControllerObj = [self.storyboard instantiateViewControllerWithIdentifier:@"HomeViewController"];
                break;
            }
                
            case 2:
                viewControllerObj = [self.storyboard instantiateViewControllerWithIdentifier:@"JFWArticleViewController"];
                break;
            case 3:
                viewControllerObj = [self.storyboard instantiateViewControllerWithIdentifier:@"JFWLegalAdviseViewController"];
                break;
            case 4:
                viewControllerObj = [self.storyboard instantiateViewControllerWithIdentifier:@"JFWSuccessStoriesViewController"];
                break;
                
            case 5:
                viewControllerObj = [self.storyboard instantiateViewControllerWithIdentifier:@"JFWVideoViewController"];
                break;
            case 6:
                viewControllerObj = [self.storyboard instantiateViewControllerWithIdentifier:@"JFWPollsViewController"];
                break;
            case 7:
                viewControllerObj = [self.storyboard instantiateViewControllerWithIdentifier:@"JFWContactUsViewController"];
                break;
            case 8:
                viewControllerObj = [self.storyboard instantiateViewControllerWithIdentifier:@"JFWAboutUsViewController"];
                break;
        }
        UINavigationController *navControllerObj = [[UINavigationController alloc]initWithRootViewController:viewControllerObj];
        [self.mm_drawerController setCenterViewController:navControllerObj withCloseAnimation:YES completion:nil];

        
    }
    else
    {
        viewControllerObj = [self.storyboard instantiateViewControllerWithIdentifier:@"SignUpViewControllerIdentifier"];
        JFWAppDelegate *delegateObj = [UIApplication sharedApplication].delegate;
        
        [delegateObj.window setRootViewController:viewControllerObj];
    }
	
}


-(NSMutableArray *)createMenuItemArray
{
    JFWMenuItemModel *menuItemModelObj1 = [[JFWMenuItemModel alloc]initWithMenuItemName:@"Notifications" withImageName:@"post_icon"];
    
     JFWMenuItemModel *menuItemModelObj2 = [[JFWMenuItemModel alloc]initWithMenuItemName:@"Post" withImageName:@"post_icon"];
    
    JFWMenuItemModel *menuItemModelObj3 = [[JFWMenuItemModel alloc]initWithMenuItemName:@"Article" withImageName:@"article_icon"];
    
    JFWMenuItemModel *menuItemModelObj4 = [[JFWMenuItemModel alloc]initWithMenuItemName:@"Legal Advice" withImageName:@"video_icon"];
    
    JFWMenuItemModel *menuItemModelObj5 = [[JFWMenuItemModel alloc]initWithMenuItemName:@"Success Stories" withImageName:@"video_icon"];
    
    JFWMenuItemModel *menuItemModelObj6 = [[JFWMenuItemModel alloc]initWithMenuItemName:@"Videos" withImageName:@"video_icon"];
    
    JFWMenuItemModel *menuItemModelObj7 = [[JFWMenuItemModel alloc]initWithMenuItemName:@"Polls" withImageName:@"poll_icon"];
    
    JFWMenuItemModel *menuItemModelObj8 = [[JFWMenuItemModel alloc]initWithMenuItemName:@"contact Us" withImageName:@"about_us_icon"];
        
    JFWMenuItemModel *menuItemModelObj9 = [[JFWMenuItemModel alloc]initWithMenuItemName:@"About Us" withImageName:@"about_us_icon"];
    
    
    JFWMenuItemModel *menuItemModelObj10 = [[JFWMenuItemModel alloc]initWithMenuItemName:@"Sign Out" withImageName:@"sign_out_icon"];
    
NSMutableArray *menuItemsArray = [[NSMutableArray alloc]initWithObjects:menuItemModelObj1,menuItemModelObj2,menuItemModelObj3,menuItemModelObj4,menuItemModelObj5,menuItemModelObj6,menuItemModelObj7,menuItemModelObj8,menuItemModelObj9,menuItemModelObj10, nil];
    
    return menuItemsArray;
}

-(void)downloadProfileImage:(UIImageView *)imageView withUrl:(NSString *)url
{
    NSString *finalUrl = [NSString stringWithFormat:@"%@/%@",kBaseUrl,url];
    NSMutableURLRequest *imageRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:finalUrl]];
    [imageView setImageWithURLRequest:imageRequest placeholderImage:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image)
     {
         [imageView setImage:image];
         
     }failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error)
     {
         
     }];

}
@end
