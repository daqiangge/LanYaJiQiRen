//
//  BaseModel.h
//  lingdaozhe
//
//  Created by liqiang on 16/4/20.
//  Copyright © 2016年 bckj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject

@property (nonatomic, assign) NSInteger success;

@property (nonatomic, strong) id data;


@property (nonatomic, copy) NSString *message;

@end
