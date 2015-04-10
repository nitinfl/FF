//
//  STLoginViewController.m
//  Stcoked
//
//  Created by Jebaraj Daniel S on 01/04/15.
//  Copyright (c) 2015 Jebaraj Daniel S. All rights reserved.
//

#import "STLoginViewController.h"
#import "STForgetViewController.h"
#import "STHomeViewController.h"

#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)


@interface STLoginViewController ()

@end

@implementation STLoginViewController

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
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"STCommonBg.png"]];
    

    aNavigationImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"STLoginNavBar1.png"]];
    aNavigationImage.frame = CGRectMake(0, 10, self.view.frame.size.width, aNavigationImage.bounds.size.height/2);
    [self.view addSubview:aNavigationImage];
    
    UIButton *aLoginNavBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    aLoginNavBtn.frame = CGRectMake(0, 10, aNavigationImage.bounds.size.width/2, aNavigationImage.bounds.size.height);
    [aLoginNavBtn addTarget:self action:@selector(aBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    aLoginNavBtn.tag = 4;
    [self.view addSubview:aLoginNavBtn];
    
    UIButton *aSignUpNavBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    aSignUpNavBtn.frame = CGRectMake(self.view.frame.size.width/2, 10, aNavigationImage.bounds.size.width/2, aNavigationImage.bounds.size.height);
    [aSignUpNavBtn addTarget:self action:@selector(aBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    aSignUpNavBtn.tag = 5;
    [self.view addSubview:aSignUpNavBtn];
    
    //Login View
    aLoginView = [[UIView alloc] initWithFrame:CGRectMake(0, aNavigationImage.bounds.size.height + 10, self.view.frame.size.width, self.view.frame.size.height - aNavigationImage.bounds.size.height - 10)];
    aLoginView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:aLoginView];
    
    UIImageView *aAppLogoImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"STCommonLogo.png"]];
    aAppLogoImageView.frame = CGRectMake(self.view.frame.size.width/2 - aAppLogoImageView.image.size.width/8, 10, aAppLogoImageView.image.size.width/4, aAppLogoImageView.image.size.height/4);
    [aLoginView addSubview:aAppLogoImageView];
    
    
    UIImage *aFBLoginImage = [UIImage imageNamed:@"STFBLoginBtn.png"];
    UIImage *aLoginBtnImage = [UIImage imageNamed:@"STLoginBtn.png"];
    UIImage *aForgetPwdBtnImage = [UIImage imageNamed:@"STForgetPasswordBtn.png"];
    UIImage *aRegisterBtnImage = [UIImage imageNamed:@"STRegister.png"];
    UIImage *aPrivacyPolicyBtnImage = [UIImage imageNamed:@"STPrivacyPolicy.png"];

    
    UIButton *aFacebookLoginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    aFacebookLoginBtn.frame = CGRectMake(aLoginView.frame.size.width/2 - aFBLoginImage.size.width/5 , aAppLogoImageView.frame.origin.y + aFBLoginImage.size.height/2 + 10, aFBLoginImage.size.width/2.5, aFBLoginImage.size.height/2.5);
    [aFacebookLoginBtn setImage:aFBLoginImage forState:UIControlStateNormal];
    [aFacebookLoginBtn addTarget:self action:@selector(aBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    aFacebookLoginBtn.tag = 1;
    [aLoginView addSubview:aFacebookLoginBtn];
    
    UIImageView *aOrImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"STloginOr.png"]];
    aOrImageView.frame = CGRectMake(self.view.frame.size.width/2 - aOrImageView.image.size.width/4, aFacebookLoginBtn.frame.origin.y + aFacebookLoginBtn.bounds.size.height + aFacebookLoginBtn.bounds.size.height/2, aOrImageView.image.size.width/2, aOrImageView.image.size.height/2);
    [aLoginView addSubview:aOrImageView];

    UIImageView *aUsernameTextImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"STloginUserAndPassword.png"]];
    aUsernameTextImageView.frame = CGRectMake(self.view.frame.size.width/2 - aUsernameTextImageView.image.size.width/4.6, aOrImageView.frame.origin.y + aOrImageView.image.size.height, aUsernameTextImageView.image.size.width/2.3, aUsernameTextImageView.image.size.height/2.3);
    [aLoginView addSubview:aUsernameTextImageView];
    
    if (self.view.frame.size.height == 480 && IS_RETINA == false)
        aLoginUserNameTextField = [[UITextField alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - aOrImageView.image.size.width/2.5,aUsernameTextImageView.frame.origin.y + 16,aUsernameTextImageView.image.size.width/2.8,aUsernameTextImageView.image.size.height/6)];
    else
        aLoginUserNameTextField = [[UITextField alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - aOrImageView.image.size.width/2.5,aUsernameTextImageView.frame.origin.y + 7,aUsernameTextImageView.image.size.width/2.8,aUsernameTextImageView.image.size.height/6)];

        
    aLoginUserNameTextField.tag = 1;
    aLoginUserNameTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    aLoginUserNameTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    aLoginUserNameTextField.backgroundColor = [UIColor clearColor];
    [aLoginUserNameTextField setBorderStyle:UITextBorderStyleNone];
    [aLoginUserNameTextField setDelegate:self];
    [aLoginUserNameTextField setPlaceholder:@"Username"];
    aLoginUserNameTextField.clearsOnBeginEditing = TRUE;
    [aLoginView addSubview:aLoginUserNameTextField];
    
    
    NSLog(@"frame hight:%f",self.view.frame.size.height);
    
    if (self.view.frame.size.height == 480 && IS_RETINA == false) {
        aLoginPwdTextField = [[UITextField alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - aOrImageView.image.size.width/2.5,aLoginUserNameTextField.frame.origin.y + aUsernameTextImageView.image.size.height/6 + 17,aUsernameTextImageView.image.size.width/2.8,aUsernameTextImageView.image.size.height/6)];
    }
    else if (self.view.frame.size.height == 480 && IS_RETINA == true) {
        aLoginPwdTextField = [[UITextField alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - aOrImageView.image.size.width/2.5,aLoginUserNameTextField.frame.origin.y + aUsernameTextImageView.image.size.height/6 + 13,aUsernameTextImageView.image.size.width/2.8,aUsernameTextImageView.image.size.height/6)];
        
    }
    else
        aLoginPwdTextField = [[UITextField alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - aOrImageView.image.size.width/2.5,aLoginUserNameTextField.frame.origin.y + aUsernameTextImageView.image.size.height/6 + 10,aUsernameTextImageView.image.size.width/2.8,aUsernameTextImageView.image.size.height/6)];
    
    aLoginPwdTextField.tag = 2;
    aLoginPwdTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    aLoginPwdTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    aLoginPwdTextField.backgroundColor = [UIColor clearColor];
    [aLoginPwdTextField setBorderStyle:UITextBorderStyleNone];
    [aLoginPwdTextField setDelegate:self];
    [aLoginPwdTextField setPlaceholder:@"Password"];
    aLoginPwdTextField.clearsOnBeginEditing = TRUE;
    [aLoginView addSubview:aLoginPwdTextField];

    
    UIButton *aLoginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    aLoginBtn.frame = CGRectMake(aLoginView.frame.size.width/2 - aLoginBtnImage.size.width/5 , aUsernameTextImageView.frame.origin.y + aUsernameTextImageView.image.size.height/2 + 10, aLoginBtnImage.size.width/2.5, aLoginBtnImage.size.height/2.5);
    [aLoginBtn setImage:aLoginBtnImage forState:UIControlStateNormal];
    [aLoginBtn addTarget:self action:@selector(aBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    aLoginBtn.tag = 2;
    [aLoginView addSubview:aLoginBtn];
    
    
    UIButton *aForgetPwdBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    aForgetPwdBtn.frame = CGRectMake(aLoginView.frame.size.width/2 - aForgetPwdBtnImage.size.width/5 , aLoginBtn.frame.origin.y + aLoginBtn.bounds.size.height + aLoginBtn.bounds.size.height/2, aForgetPwdBtnImage.size.width/2.5, aForgetPwdBtnImage.size.height/2.5);
    [aForgetPwdBtn setImage:aForgetPwdBtnImage forState:UIControlStateNormal];
    [aForgetPwdBtn addTarget:self action:@selector(aBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    aForgetPwdBtn.tag = 3;
    [aLoginView addSubview:aForgetPwdBtn];
    
    //Login View
    aRegisterView = [[UIView alloc] initWithFrame:CGRectMake(0, aNavigationImage.bounds.size.height + 10, self.view.frame.size.width, self.view.frame.size.height - aNavigationImage.bounds.size.height - 10)];
    aRegisterView.backgroundColor = [UIColor clearColor];
    aRegisterView.hidden = true;
    [self.view addSubview:aRegisterView];
    
    UIImageView *aAppLogoImageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"STCommonLogo.png"]];
    aAppLogoImageView1.frame = CGRectMake(self.view.frame.size.width/2 - aAppLogoImageView1.image.size.width/8, 10, aAppLogoImageView1.image.size.width/4, aAppLogoImageView1.image.size.height/4);
    [aRegisterView addSubview:aAppLogoImageView1];
    
    UIImageView *aRegisterTextImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"STRegisterText.png"]];
    aRegisterTextImageView.frame = CGRectMake(self.view.frame.size.width/2 - aRegisterTextImageView.image.size.width/4.6, aAppLogoImageView1.frame.origin.y + aAppLogoImageView1.image.size.height/2.5, aRegisterTextImageView.image.size.width/2.3, aRegisterTextImageView.image.size.height/2.3);
    [aRegisterView addSubview:aRegisterTextImageView];
    
    UIButton *aRegisterBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    aRegisterBtn.frame = CGRectMake(aRegisterView.frame.size.width/2 - aRegisterBtnImage.size.width/5 , aRegisterTextImageView.frame.origin.y + aRegisterTextImageView.image.size.height/2, aRegisterBtnImage.size.width/2.5, aRegisterBtnImage.size.height/2.5);
    [aRegisterBtn setImage:aRegisterBtnImage forState:UIControlStateNormal];
    [aRegisterBtn addTarget:self action:@selector(aBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    aRegisterBtn.tag = 6;
    [aRegisterView addSubview:aRegisterBtn];
    
    
    UIButton *aPrivacyPolicyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    aPrivacyPolicyBtn.frame = CGRectMake(aRegisterView.frame.size.width - aPrivacyPolicyBtnImage.size.width/2 , aRegisterBtn.frame.origin.y + aRegisterBtnImage.size.height/1.5, aPrivacyPolicyBtnImage.size.width/2.5, aPrivacyPolicyBtnImage.size.height/2.5);
    [aPrivacyPolicyBtn setImage:aPrivacyPolicyBtnImage forState:UIControlStateNormal];
    [aPrivacyPolicyBtn addTarget:self action:@selector(aBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    aPrivacyPolicyBtn.tag = 7;
    [aRegisterView addSubview:aPrivacyPolicyBtn];
    
    if (self.view.frame.size.height == 480 && IS_RETINA == false)
        aRegisterEmailTextField = [[UITextField alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - aOrImageView.image.size.width/2.7,aUsernameTextImageView.frame.origin.y - aUsernameTextImageView.image.size.height/4.5 + 6,aUsernameTextImageView.image.size.width/2.8,aUsernameTextImageView.image.size.height/6)];
    else
        aRegisterEmailTextField = [[UITextField alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - aOrImageView.image.size.width/2.7,aUsernameTextImageView.frame.origin.y - aUsernameTextImageView.image.size.height/4.5,aUsernameTextImageView.image.size.width/2.8,aUsernameTextImageView.image.size.height/6)];

    
    aRegisterEmailTextField.tag = 3;
    aRegisterEmailTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    aRegisterEmailTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    aRegisterEmailTextField.backgroundColor = [UIColor clearColor];
    [aRegisterEmailTextField setBorderStyle:UITextBorderStyleNone];
    [aRegisterEmailTextField setDelegate:self];
    [aRegisterEmailTextField setPlaceholder:@"Email"];
    aRegisterEmailTextField.clearsOnBeginEditing = TRUE;
    [aRegisterView addSubview:aRegisterEmailTextField];
    
    if (self.view.frame.size.height == 480 && IS_RETINA == false)
        aRegisterUserNameTextField = [[UITextField alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - aOrImageView.image.size.width/2.7,aUsernameTextImageView.frame.origin.y + 8,aUsernameTextImageView.image.size.width/2.8,aUsernameTextImageView.image.size.height/6)];
    else
        aRegisterUserNameTextField = [[UITextField alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - aOrImageView.image.size.width/2.7,aUsernameTextImageView.frame.origin.y,aUsernameTextImageView.image.size.width/2.8,aUsernameTextImageView.image.size.height/6)];

    aRegisterUserNameTextField.tag = 4;
    aRegisterUserNameTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    aRegisterUserNameTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    aRegisterUserNameTextField.backgroundColor = [UIColor clearColor];
    [aRegisterUserNameTextField setBorderStyle:UITextBorderStyleNone];
    [aRegisterUserNameTextField setDelegate:self];
    [aRegisterUserNameTextField setPlaceholder:@"Username"];
    aRegisterUserNameTextField.clearsOnBeginEditing = TRUE;
    [aRegisterView addSubview:aRegisterUserNameTextField];
    
    
    if (self.view.frame.size.height == 480 && IS_RETINA == false)
        aRegisterPwdTextField = [[UITextField alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - aOrImageView.image.size.width/2.7,aUsernameTextImageView.frame.origin.y + aUsernameTextImageView.image.size.height/4.5 + 8,aUsernameTextImageView.image.size.width/2.8,aUsernameTextImageView.image.size.height/6)];
    else
        aRegisterPwdTextField = [[UITextField alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - aOrImageView.image.size.width/2.7,aUsernameTextImageView.frame.origin.y + aUsernameTextImageView.image.size.height/4.5,aUsernameTextImageView.image.size.width/2.8,aUsernameTextImageView.image.size.height/6)];

    aRegisterPwdTextField.tag = 5;
    aRegisterPwdTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    aRegisterPwdTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    aRegisterPwdTextField.backgroundColor = [UIColor clearColor];
    [aRegisterPwdTextField setBorderStyle:UITextBorderStyleNone];
    [aRegisterPwdTextField setDelegate:self];
    [aRegisterPwdTextField setPlaceholder:@"Password"];
    aRegisterPwdTextField.clearsOnBeginEditing = TRUE;
    [aRegisterView addSubview:aRegisterPwdTextField];
    
    
    if (self.view.frame.size.height == 480 && IS_RETINA == false)
        aRegisterConfirmPwdTextField = [[UITextField alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - aOrImageView.image.size.width/2.7,aRegisterPwdTextField.frame.origin.y + aUsernameTextImageView.image.size.height/4.5 + 1,aUsernameTextImageView.image.size.width/2.8,aUsernameTextImageView.image.size.height/6)];
    else
        aRegisterConfirmPwdTextField = [[UITextField alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - aOrImageView.image.size.width/2.7,aRegisterPwdTextField.frame.origin.y + aUsernameTextImageView.image.size.height/4.5,aUsernameTextImageView.image.size.width/2.8,aUsernameTextImageView.image.size.height/6)];

    aRegisterConfirmPwdTextField.tag = 6;
    aRegisterConfirmPwdTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    aRegisterConfirmPwdTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    aRegisterConfirmPwdTextField.backgroundColor = [UIColor clearColor];
    [aRegisterConfirmPwdTextField setBorderStyle:UITextBorderStyleNone];
    [aRegisterConfirmPwdTextField setDelegate:self];
    [aRegisterConfirmPwdTextField setPlaceholder:@"Confirm Password"];
    aRegisterConfirmPwdTextField.clearsOnBeginEditing = TRUE;
    [aRegisterView addSubview:aRegisterConfirmPwdTextField];
    
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma Login Btn Functionality
-(void) aBtnPressed : (UIButton *)aSender{
    if (aSender.tag == 1) {
        // Fb login Btn
    }
    else if(aSender.tag == 2)
    {
        //Login Btn
        //Forget Pwd Btn
        if(aLoginUserNameTextField.text.length == 0)
        {
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Stocked" message:@"Please enter username" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            [alertView show];
            return;
        }
        else if(aLoginPwdTextField.text.length == 0)
        {
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Stocked" message:@"Please enter password" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            [alertView show];
            return;
        }
        else{
            STHomeViewController *aHomeViewController = [[STHomeViewController alloc] init];
            [self.navigationController pushViewController:aHomeViewController animated:YES];
        }
        
    }
    else if(aSender.tag == 3)
    {
        //Forget Pwd Btn
        STForgetViewController *aForgetViewController = [[STForgetViewController alloc] init];
        [self.navigationController pushViewController:aForgetViewController animated:YES];

    }
    else if(aSender.tag == 4)
    {
        // Login navigation Btn
        
        if (aLoginView.hidden == true && aRegisterView.hidden == false) {
            aLoginView.hidden = false;
            aRegisterView.hidden = true;
            [aNavigationImage setImage:[UIImage imageNamed:@"STLoginNavBar1.png"]];
        }

    }
    else if(aSender.tag == 5)
    {
        // Signup navigation Btn
        if (aLoginView.hidden == false && aRegisterView.hidden == true) {
            aRegisterView.hidden = false;
            aLoginView.hidden = true;
            [aNavigationImage setImage:[UIImage imageNamed:@"STLoginNavBar2.png"]];
        }
        
    }
    else if(aSender.tag == 6)
    {
        if(aRegisterEmailTextField.text.length == 0)
        {
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Stocked" message:@"Please enter email" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            [alertView show];
            return;
        }
        else if(aRegisterUserNameTextField.text.length == 0)
        {
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Stocked" message:@"Please enter Username" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            [alertView show];
            return;
        }
        else if(aRegisterPwdTextField.text.length == 0)
        {
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Stocked" message:@"Please enter password" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            [alertView show];
            return;
        }
        else if(aRegisterConfirmPwdTextField.text.length == 0)
        {
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Stocked" message:@"Please enter confirm password" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            [alertView show];
            return;
        }
        else{
            aLoginView.hidden = false;
            aRegisterView.hidden = true;
        }
    }
    else if(aSender.tag == 7)
    {
        
    }
    
}

#pragma mark TextField Delegates

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if([UIScreen mainScreen].applicationFrame.size.height < 568)
    {
        if (aLoginView.hidden == false) {
            [UIView animateWithDuration:0.5  delay:0  options:UIViewAnimationOptionBeginFromCurrentState animations:(void (^)(void)) ^{
                aLoginView.transform=CGAffineTransformMakeTranslation(0, -140);
            } completion:^(BOOL finished){
            }];
        }
        
        if (aRegisterView.hidden == false) {
            [UIView animateWithDuration:0.5  delay:0  options:UIViewAnimationOptionBeginFromCurrentState animations:(void (^)(void)) ^{
                aRegisterView.transform=CGAffineTransformMakeTranslation(0, -140);
            } completion:^(BOOL finished){
            }];
        }
        
    }
    return YES;
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if([UIScreen mainScreen].applicationFrame.size.height < 568)
    {
        if (aLoginView.hidden == false) {
            [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:(void (^)(void)) ^{
                aLoginView.transform=CGAffineTransformMakeTranslation(0, 0);
            }completion:^(BOOL finished){
                
            }];
        }
        if (aRegisterView.hidden == false) {
            [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:(void (^)(void)) ^{
                aRegisterView.transform=CGAffineTransformMakeTranslation(0, 0);
            }completion:^(BOOL finished){
                
            }];
        }
        
    }
    [textField resignFirstResponder];
    
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{    
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

@end
