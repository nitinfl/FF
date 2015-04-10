//
//  STHomeViewController.m
//  Stcoked
//
//  Created by Jebaraj Daniel S on 01/04/15.
//  Copyright (c) 2015 Jebaraj Daniel S. All rights reserved.
//

#import "STHomeViewController.h"
#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)

@interface STHomeViewController ()

@end

@implementation STHomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
#pragma mark - view Cycle

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *aAppLogoImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"STTempBG.png"]];
    aAppLogoImageView.frame = CGRectMake(self.view.frame.size.width/2 - aAppLogoImageView.image.size.width/4.7, 0, aAppLogoImageView.image.size.width/2.35, aAppLogoImageView.image.size.height/2.35);
    [self.view addSubview:aAppLogoImageView];
    
    
    UIImageView *aAppLogoImageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"STTabBar.png"]];
    aAppLogoImageView1.frame = CGRectMake(self.view.frame.size.width/2 - aAppLogoImageView.image.size.width/4.7, self.view.frame.size.height - aAppLogoImageView1.image.size.height/2.35, aAppLogoImageView1.image.size.width/2.35, aAppLogoImageView1.image.size.height/2.35);
    [self.view addSubview:aAppLogoImageView1];

    // Do any additional setup after loading the view.
    
    UIImage *aHomeImage = [UIImage imageNamed:@"STHomeTabBar.png"];
    UIImage *aExploreBtnImage = [UIImage imageNamed:@"STExploreTabBar.png"];
    UIImage *aCameraBtnImage = [UIImage imageNamed:@"STTabBarCameraBtn.png"];
    UIImage *aMessageBtnImage = [UIImage imageNamed:@"STMessageTabBar.png"];
    UIImage *aProfileBtnImage = [UIImage imageNamed:@"STProfileTabBar.png"];
    UIImage *aTempBtnImage = [UIImage imageNamed:@"TempBtn.png"];
    
    aImage1 = [[UIImageView alloc] initWithFrame:CGRectMake(aTempBtnImage.size.width/48,self.view.frame.size.height - aTempBtnImage.size.height/2.3 ,aTempBtnImage.size.width/2.3,aTempBtnImage.size.height/2.3)];
    aImage1.image = aTempBtnImage;
    [self.view addSubview:aImage1];
    
    aImage2 = [[UIImageView alloc] initWithFrame:CGRectMake(aImage1.frame.origin.x + aTempBtnImage.size.width/2.3,self.view.frame.size.height - aTempBtnImage.size.height/2.3 ,aTempBtnImage.size.width/2.3,aTempBtnImage.size.height/2.3)];
    aImage2.image = aTempBtnImage;
    [self.view addSubview:aImage2];
    
    
    aImage3 = [[UIImageView alloc] initWithFrame:CGRectMake(aImage2.frame.origin.x + aTempBtnImage.size.width/2.3,self.view.frame.size.height - aTempBtnImage.size.height/2.3 ,aTempBtnImage.size.width/2.3,aTempBtnImage.size.height/2.3)];
    aImage3.image = aTempBtnImage;
    [self.view addSubview:aImage3];
    
    aImage4 = [[UIImageView alloc] initWithFrame:CGRectMake(aImage3.frame.origin.x + aTempBtnImage.size.width/2.3,self.view.frame.size.height - aTempBtnImage.size.height/2.3 ,aTempBtnImage.size.width/2.3,aTempBtnImage.size.height/2.3)];
    aImage4.image = aTempBtnImage;
    [self.view addSubview:aImage4];
    
    
    aImage5 = [[UIImageView alloc] initWithFrame:CGRectMake(aImage4.frame.origin.x + aTempBtnImage.size.width/2.3,self.view.frame.size.height - aTempBtnImage.size.height/2.3 ,aTempBtnImage.size.width/2.3,aTempBtnImage.size.height/2.3)];
    aImage5.image = aTempBtnImage;
    [self.view addSubview:aImage5];
    
    aImage1.hidden = true;
    aImage2.hidden = false;
    aImage3.hidden = false;
    aImage4.hidden = false;
    aImage5.hidden = false;

    
    
    UIButton *aLoginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    aLoginBtn.frame = CGRectMake(aHomeImage.size.width/2.3,self.view.frame.size.height - aHomeImage.size.height/1.25 ,aHomeImage.size.width/2.25,aHomeImage.size.height/2.25);
    [aLoginBtn setImage:aHomeImage forState:UIControlStateNormal];
    [aLoginBtn addTarget:self action:@selector(aBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    aLoginBtn.tag = 1;
    [self.view addSubview:aLoginBtn];
    
    UIButton *aExploreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    aExploreBtn.frame = CGRectMake(aLoginBtn.frame.origin.x + aHomeImage.size.width + aHomeImage.size.width/4 ,self.view.frame.size.height - aHomeImage.size.height/1.25 ,aExploreBtnImage.size.width/2.25,aExploreBtnImage.size.height/2.25);
    [aExploreBtn setImage:aExploreBtnImage forState:UIControlStateNormal];
    [aExploreBtn addTarget:self action:@selector(aBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    aExploreBtn.tag = 2;
    [self.view addSubview:aExploreBtn];
    
    
    UIButton *aCameraBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    aCameraBtn.frame = CGRectMake(aExploreBtn.frame.origin.x + aHomeImage.size.width + aHomeImage.size.width/7 ,self.view.frame.size.height - aCameraBtnImage.size.height/1.8 ,aCameraBtnImage.size.width/2.25,aCameraBtnImage.size.height/2.25);
    [aCameraBtn setImage:aCameraBtnImage forState:UIControlStateNormal];
    [aCameraBtn addTarget:self action:@selector(aBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    aCameraBtn.tag = 3;
    [self.view addSubview:aCameraBtn];
    
    
    UIButton *aMessageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    aMessageBtn.frame = CGRectMake(aCameraBtn.frame.origin.x + aCameraBtnImage.size.width/1.15 ,self.view.frame.size.height - aHomeImage.size.height/1.35 ,aMessageBtnImage.size.width/2.25,aMessageBtnImage.size.height/2.25);
    [aMessageBtn setImage:aMessageBtnImage forState:UIControlStateNormal];
    [aMessageBtn addTarget:self action:@selector(aBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    aMessageBtn.tag = 4;
    [self.view addSubview:aMessageBtn];
    
    
    UIButton *aProfileBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    aProfileBtn.frame = CGRectMake(aMessageBtn.frame.origin.x + aHomeImage.size.width + aHomeImage.size.width/7 ,self.view.frame.size.height - aHomeImage.size.height/1.25 ,aProfileBtnImage.size.width/2.25,aProfileBtnImage.size.height/2.25);
    [aProfileBtn setImage:aProfileBtnImage forState:UIControlStateNormal];
    [aProfileBtn addTarget:self action:@selector(aBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    aProfileBtn.tag = 5;
    [self.view addSubview:aProfileBtn];
    
    if (self.view.frame.size.height == 480)
        aHomeView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height/2 - self.view.frame.size.height/2.5, self.view.frame.size.width, self.view.frame.size.height/1.25)];
    else
        aHomeView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height/2 - self.view.frame.size.height/2.4, self.view.frame.size.width, self.view.frame.size.height/1.2)];

    aHomeView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:aHomeView];
    
    UIScrollView *aScrollView1 = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, aHomeView.frame.size.width, aHomeView.frame.size.height)];
    [aHomeView addSubview:aScrollView1];
    
    UIImageView *aImageview1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"homeImage.png"]];
    aImageview1.frame = CGRectMake(0, 0, aImageview1.image.size.width/2.33, aImageview1.image.size.height/2.33);
    [aScrollView1 addSubview:aImageview1];
    
    [aScrollView1 setContentSize:CGSizeMake(aScrollView1.frame.size.width, aImageview1.image.size.height/2.33 + 100)];

    
    if (self.view.frame.size.height == 480)
        aExploreView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height/2 - self.view.frame.size.height/2.5, self.view.frame.size.width, self.view.frame.size.height/1.25)];
    else
        aExploreView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height/2 - self.view.frame.size.height/2.4, self.view.frame.size.width, self.view.frame.size.height/1.2)];

    
    aExploreView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:aExploreView];
    
    UIScrollView *aScrollView2 = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, aExploreView.frame.size.width, aExploreView.frame.size.height)];
    [aExploreView addSubview:aScrollView2];
    
    UIImageView *aImageview2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"serach_userImage.png"]];
    aImageview2.frame = CGRectMake(0, 0, aImageview2.image.size.width/2.33, aImageview2.image.size.height/2);
    [aScrollView2 addSubview:aImageview2];
    
    [aScrollView2 setContentSize:CGSizeMake(aScrollView2.frame.size.width, aImageview2.image.size.height/2 + 100)];
    
    if (self.view.frame.size.height == 480)
        aCameraView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height/2 - self.view.frame.size.height/2, self.view.frame.size.width, self.view.frame.size.height/1.12)];
    else
        aCameraView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height/2 - self.view.frame.size.height/2, self.view.frame.size.width, self.view.frame.size.height/1.1)];

    aCameraView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:aCameraView];
    
    if (self.view.frame.size.height == 480)
    {
        UIImageView *aImageview3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cameraImage.png"]];
        aImageview3.frame = CGRectMake(0, 0, aImageview3.image.size.width/2.3, aImageview3.image.size.height/2.55);
        [aCameraView addSubview:aImageview3];
    }
    else{
        UIImageView *aImageview3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cameraImage.png"]];
        aImageview3.frame = CGRectMake(0, 0, aImageview3.image.size.width/2.3, aImageview3.image.size.height/2.13);
        [aCameraView addSubview:aImageview3];
    }
    
    
    if (self.view.frame.size.height == 480)
        aMessageView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height/2 - self.view.frame.size.height/2.5, self.view.frame.size.width, self.view.frame.size.height/1.25)];
    else
        aMessageView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height/2 - self.view.frame.size.height/2.4, self.view.frame.size.width, self.view.frame.size.height/1.2)];

    aMessageView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:aMessageView];
    
    UIScrollView *aScrollView3 = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, aExploreView.frame.size.width, aExploreView.frame.size.height)];
    [aMessageView addSubview:aScrollView3];
    
    UIImageView *aImageview4 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"messagImages.png"]];
    aImageview4.frame = CGRectMake(0, 0, aImageview4.image.size.width/2.33, aImageview4.image.size.height/2);
    [aScrollView3 addSubview:aImageview4];
    
    [aScrollView3 setContentSize:CGSizeMake(aScrollView3.frame.size.width, aImageview4.image.size.height/2 + 100)];
    
    if (self.view.frame.size.height == 480)
        aProfileView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height/2 - self.view.frame.size.height/2.5, self.view.frame.size.width, self.view.frame.size.height/1.25)];
    else
        aProfileView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height/2 - self.view.frame.size.height/2.4, self.view.frame.size.width, self.view.frame.size.height/1.2)];

    aProfileView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:aProfileView];
    
    UIScrollView *aScrollView4 = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, aExploreView.frame.size.width, aExploreView.frame.size.height)];
    [aProfileView addSubview:aScrollView4];
    
    UIImageView *aImageview5 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"profileImage.png"]];
    aImageview5.frame = CGRectMake(0, 0, aImageview5.image.size.width/2.33, aImageview5.image.size.height/2);
    [aScrollView4 addSubview:aImageview5];
    
    [aScrollView4 setContentSize:CGSizeMake(aScrollView4.frame.size.width, aImageview5.image.size.height/2 + 100)];
    
    aHomeView.hidden = false;
    aExploreView.hidden = true;
    aCameraView.hidden = true;
    aMessageView.hidden = true;
    aProfileView.hidden = true;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma Home Btn Functionality
