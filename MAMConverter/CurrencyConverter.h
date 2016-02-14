//
//  FirstViewController.h
//  MAMConverter
//
//  Created by Md Mainul Haque on 2/8/16.
//  Copyright © 2016 Md Mainul Haque. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SelectCountryViewController.h"

@interface CurrencyConverter : UIViewController <UITextFieldDelegate, SelectCountryViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UIButton *fromButton;
@property (weak, nonatomic) IBOutlet UIButton *toButton;
@property (weak, nonatomic) IBOutlet UITextField *entryAmountTextField;
@property (weak, nonatomic) IBOutlet UIButton *swapCurrencyButton;
@property (weak, nonatomic) IBOutlet UILabel *resultAmountLabel;
- (IBAction)selectToCountry:(id)sender;
- (IBAction)selectFromCountry:(id)sender;
- (IBAction)swapFromAndTo:(id)sender;

@end

