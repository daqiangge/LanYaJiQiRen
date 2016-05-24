//
//  JXTimeButton.h
//  JXTimeButton
//
//  Created by ZhuJingXun on 16/5/12.
//  Copyright © 2016年 ZhuJingXun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import <Foundation/Foundation.h>
typedef void (^ActionBlock)();

@interface JXTimeButton : UILabel

- (instancetype)initWithFrame:(CGRect)frame AndBeforeTitle:(NSString*)beforeStr AndWorkingMarkStr:(NSString*)markStr AndTimeSum:(int)time AndTimeButtonStar:(void(^)(void))starBlock AndTimeButtonStop:(void(^)(void))stopBlock;
@end
