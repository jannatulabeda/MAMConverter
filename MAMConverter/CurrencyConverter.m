//
//  FirstViewController.m
//  MAMConverter
//
//  Created by Md Mainul Haque on 2/8/16.
//  Copyright © 2016 Md Mainul Haque. All rights reserved.
//


#import "CurrencyConverter.h"

@interface CurrencyConverter ()
@property (nonatomic) BOOL isFromButtonTapped;
@property (nonatomic) BOOL isToButtonTapped;
@end

@implementation CurrencyConverter

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)selectToCountry:(id)sender {
  UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
  SelectCountryViewController *controller = (SelectCountryViewController  *)[mainStoryboard instantiateViewControllerWithIdentifier: @"SelectCountryView"];
  controller.countryDelegate = self;
  self.isToButtonTapped = YES;
  self.isFromButtonTapped = NO;
  [self.navigationController pushViewController:controller animated:YES];
}

- (IBAction)selectFromCountry:(id)sender {
  
  UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
  SelectCountryViewController *controller = (SelectCountryViewController  *)[mainStoryboard instantiateViewControllerWithIdentifier: @"SelectCountryView"];
  controller.countryDelegate = self;
  self.isFromButtonTapped = YES;
  self.isToButtonTapped = NO;
  [self.navigationController pushViewController:controller animated:YES];
}

- (IBAction)swapFromAndTo:(id)sender {
  NSString *fromButtonTitle = [self.fromButton currentTitle];
  NSString *toButtonTitle = [self.toButton currentTitle];
  
  [self.toButton setTitle:fromButtonTitle forState:UIControlStateNormal];
  [self.fromButton setTitle:toButtonTitle forState:UIControlStateNormal];
  self.entryAmountTextField.text = @"";
  [self.resultAmountLabel setText:@""];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
  NSString *updatedString = [textField.text
                             stringByReplacingCharactersInRange:range
                             withString:string];

  NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
  formatter.numberStyle = NSNumberFormatterDecimalStyle;
  NSNumber *entryAmountNumber = [formatter numberFromString:updatedString];
  double value = [entryAmountNumber doubleValue];
  value *= 2.0;
  entryAmountNumber = [NSNumber numberWithDouble:value];
  updatedString = [entryAmountNumber stringValue];

  self.resultAmountLabel.text = updatedString;
  return YES;
}

-(BOOL)textFieldShouldClear:(UITextField *)textField{
  self.resultAmountLabel.text = @"";
  return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
  [[self view] endEditing:YES];
}

-(void)selectCountryViewControllerDidSelect:(NSString *)currencyCodeString{
  if (self.isToButtonTapped) {
    [self.toButton setTitle:currencyCodeString forState:UIControlStateNormal];
  }
  if (self.isFromButtonTapped) {
    [self.fromButton setTitle:currencyCodeString forState:UIControlStateNormal];
  }
}
@end
