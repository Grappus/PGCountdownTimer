//
//  CountdownTimer.h
//  WonderFruitApp
//
//  Created by sismac009 on 20/11/15.
//  Copyright © 2015 sismac003. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol CountdownTimerDelegate <NSObject>

-(void)receiveDay:(NSString*)currentDay andHour:(NSString*)currentHour andMinute:(NSString*)currentMinute andSecond:(NSString*)currentSecond;

-(void)timerStopped;
@end
@interface CountdownTimer : NSObject
{
    int yearLoopCounter;
    int isYearLoopCounterLeap;
    int totalDays;
    int isDesiredYearLeap;
    int numberOfDaysTillTargetDate;
    int numberOfDaysTillCurrentDate;
    int daysDifference;
    
    NSString *strSec;
    NSString *strMin;
    NSString *strHour;
    NSString *strDay;
    NSString *strMonth;
   
    int second;
    int minute;
    int hour;
    int day;
    int month;
    int targetHour;
    int targetDay;
    int targetYear;
    int targetMonth;
    int targetSecond;
    int targetMinute;
    
    int finalHour;
    int currentHour;
    int finalSecond;
    int currentSecond;
    int finalMinute;
    int currentMinute;
    
    NSDate *finalDate;
    NSDate *currentDate;
    
    
    NSString *labelDay;
    NSString *labelHour;
    NSString *labelMinute;
    NSString *labelSecond;
    
    NSTimer *myTimer;
}

@property id<CountdownTimerDelegate> delegate;



-(void)myTimer;
-(void)calculateTimeforDate:(NSString*)str withID:(NSString*)dateID andCount:(int)count;
-(void)pauseTimer;
@end
