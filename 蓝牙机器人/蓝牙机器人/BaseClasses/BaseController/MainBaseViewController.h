//
//  MainBaseViewController.h
//  lingdaozhe
//
//  Created by liqiang on 16/5/5.
//  Copyright © 2016年 bckj. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MainBaseViewController : UIViewController


@property (nonatomic) BOOL supportPortraitOnly;
-(void)showHasNoUserTips;
-(void)showFailedTips:(NSString *)failedTips;
-(void)showSuccessTips:(NSString *)successTips;
@end
