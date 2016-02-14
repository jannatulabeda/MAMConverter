//
//  UnitConversionSecondViewController.m
//  MAMConverter
//
//  Created by Abu Khalid on 2/12/16.
//  Copyright © 2016 Md Mainul Haque. All rights reserved.
//

#import "UnitConversionSecondViewController.h"

@interface UnitConversionSecondViewController ()

@end

@implementation UnitConversionSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
  
  NSString *updatedString = [textField.text stringByReplacingCharactersInRange:range
                                                                    withString:string];
  
  NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
  formatter.numberStyle = NSNumberFormatterDecimalStyle;
  NSNumber *entryAmountNumber = [formatter numberFromString:updatedString];
  double value = [entryAmountNumber doubleValue];
  value *= 0.5;
  entryAmountNumber = [NSNumber numberWithDouble:value];
  updatedString = [entryAmountNumber stringValue];
  self.resultLabel.text = updatedString;
  return YES;
}

-(BOOL)textFieldShouldClear:(UITextField *)textField{
  self.resultLabel.text = @"";
  return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
  [[self view] endEditing:YES];
}

- (IBAction)fromAction:(id)sender {
  
  UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"FromUnit"
                                                                 message:@"This is an action sheet."
                                                          preferredStyle:UIAlertControllerStyleActionSheet];
  UIAlertAction *firstAction = [UIAlertAction actionWithTitle:@"one"
                                                        style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                                                          [self.fromUnitButton setTitle:@"one" forState:UIControlStateNormal];
                                                        }];
  UIAlertAction *secondAction = [UIAlertAction actionWithTitle:@"two"
                                                         style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                                                           [self.fromUnitButton setTitle:@"two" forState:UIControlStateNormal];
                                                         }];
  [alert addAction:firstAction];
  [alert addAction:secondAction];
  
  [self presentViewController:alert animated:YES completion:nil];
}

- (IBAction)toAction:(id)sender {
  
  UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"ToUnit"
                                                                 message:@"This is an action sheet."
                                                          preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *firstAction = [UIAlertAction actionWithTitle:@"one"
                                                          style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                                                            [self.toUnitButton setTitle:@"one" forState:UIControlStateNormal];
                                                          }];
    UIAlertAction *secondAction = [UIAlertAction actionWithTitle:@"two"
                                                           style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                                            [self.toUnitButton setTitle:@"two" forState:UIControlStateNormal];                                                                            }];
    [alert addAction:firstAction];
    [alert addAction:secondAction];
  
  [self presentViewController:alert animated:YES completion:nil];
}
@end