-(void) aBtnPressed : (UIButton *)aSender{
    if (aSender.tag == 1) {
        aHomeView.hidden = false;
        aExploreView.hidden = true;
        aCameraView.hidden = true;
        aMessageView.hidden = true;
        aProfileView.hidden = true;
        
        aImage1.hidden = true;
        aImage2.hidden = false;
        aImage3.hidden = false;
        aImage4.hidden = false;
        aImage5.hidden = false;
    }
    else if (aSender.tag == 2) {
        aHomeView.hidden = true;
        aExploreView.hidden = false;
        aCameraView.hidden = true;
        aMessageView.hidden = true;
        aProfileView.hidden = true;
        
        aImage1.hidden = false;
        aImage2.hidden = true;
        aImage3.hidden = false;
        aImage4.hidden = false;
        aImage5.hidden = false;
    }
    else if (aSender.tag == 3) {
        aHomeView.hidden = true;
        aExploreView.hidden = true;
        aCameraView.hidden = false;
        aMessageView.hidden = true;
        aProfileView.hidden = true;
        
        aImage1.hidden = false;
        aImage2.hidden = false;
        aImage3.hidden = true;
        aImage4.hidden = false;
        aImage5.hidden = false;
    }
    else if (aSender.tag == 4) {
        aHomeView.hidden = true;
        aExploreView.hidden = true;
        aCameraView.hidden = true;
        aMessageView.hidden = false;
        aProfileView.hidden = true;
        
        aImage1.hidden = false;
        aImage2.hidden = false;
        aImage3.hidden = false;
        aImage4.hidden = true;
        aImage5.hidden = false;
    }
    else if (aSender.tag == 5) {
        aHomeView.hidden = true;
        aExploreView.hidden = true;
        aCameraView.hidden = true;
        aMessageView.hidden = true;
        aProfileView.hidden = false;
        
        aImage1.hidden = false;
        aImage2.hidden = false;
        aImage3.hidden = false;
        aImage4.hidden = false;
        aImage5.hidden = true;
    }
}

@end
