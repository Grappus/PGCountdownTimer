//
//  CountdownTimer.m
//  WonderFruitApp
//
//  Created by sismac009 on 20/11/15.
//  Copyright © 2015 sismac003. All rights reserved.
//

#import "CountdownTimer.h"

@implementation CountdownTimer

-(void)calculateTimeforDate:(NSString*)str withID:(NSString*)dateID andCount:(int)count{

    NSDateFormatter *dateFormatter = [NSDateFormatter new];
/*code for destination time*/
    
    NSString *targetString = str;
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *targetDate = [dateFormatter dateFromString:targetString];
   
    [dateFormatter setDateFormat:@"HH"];
    NSString *targetHourString = [dateFormatter stringFromDate:targetDate];
    targetHour = [targetHourString intValue];//14
    
    [dateFormatter setDateFormat:@"ss"];
    NSString *targetSecString = [dateFormatter stringFromDate:targetDate];
    targetSecond = [targetSecString intValue];
    
    [dateFormatter setDateFormat:@"mm"];
    NSString *targetMinString = [dateFormatter stringFromDate:targetDate];
    targetMinute = [targetMinString intValue];
    
    [dateFormatter setDateFormat:@"dd"];
    NSString *targetDayString = [dateFormatter stringFromDate:targetDate];
    targetDay = [targetDayString intValue];
    
    [dateFormatter setDateFormat:@"yyyy"];
    NSString *targetYearString = [dateFormatter stringFromDate:targetDate];
    targetYear = [targetYearString intValue];
    
    [dateFormatter setDateFormat:@"MM"];
    NSString *targetMonthString = [dateFormatter stringFromDate:targetDate];
    targetMonth = [targetMonthString intValue];
    if([dateID isEqualToString:@"targetDate"]){
        finalHour = targetHour;
        finalSecond = targetSecond;
        finalMinute = targetMinute;
        finalDate = targetDate;
    }
    else if([dateID isEqualToString:@"currentDate"]){
        currentHour = targetHour;
        currentSecond = targetSecond;
        currentMinute = targetMinute;
        currentDate = targetDate;
    }
    
    if ([finalDate timeIntervalSinceDate:currentDate]<0) {
        [self.delegate receiveDay:@"0" andHour:@"0" andMinute:@"0" andSecond:@"0"];
        [self.delegate timerStopped];
        return;
    }
    
    if(count == 2){
        if(currentSecond>finalSecond){
            labelSecond = [NSString stringWithFormat:@"%d",((60-currentSecond)+finalSecond)-1];
            
        }
        else if(finalSecond>=currentSecond){
                labelSecond = [NSString stringWithFormat:@"%d",finalSecond-currentSecond-1];
        }
        
        if(currentMinute>finalMinute){
                labelMinute = [NSString stringWithFormat:@"%d",((60-currentMinute)+finalMinute)-1];
        }
        else if (finalMinute>currentMinute){
            labelMinute = [NSString stringWithFormat:@"%d",finalMinute-currentMinute-1];
        }
        else if(finalMinute==currentMinute){
            labelMinute = [NSString stringWithFormat:@"%d",finalMinute-currentMinute];
        }
        
        if(currentHour>finalHour){
            labelHour = [NSString stringWithFormat:@"%d",((24-currentHour)+finalHour)-1];
        }
        else if (finalHour>currentHour){
            labelHour = [NSString stringWithFormat:@"%d",finalHour-currentHour-1];

        }
        else if (finalHour==currentHour){
            if(finalMinute<currentMinute){
                labelHour =@"23";
            }
            else
                labelHour = [NSString stringWithFormat:@"%d",finalHour-currentHour];
        }
        
    }
    int yearCount=0;
            yearCount = targetYear - 2015 + 1;
    if(count==2)
        totalDays = 0;
    
    for(yearLoopCounter=2015;yearLoopCounter<=targetYear;yearLoopCounter++){

        if(yearCount > 1){
            //check if yearLoopCounter is leap or not
            isYearLoopCounterLeap = [self leapYearOrNot:yearLoopCounter];
            
            if(isYearLoopCounterLeap == 1){
                
                /*yearLoopCounter is leap.So feb has 29 days.Therefore,total
                 days are 366
                 */
                totalDays = totalDays+366;     
            }//inner if ends here
        
            else{
                
                //yearLoopCounter is not leap.
                totalDays = totalDays + 365;
            }    
        }//outer if ends here
        if(yearCount == 1){
            
            isDesiredYearLeap =[self leapYearOrNot:targetYear];
            switch(targetMonth){
                case 1:
                    targetDay = totalDays+targetDay;
                    break;
                    
                case 2:
                    targetDay = totalDays+31+targetDay;
                    break;
                    
                case 3:{
                    if(isDesiredYearLeap == 1)
                        targetDay = totalDays+31+29+targetDay;
                    else
                        targetDay = totalDays+31+28+targetDay;
                }
                    break;
                    
                case 4:{
                    if(isDesiredYearLeap == 1)
                        targetDay = totalDays+31+29+31+targetDay;
                    else
                        targetDay = totalDays+31+28+31+targetDay;
                }
                    break;
                    
                case 5:{
                    if(isDesiredYearLeap == 1)
                        targetDay = totalDays+31+29+31+30+targetDay;
                    else
                        targetDay = totalDays+31+28+31+30+targetDay;
                }
                    break;
                    
                case 6:{
                    if(isDesiredYearLeap == 1)
                        targetDay = totalDays+31+29+31+30+31+targetDay;
                    else
                        targetDay = totalDays+31+28+31+30+31+targetDay;
                }
                    break;
                    
                case 7:{
                    if(isDesiredYearLeap == 1)
                        targetDay = totalDays+31+29+31+30+31+30+targetDay;
                    else
                        targetDay =  totalDays+31+28+31+30+31+30+targetDay;
                }
                    break;
                    
                case 8:{
                    if(isDesiredYearLeap == 1)
                        targetDay = totalDays+31+29+31+30+31+30+31+targetDay;
                    else
                        targetDay = totalDays+31+28+31+30+31+30+31+targetDay;
                }
                    break;
                    
                case 9:{
                    if(isDesiredYearLeap == 1)
                        targetDay = totalDays+31+29+31+30+31+30+31+31+targetDay;
                    else
                        targetDay = totalDays+31+28+31+30+31+30+31+31+targetDay;
                }
                    break;
                    
                case 10:{
                    if(isDesiredYearLeap == 1)
                        targetDay = totalDays+31+29+31+30+31+30+31+31+30+targetDay;
                    else
                        targetDay = totalDays+31+28+31+30+31+30+31+31+30+targetDay;
                }
                    break;
                    
                case 11:{
                    if(isDesiredYearLeap == 1)
                        targetDay = totalDays+31+29+31+30+31+30+31+31+30+31+targetDay;
                    else
                        targetDay = totalDays+31+28+31+30+31+30+31+31+30+31+targetDay;
                } 
                    break;
                    
                case 12:{
                    if(isDesiredYearLeap == 1)
                        targetDay = totalDays+31+29+31+30+31+30+31+31+30+31+30+targetDay;
                    else
                        targetDay = totalDays+31+28+31+30+31+30+31+31+30+31+30+targetDay;
                } 
                    break;
                    
                default:
                    NSLog(@"Invalid month");
                    break; 
            }//switch ends here
            
        }//if ends here
        
        yearCount--;
        
    }//for ends here
    
    NSLog(@"%d",targetDay);//total number of days since 1jan 2015
    
     if([dateID isEqualToString:@"targetDate"])
        numberOfDaysTillTargetDate = targetDay;

     else if([dateID isEqualToString:@"currentDate"])
     {
         numberOfDaysTillCurrentDate = targetDay;
         daysDifference = numberOfDaysTillTargetDate - numberOfDaysTillCurrentDate;
     }
    
NSLog(@"currentHour==%d",currentHour);
    
        if(count == 2){
            
            
            if (finalHour>currentHour){
            //on labelHour.text<-targetHour-currentHour
                labelDay = [NSString stringWithFormat:@"%d",daysDifference];
            }
            else if (currentHour>finalHour){
                daysDifference = daysDifference-1;
                labelDay = [NSString stringWithFormat:@"%d",daysDifference];
            }
            else if (currentHour==finalHour){
                labelDay = [NSString stringWithFormat:@"%d",daysDifference];

            }
            if([labelHour isEqualToString:@"23"])
                labelDay = [NSString stringWithFormat:@"%d",daysDifference-1];
            [self.delegate receiveDay:labelDay andHour:labelHour andMinute:labelMinute andSecond:labelSecond];
             myTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(myTimer) userInfo:nil repeats:YES];
        }
    
}



