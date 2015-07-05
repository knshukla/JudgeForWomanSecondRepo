//
//  SignUpViewController.m
//  JUZ4Women
//
//  Created by Kailash on 02/05/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import "SignUpViewController.h"

#import "IGLeftMenuViewController.h"
#import "IGHomeViewController.h"
#import "MMDrawerController.h"
#import "MMExampleCenterTableViewController.h"
#import "MMExampleLeftSideDrawerViewController.h"
#import "MMExampleRightSideDrawerViewController.h"
#import "MMDrawerVisualState.h"
#import "MMExampleDrawerVisualStateManager.h"
#import "MMNavigationController.h"

#import "JFWAppDelegate.h"
#import "JFWWebserviceManager.h"
#import "SignUpView.h"

#import "JFWUtilities.h"

#import "SignUpViewCell.h"

#import "JFWAppConstants.h"

#import "UserModel.h"

@interface SignUpViewController () <UICollectionViewDataSource, UICollectionViewDelegate, SignUpViewCellDelegate, SignUpViewDelegate>
{
    __weak IBOutlet UIScrollView *scrollView;
    __weak IBOutlet UIPageControl *pageControl;
    __weak IBOutlet UICollectionView *collectionViewObj;
    __weak IBOutlet UIButton *previousButton;
    __weak IBOutlet UIButton *nextButton;
    
    SignUpViewCell *signUpViewCellObj;
    
    SignUpOption signUpOption;
    
    UserModel *user;
}

@property (nonatomic,strong) MMDrawerController * drawerController;

- (IBAction)previousButtonTapped:(id)sender;

- (IBAction)nextButtonTapped:(id)sender;

@end

@implementation SignUpViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initView];
    // Do any additional setup after loading the view from its nib.
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

#pragma mark - Initialiation Methods

-(void)initView
{
    [self configurePageControl];
    
    [self setScrollViewContentSize];
    
    [self configureNextButton];
    
    [self registerCollectionViewCell];
    
    [self disableNextButton:YES];
    
    signUpOption = NONE;
}

-(void)configurePageControl
{
    
}

-(void)configureNextButton
{
    [nextButton setImageEdgeInsets:UIEdgeInsetsMake(2, 52, 0, 0)];
}

-(void)registerCollectionViewCell
{
    [collectionViewObj registerClass:[SignUpViewCell class] forCellWithReuseIdentifier:@"SignUpViewCellIdentifier"];
    
    [collectionViewObj registerNib:[UINib nibWithNibName:@"SignUpViewCell" bundle:nil] forCellWithReuseIdentifier:@"SignUpViewCellIdentifier"];
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
#pragma mark - Collection View DataSource Methods

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    signUpViewCellObj = [collectionView dequeueReusableCellWithReuseIdentifier:@"SignUpViewCellIdentifier" forIndexPath:indexPath];
    
    [signUpViewCellObj setDelegate:self];
    
    if (!user) {
        user = [[UserModel alloc]init];
    }
    
    [signUpViewCellObj setUser:user];
    [signUpViewCellObj setSignUpScreenType:indexPath.row];
    [signUpViewCellObj setSignUpOption:signUpOption];
    
    [signUpViewCellObj setDataOnCell];

    if (indexPath.row == DATE_OF_BIRTH_SCREEN)
        [self showPreviousButon:NO];
    
    else
        [self showPreviousButon:YES];
    
    return signUpViewCellObj;
}

#pragma mark - CollectionView Delegate methods

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSIndexPath *indexPath = [self getCurrentVisibleIndexPath];
    
    if (indexPath && indexPath.row < 4)
    {
        [self setPageControl:indexPath.row];
    }
}


#pragma mark - UI Button Event Methods

- (IBAction)previousButtonTapped:(id)sender
{
    NSIndexPath *indexPath = [self getCurrentVisibleIndexPath];
    
    if (!indexPath)
        return;
    
    if (indexPath.row ==  0)
    {
        [self showPreviousButon:NO];
        return;
    }
    
    indexPath = [NSIndexPath indexPathForRow:indexPath.row-1 inSection:indexPath.section];
    
     [collectionViewObj scrollToItemAtIndexPath:indexPath atScrollPosition:
      UICollectionViewScrollPositionRight animated:YES];
    
    [self disableNextButton:NO];
}

