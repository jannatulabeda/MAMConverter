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
    
    // Set 
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}

- (IBAction)selectZone:(id)sender {
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    SelectTimeZoneViewController *controller = (SelectTimeZoneViewController  *)[mainStoryboard instantiateViewControllerWithIdentifier: @"SelectTimeZone"];
    controller.delegate = self;
    [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark - Delegate method

-(void) selectTimeZone:(NSString *)nameTimeZone {
    NSDate *takenDate = [[NSDate alloc] init];    
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    //combining separate date and time........
    [outputFormatter setTimeZone:[NSTimeZone localTimeZone]];
    [outputFormatter setDateFormat:@"h:mm a"];
    NSString *timeString = [outputFormatter stringFromDate:self.timeFromDatePicker.date];
    [outputFormatter setDateFormat:@"yyyy'-'MM'-'dd' '"];
    NSString *dateString = [outputFormatter stringFromDate:self.dateFromDatePicker.date];
    [outputFormatter setDateFormat:@"yyyy'-'MM'-'dd h:mm a"];
    NSString *takenDateString = dateString;
    takenDateString = [dateString stringByAppendingString:timeString];
    //getting the time from date picker
    takenDate = [outputFormatter dateFromString:takenDateString];
    //changing timezone according to selection using separate date formatter
    NSDateFormatter *outputFormatter1 = [[NSDateFormatter alloc] init];
    [outputFormatter1 setDateFormat:@"yyyy'-'MM'-'dd h:mm a"];
    [outputFormatter1 setTimeZone:[NSTimeZone timeZoneWithName:nameTimeZone]];
    //result date and time...
    [self.selectZoneButton setTitle:nameTimeZone forState:UIControlStateNormal];
    self.dateLabel.text = [outputFormatter1 stringFromDate:takenDate];
}

@end

