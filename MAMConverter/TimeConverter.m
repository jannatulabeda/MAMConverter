//

//  SecondViewController.m

//  MAMConverter

//

//  Created by Md Mainul Haque on 2/8/16.

//  Copyright © 2016 Md Mainul Haque. All rights reserved.

//



#import "TimeConverter.h"



@interface TimeConverter ()



@end



@implementation TimeConverter



- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    
    
    
}



- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
    
}



- (IBAction)selectCountry:(id)sender {
    
    
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    
    [outputFormatter setDateFormat:@"h:mm:ss a"];
    
    
    
    self.timeLabel.text = [outputFormatter stringFromDate:self.takeTime.date];
    
    [outputFormatter setDateFormat:@"yyyy'-'MM'-'dd"];
    
    //NSDate *setDate =
    
    self.dateLabel.text = [outputFormatter stringFromDate:[self.takeDate date]];
    NSString *dateString = self.timeLabel.text;//self.dateLabel.text;
    NSLog(@"... %@ %@",[outputFormatter stringFromDate:self.takeTime.date],[NSTimeZone localTimeZone]);

    //NSString *str = @"2012-12-17 04:36:25";
    
    NSString *str = self.dateLabel.text;
    str = [str stringByAppendingString:@" "];
    str = [str stringByAppendingString:self.timeLabel.text];
    
    NSDateFormatter* gmtDf = [[NSDateFormatter alloc] init];
    [gmtDf setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
    [gmtDf setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate* gmtDate = [gmtDf dateFromString:str];
    NSLog(@">>>>%@",gmtDate);
    
    NSDateFormatter* estDf = [[NSDateFormatter alloc] init];
    [estDf setTimeZone:[NSTimeZone timeZoneWithName:@"EST"]];
    [estDf setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *estDate = [estDf dateFromString:[gmtDf stringFromDate:gmtDate]]; // you can also use str
    NSLog(@"%@",estDate);
    
    NSLog(@"*********%@",dateString);
    
    
    
}

@end

