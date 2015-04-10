//
//  STLoginViewController.h
//  Stcoked
//
//  Created by Jebaraj Daniel S on 01/04/15.
//  Copyright (c) 2015 Jebaraj Daniel S. All rights reserved.
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
