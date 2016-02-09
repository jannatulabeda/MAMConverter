//

//  SecondViewController.h

//  MAMConverter

//

//  Created by Md Mainul Haque on 2/8/16.

//  Copyright © 2016 Md Mainul Haque. All rights reserved.

//



#import <UIKit/UIKit.h>



@interface TimeConverter : UIViewController

@property (weak, nonatomic) IBOutlet UIDatePicker *takeDate;

@property (weak, nonatomic) IBOutlet UIDatePicker *takeTime;

- (IBAction)selectCountry:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;



@end

