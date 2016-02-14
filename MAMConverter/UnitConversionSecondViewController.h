//
//  UnitConversionSecondViewController.h
//  MAMConverter
//
//  Created by Abu Khalid on 2/12/16.
//  Copyright © 2016 Md Mainul Haque. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UnitConversionSecondViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIButton *fromUnitButton;
@property (weak, nonatomic) IBOutlet UIButton *toUnitButton;
@property (weak, nonatomic) IBOutlet UITextField *takingValueTextField;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
- (IBAction)fromAction:(id)sender;

- (IBAction)toAction:(id)sender;



@end