- (IBAction)nextButtonTapped:(id)sender
{
    NSIndexPath *indexPath = [self getCurrentVisibleIndexPath];
    
    if (!indexPath)
        return;
    
    SignUpViewCell *cellObj = (SignUpViewCell *)[collectionViewObj cellForItemAtIndexPath:indexPath];
    
    BOOL mode = [cellObj checkAllMandatoryFieldsFilled];
    
    // if user not filled all the mandatory text
    if (!mode)
        return;
    
    if (indexPath.row ==  3)
    {
        [self loadSignUpView];
       
        return;
    }
        
    indexPath = [NSIndexPath indexPathForRow:indexPath.row+1 inSection:indexPath.section];
    
    [collectionViewObj scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionRight animated:YES];
    
    [self setNextButtonStateForIndexPath:indexPath];
    
}

-(void)setNextButtonStateForIndexPath:(NSIndexPath *)indexPath
{
    if (!indexPath) {
        return;
    }
    
    SignUpViewCell *cellObj = (SignUpViewCell *)[collectionViewObj cellForItemAtIndexPath:indexPath];
    
    BOOL mode = [cellObj checkAllMandatoryFieldsFilled];
    
    [self disableNextButton:!mode];
}

#pragma mark - Observer Methods

-(void)keyboardWillShow:(NSNotification *)notify
{
    CGRect frame = self.view.frame;
    frame.origin.y = -160;
    
    [self animateViewWithFrame:frame];
}

-(void)keyBoardWillHide:(NSNotification *)notify
{
    CGRect frame = self.view.frame;
    frame.origin.y = 0;
    
    [self animateViewWithFrame:frame];
}


#pragma mark - Helper Mthods

-(void)setScrollViewContentSize
{
    [scrollView setContentSize:self.view.bounds.size];
}

-(void)showPreviousButon:(BOOL)mode
{
    [previousButton setHidden:!mode];
}

-(void)showNextButon:(BOOL)mode
{
    [nextButton setHidden:!mode];
}

-(void)setPageControl:(NSInteger)page
{
    [pageControl setCurrentPage:page];
}

-(NSIndexPath *)getCurrentVisibleIndexPath
{
    NSIndexPath *indexPath = [collectionViewObj indexPathForCell:[[collectionViewObj visibleCells] firstObject]];
    
    return indexPath;
}

-(void)animateViewWithFrame:(CGRect)frame
{
    [UIView animateWithDuration:0.35 animations:^{
    
        [self.view setFrame:frame];
    
    }];
}

#pragma mark - SignUpViewCell Delegate Methods

-(void)disableNextButton:(BOOL)mode
{
    [nextButton setEnabled:!mode];
    
    CGFloat alpha = 0.5;
    if (!mode)
        alpha = 1.0;
    
    [nextButton setAlpha:alpha];
    
    [collectionViewObj setScrollEnabled:!mode];
}

-(void)signUpOptionSelected:(SignUpOption)option
{
    signUpOption = option;
    
    NSIndexPath *indexPath = [self getCurrentVisibleIndexPath];
    
    if (!indexPath)
        return;
    indexPath = [NSIndexPath indexPathForRow:indexPath.row+1 inSection:indexPath.section];
    
    [collectionViewObj scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionRight animated:YES];
}