-(void)myTimer{
    
    if([labelSecond isEqualToString:@"0"]){
        
        if([labelMinute isEqualToString:@"0"]){
            
            if([labelHour isEqualToString:@"0"]){
               
                if(daysDifference == 0){
                    [myTimer invalidate];
                    [self.delegate timerStopped];
                    return;
                }
                labelDay = [NSString stringWithFormat:@"%d",daysDifference-1];
            }
            labelMinute =[NSString stringWithFormat:@"%d",60];
            labelHour = [NSString stringWithFormat:@"%d",[labelHour intValue]-1] ;
        }
        
       labelSecond = [NSString stringWithFormat:@"%d",60];
       labelMinute = [NSString stringWithFormat:@"%d",[labelMinute intValue]-1] ;
    }
  
    labelSecond = [NSString stringWithFormat:@"%d",[labelSecond intValue]-1];
    [self.delegate receiveDay:labelDay andHour:labelHour andMinute:labelMinute andSecond:labelSecond];
}



-(int)leapYearOrNot:(int)year{
            
            if(year%4 == 0 && ((year%100 == 0 && year%400 == 0) || (year% 100 != 0 && year%400 != 0)))
                return 1;
            else
                return 0;   
        }

-(void)pauseTimer{
    [myTimer invalidate];
}

@end








