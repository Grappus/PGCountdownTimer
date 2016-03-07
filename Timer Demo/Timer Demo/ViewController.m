//
//  ViewController.m
//  Timer Demo
//
//  Created by sismac009 on 07/03/16.
//  Copyright © 2016 sismac009. All rights reserved.
//

#import "ViewController.h"
#import "CountdownTimer.h"

@interface ViewController ()<CountdownTimerDelegate>
{
    CountdownTimer *timer;

}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self callTimer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)callTimer{
    
    timer = [CountdownTimer new];
    timer.delegate = self;
    [timer calculateTimeforDate:@"2016-03-08 16:30:00" withID:@"targetDate" andCount:1];
    NSDate *currentDate = [NSDate date];
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *currentDateInString = [dateFormatter stringFromDate:currentDate];
    [timer calculateTimeforDate:currentDateInString withID:@"currentDate" andCount:2];
}

#pragma CountDown Timer Delegate Response

-(void)receiveDay:(NSString *)currentDay andHour:(NSString *)currentHour andMinute:(NSString *)currentMinute andSecond:(NSString *)currentSecond{
    
    self.daysLbl.text = currentDay;
    self.hoursLbl.text = currentHour;
    self.minutesLbl.text = currentMinute;
    self.secondsLbl.text = currentSecond;
}

-(void)viewDidDisappear:(BOOL)animated{
    [timer pauseTimer];
}




@end