-(void)loadHomeViewController
{
    IGHomeViewController *beaconSearchViewControllerObj = [self.storyboard instantiateViewControllerWithIdentifier:@"HomeViewController"];
    
    IGLeftMenuViewController *leftSideDrawerViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"LeftMenuViewController"];
    
    UIViewController * rightSideDrawerViewController = [[MMExampleRightSideDrawerViewController alloc] init];
    
    UINavigationController * navigationController = [[MMNavigationController alloc] initWithRootViewController:beaconSearchViewControllerObj];
    [navigationController setRestorationIdentifier:@"MMExampleCenterNavigationControllerRestorationKey"];
    if([JFWUtilities isOSVersionIsAtLeastiOS7]){
        UINavigationController * rightSideNavController = [[MMNavigationController alloc] initWithRootViewController:rightSideDrawerViewController];
        [rightSideNavController setRestorationIdentifier:@"MMExampleRightNavigationControllerRestorationKey"];
        //        UINavigationController * leftSideNavController = [[MMNavigationController alloc] initWithRootViewController:leftSideDrawerViewController];
        //        [leftSideNavController setRestorationIdentifier:@"MMExampleLeftNavigationControllerRestorationKey"];
        self.drawerController = [[MMDrawerController alloc]
                                 initWithCenterViewController:navigationController
                                 leftDrawerViewController:leftSideDrawerViewController
                                 rightDrawerViewController:nil];
        [self.drawerController setShowsShadow:NO];
    }
    else{
        self.drawerController = [[MMDrawerController alloc]
                                 initWithCenterViewController:navigationController
                                 leftDrawerViewController:leftSideDrawerViewController
                                 rightDrawerViewController:rightSideDrawerViewController];
    }
    [self.drawerController setRestorationIdentifier:@"MMDrawer"];
    [self.drawerController setMaximumRightDrawerWidth:200.0];
    [self.drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    [self.drawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    
    [self.drawerController
     setDrawerVisualStateBlock:^(MMDrawerController *drawerController, MMDrawerSide drawerSide, CGFloat percentVisible) {
         MMDrawerControllerDrawerVisualStateBlock block;
         block = [[MMExampleDrawerVisualStateManager sharedManager]
                  drawerVisualStateBlockForDrawerSide:drawerSide];
         if(block){
             block(drawerController, drawerSide, percentVisible);
         }
     }];
    
    JFWAppDelegate *delegate = [[UIApplication sharedApplication]delegate];
    
    [delegate.window setRootViewController:self.drawerController];
}

-(void)loadSignUpView
{
    SignUpView *signUpViewObj = [[SignUpView alloc]initWithFrame:self.view.bounds];
    
    CGRect frame = self.view.bounds;
    frame.origin.x = frame.size.width;
    
    [signUpViewObj setDelegate:self];
    
    [signUpViewObj setFrame:frame];
    
    [scrollView addSubview:signUpViewObj];
    
    [scrollView setContentSize:CGSizeMake(2*self.view.bounds.size.width, self.view.bounds.size.height)];
    
    [scrollView setContentOffset:CGPointMake(self.view.bounds.size.width, self.view.bounds.origin.y) animated:YES];
}

-(void)signUpButtonTapped:(NSString *)realName andDisplayName:(NSString *)displayName
{
    user.realName = realName;
    user.displayName = displayName;
    
    [self callSignUpWebService];
}

-(void)showImagePicker
{
    [self openImagePickerView];
}

#pragma mark - UIImagePickerController Methods

-(void)openImagePickerView
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [info valueForKey:UIImagePickerControllerOriginalImage];
    
    user.image = image;
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}


- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

#pragma mark - Web serice method

-(void)callSignUpWebService
{
    JFWWebserviceManager *webServiceManager = [[JFWWebserviceManager alloc]init];
    
    [webServiceManager requestSignUpApiWithUserModal:user withSuccessBlock:^(id modal)
     {
         [self handleSignUpResposne:modal];
         
     } withFailureBlock:^(NSError *error)
     {
         [self showAlert: NSLocalizedString(@"SIGNUP_ERROR", nil)];
     }];
}

-(void)handleSignUpResposne:(NSDictionary *)responseDic
{
    NSString *string = nil;
    
    if (!responseDic)
    {
        string = NSLocalizedString(@"SIGNUP_ERROR", nil);
    }
    
    if ([responseDic objectForKey:kSuccess]) {
        [self loadHomeViewController];
        
        return;
    }
    else
    {
        if (![[responseDic objectForKey:kIsEmailID] boolValue]) {
            string = NSLocalizedString(@"SIGNUP_ERROR_EMAIL", nil);
        }
        else if (![[responseDic objectForKey:kIsPhoneNumber] boolValue])
            string = NSLocalizedString(@"SIGNUP_ERROR_MOBILE", nil);
        else if (![[responseDic objectForKey:kIsUserName] boolValue])
            string = NSLocalizedString(@"SIGNUP_ERROR_USERNAME", nil);
        else
            string = NSLocalizedString(@"SIGNUP_ERROR", nil);
    }
    
    [self showAlert:string];
}

-(void)showAlert:(NSString *)message
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:message delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    
    [alert show];
}

@end
