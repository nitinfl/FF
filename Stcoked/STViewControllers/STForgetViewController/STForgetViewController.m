//
//  STForgetViewController.m
//  Stcoked
//
//  Created by Jebaraj Daniel S on 01/04/15.
//  Copyright (c) 2015 Jebaraj Daniel S. All rights reserved.
//

#import "STForgetViewController.h"
#import "STLoginViewController.h"
#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)

@interface STForgetViewController ()

@end

@implementation STForgetViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"STCommonBg.png"]];

    // Do any additional setup after loading the view.
    
    UIImage *aBackBtnImage = [UIImage imageNamed:@"STResetBack.png"];
    UIImage *aSendMailBtnImage = [UIImage imageNamed:@"STResetSendMail.png"];
    
    UIImageView *aNavigationImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"STResetNavBar.png"]];
    aNavigationImage.frame = CGRectMake(0, 10, self.view.frame.size.width, aNavigationImage.bounds.size.height/2);
    [self.view addSubview:aNavigationImage];
    
    UIButton *aBackBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    aBackBtn.frame = CGRectMake(10, 10, aBackBtnImage.size.width/2, aBackBtnImage.size.height/2);
    [aBackBtn setImage:aBackBtnImage forState:UIControlStateNormal];
    [aBackBtn addTarget:self action:@selector(aBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    aBackBtn.tag = 1;
    [self.view addSubview:aBackBtn];
    
    UIImageView *aAppLogoImageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"STCommonLogo.png"]];
    aAppLogoImageView1.frame = CGRectMake(self.view.frame.size.width/2 - aAppLogoImageView1.image.size.width/8, aAppLogoImageView1.image.size.height/4, aAppLogoImageView1.image.size.width/4, aAppLogoImageView1.image.size.height/4);
    [self.view addSubview:aAppLogoImageView1];
    
    UIImageView *aAppLogoImageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"STResetTexts.png"]];
    aAppLogoImageView2.frame = CGRectMake(self.view.frame.size.width/2 - aAppLogoImageView2.image.size.width/5, aAppLogoImageView1.frame.origin.y + aAppLogoImageView1.image.size.height/2.5, aAppLogoImageView2.image.size.width/2.5, aAppLogoImageView2.image.size.height/2.5);
    [self.view addSubview:aAppLogoImageView2];
    
    UIImageView *aAppLogoImageView3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"STRessetEmail.png"]];
    aAppLogoImageView3.frame = CGRectMake(self.view.frame.size.width/2 - aAppLogoImageView3.image.size.width/4.6, aAppLogoImageView2.frame.origin.y + aAppLogoImageView2.image.size.height/1.5, aAppLogoImageView3.image.size.width/2.3, aAppLogoImageView3.image.size.height/2.3);
    [self.view addSubview:aAppLogoImageView3];
    
    UIButton *aSendMailBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    aSendMailBtn.frame = CGRectMake(self.view.frame.size.width/2 - aSendMailBtnImage.size.width/5 , aAppLogoImageView3.frame.origin.y + aAppLogoImageView2.image.size.height/1.5, aSendMailBtnImage.size.width/2.5, aSendMailBtnImage.size.height/2.5);
    [aSendMailBtn setImage:aSendMailBtnImage forState:UIControlStateNormal];
    [aSendMailBtn addTarget:self action:@selector(aBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    aSendMailBtn.tag = 2;
    [self.view addSubview:aSendMailBtn];
    
    if (self.view.frame.size.height == 480 && IS_RETINA == false)
        aResetMailTextField = [[UITextField alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - aAppLogoImageView2.image.size.width/5 + 5,aAppLogoImageView2.frame.origin.y + aAppLogoImageView2.image.size.height/1.35 + 8 ,aAppLogoImageView2.image.size.width/2.5,aAppLogoImageView2.image.size.height/2.5)];
    else
        aResetMailTextField = [[UITextField alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - aAppLogoImageView2.image.size.width/5 + 5,aAppLogoImageView2.frame.origin.y + aAppLogoImageView2.image.size.height/1.35 ,aAppLogoImageView2.image.size.width/2.5,aAppLogoImageView2.image.size.height/2.5)];
    
    aResetMailTextField.tag = 4;
    aResetMailTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    aResetMailTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    aResetMailTextField.backgroundColor = [UIColor clearColor];
    [aResetMailTextField setBorderStyle:UITextBorderStyleNone];
    [aResetMailTextField setDelegate:self];
    [aResetMailTextField setPlaceholder:@"Enter your mail id"];
    aResetMailTextField.clearsOnBeginEditing = TRUE;
    [self.view addSubview:aResetMailTextField];


}

#pragma mark TextField Delegates

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    
    return YES;
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    [textField resignFirstResponder];
    
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
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

#pragma Forget Btn Functionality
-(void) aBtnPressed : (UIButton *)aSender{
    if (aSender.tag == 1) {
//        STLoginViewController *aSTLoginViewController = [[STLoginViewController alloc] init];
//        [self.navigationController pushViewController:aSTLoginViewController animated:YES];
        [self.navigationController popViewControllerAnimated:true];
    }
    else if(aSender.tag == 2){
        [self.navigationController popViewControllerAnimated:true];
    }
}

@end
