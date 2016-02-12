//
//  MyTabViewController.m
//  Education
//
//  Created by Samuelhuang on 22/10/2015.
//  Copyright © 2015年 el2333. All rights reserved.
//

#import "MyTabViewController.h"

@interface MyTabViewController ()

@end

@implementation MyTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setItemsImages:@[@"hometab",@"messagetab",@"discovertab",@"metab"] selectedImages:@[@"hometab",@"messagetab",@"discovertab",@"metab"]];
   // self.tabBar.backgroundImage = [UIImage imageNamed:@"cm2_btm_bg"];
    [self.tabBar setShadowImage:[UIImage new]];
}


- (void)setItemsImages:(NSArray *)imageArray selectedImages:(NSArray *)selectedImageArray {
    for (int i = 0; i < self.tabBar.items.count; i ++) {
        UITabBarItem * barItem = self.tabBar.items[i];
        if (imageArray.count > i && selectedImageArray.count > i) {
            //这里是重点了，使用原始图片UIImageRenderingModeAlwaysOriginal，这样才能保证正常显示图片
            barItem.image = [[UIImage imageNamed:imageArray[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            barItem.selectedImage = [[UIImage imageNamed:selectedImageArray[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        }
    }
}


@end
