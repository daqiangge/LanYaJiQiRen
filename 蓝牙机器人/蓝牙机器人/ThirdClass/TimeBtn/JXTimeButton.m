//
//  JXTimeButton.m
//  JXTimeButton
//
//  Created by ZhuJingXun on 16/5/12.
//  Copyright © 2016年 ZhuJingXun. All rights reserved.
//

#import "JXTimeButton.h"

@implementation JXTimeButton
{
    UITapGestureRecognizer *tap;
    NSTimer * _timer;
    NSString* _beforeString;
    NSString* _markString;
    int       _timeNum;
    int       _i;
}
static char starKey;
static char stopKey;

- (instancetype)initWithFrame:(CGRect)frame AndBeforeTitle:(NSString *)beforeStr AndWorkingMarkStr:(NSString *)markStr AndTimeSum:(int)time AndTimeButtonStar:(void (^)(void))starBlock AndTimeButtonStop:(void (^)(void))stopBlock{
    self = [super initWithFrame:frame];
    if (self) {
        _i = 0;
        tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(actionTap)];
        tap.numberOfTouchesRequired = 1;
        [self addGestureRecognizer:tap];
        objc_setAssociatedObject(self, &starKey, starBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
        objc_setAssociatedObject(self, &stopKey, stopBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
        
        self.userInteractionEnabled = YES;
        _beforeString=beforeStr;
        self.text   = beforeStr;
        _markString = markStr;
        _timeNum    = time;
    }
    return self;
}

-(void)makeTimerWithNum:(int)timeNum{
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeGo) userInfo:nil repeats:YES];
    [_timer fire];
}

-(void)timeGo{
    _i ++;
    if(_i >= _timeNum){
        [self isFinish];
    }else{
        [self isWorking];
    }
}

-(void)isWorking{
    [self removeGestureRecognizer:tap];
    self.text = [NSString stringWithFormat:@"%@%d",_markString,_timeNum - _i];
}

-(void)isFinish{
    [_timer invalidate];
    [self timeStop];
    self.text = _beforeString;
    _i = 0;
    [self addGestureRecognizer:tap];
}

-(void)actionTap{
    void (^aBlock)(void) = objc_getAssociatedObject(self, &starKey);
    if (aBlock) aBlock();
    [self makeTimerWithNum:_timeNum];
}

-(void)timeStop{
    void (^stopBlock)(void) = objc_getAssociatedObject(self, &stopKey);
    if (stopBlock) stopBlock();
}

- (void)stop
{
    _i =60;
}

@end
