//
//  STLoginViewController.h
//  Stcoked
//
//  Created by Sandeep M on 01/04/15.
//  Copyright (c) 2015 Finnix Lab. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface STLoginViewController : UIViewController<UITextFieldDelegate>
{
    UIImageView *aNavigationImage;
    UIView *aLoginView,*aRegisterView;
    UITextField *aLoginUserNameTextField,*aLoginPwdTextField;
    UITextField *aRegisterEmailTextField,*aRegisterUserNameTextField,*aRegisterPwdTextField,*aRegisterConfirmPwdTextField;
}
@end
