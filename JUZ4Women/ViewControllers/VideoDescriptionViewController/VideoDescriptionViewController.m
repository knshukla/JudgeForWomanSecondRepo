//
//  VideoDescriptionViewController.m
//  JUZ4Women
//
//  Created by Company on 26/06/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import "VideoDescriptionViewController.h"

#import "VideoModel.h"

@interface VideoDescriptionViewController ()

@end

@implementation VideoDescriptionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [self initPlayerView];
    
    [self configureLeftNavBar];
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:14/255.0 green:61.0/255.0 blue:82.0/255.0 alpha:1];
    self.title = @"Videos";
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};

}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self setDataOnView];
}

- (void)didReceiveMemoryWarning
{
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
-(void)configureLeftNavBar
{
    UIView *leftItemView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 60, 30)];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    backButton.frame = CGRectMake(0, 0, 30, 30);
    
    [backButton setImage:[UIImage imageNamed:@"back_icon"] forState:UIControlStateNormal];
    
    [backButton addTarget:self action:@selector(onBackButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    [leftItemView addSubview:backButton];
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    rightButton.frame = CGRectMake(30, 0, 30, 30);
    
    [rightButton setImage:[UIImage imageNamed:@"column_icon"] forState:UIControlStateNormal];
    
    [rightButton addTarget:self action:@selector(onNavBarButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    
    [leftItemView addSubview:rightButton];
    
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftItemView];
    
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
}

-(void)onNavBarButtonTapped
{
//    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}

-(void)onBackButtonTapped:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Data setter methods

-(void)setDataOnView
{
    if(!self.videoModelObj)
        return;
    
    [self loadPlayerWithVideoID:[self getYoutubeVideoIDFromString:self.videoModelObj.videoUrl]];
    
    [videoNameLabel setText:self.videoModelObj.videoName];
    
    [videoTagsLabel setText:self.videoModelObj.videoTags];
    
    [likesCountLabel setText:[NSString stringWithFormat:@"%ld",self.videoModelObj.videoLikes]];
    
    [inspireCountLabel setText:[NSString stringWithFormat:@"%ld",self.videoModelObj.videoInspire]];
    
    [videoDescriptionLabel setText:self.videoModelObj.videoDescription];
}

#pragma mark - Player init meethods

-(void)initPlayerView
{
    self.playerViewObj.delegate = self;
}

#pragma mark - Load player with video

-(void)loadPlayerWithVideoID:(NSString *)videoID
{
    [self.playerViewObj loadWithVideoId:videoID];
}


#pragma mark - YTPlayerViewDelegate methods

- (void)playerViewDidBecomeReady:(YTPlayerView *)playerView
{
    
}

- (void)playerView:(YTPlayerView *)playerView didChangeToState:(YTPlayerState)state
{
    switch (state)
    {
        case kYTPlayerStatePlaying:
            NSLog(@"Started playback");
            break;
        case kYTPlayerStatePaused:
            NSLog(@"Paused playback");
            break;
        default:
            break;
    }
}

- (void)playerView:(YTPlayerView *)playerView didChangeToQuality:(YTPlaybackQuality)quality
{
    
}

- (void)playerView:(YTPlayerView *)playerView receivedError:(YTPlayerError)error
{
    
}

#pragma mark - Event callbacks

- (IBAction)likeButtonTapped:(id)sender
{
    
}

- (IBAction)inspireButtonTapped:(id)sender
{
    
}

- (IBAction)shareButtonTapped:(id)sender
{
    
}

#pragma mark - Helper methods

-(NSString *)getYoutubeVideoIDFromString:(NSString *)youtubeVideoUrl
{
    NSString *videoID = @"";
    
    NSError *error = NULL;
    
     NSString *pattern = @"(?:(?:\.be\/|embed\/|v\/|\\?v=|\&v=|\/videos\/)|(?:[\\w+]+#\\w\/\\w(?:\/[\\w]+)?\/\\w\/))([\\w-_]+)";
    
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:&error];
    
    NSTextCheckingResult *match = [regex firstMatchInString:youtubeVideoUrl options:0 range:NSMakeRange(0, [youtubeVideoUrl length])];
    
    if (match)
    {
        NSRange videoIDRange = [match rangeAtIndex:1];
        videoID = [youtubeVideoUrl substringWithRange:videoIDRange];
    }
    
    return videoID;
}

@end
