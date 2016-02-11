//

//  SecondViewController.h

//  MAMConverter

//

//  Created by Md Mainul Haque on 2/8/16.

//  Copyright © 2016 Md Mainul Haque. All rights reserved.

//



#import <UIKit/UIKit.h>
#import "SelectTimeZoneViewController.h"


@interface TimeConverter : UIViewController <SelectTimeZoneViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UIDatePicker *dateFromDatePicker;
@property (weak, nonatomic) IBOutlet UIDatePicker *timeFromDatePicker;

- (IBAction)selectZone:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *selectZoneButton;

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end

