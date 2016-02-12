//
//  LoginViewController.m
//  Education
//
//  Created by Samuelhuang on 2/2/2016.
//  Copyright © 2016年 el2333. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginViewModel.h"

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *userTxt;
@property (weak, nonatomic) IBOutlet UITextField *pwdTxt;
@property(nonatomic,strong)LoginViewModel *viewModel;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _viewModel = [LoginViewModel new];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark -action

-(IBAction)loginEvent:(id)sender{

    _viewModel.userName = self.userTxt.text;
    _viewModel.pwd = self.pwdTxt.text;
    [_viewModel.loginSignal subscribeNext:^(NSNumber *valid) {
        if ([valid boolValue]) {
            [self dismissViewControllerAnimated:YES completion:nil];
        }else{
            [SVProgressHUD showErrorWithStatus:@"登录错误"];
        }
    }];
    
}

- (IBAction)backEvent:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
