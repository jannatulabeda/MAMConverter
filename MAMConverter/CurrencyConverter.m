//
//  FirstViewController.m
//  MAMConverter
//
//  Created by Md Mainul Haque on 2/8/16.
//  Copyright © 2016 Md Mainul Haque. All rights reserved.
//


#import "CurrencyConverter.h"
#import "ConstantLiterals.h"
#import <QuartzCore/QuartzCore.h>

@interface CurrencyConverter ()
@property (nonatomic) BOOL isFromButtonTapped;
@property (nonatomic) BOOL isToButtonTapped;
@property (strong, nonatomic) IBOutlet UIView *containerView;
@end

@implementation CurrencyConverter

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Set containerView
    [self.containerView.layer setBorderWidth:1.0];
    [self.containerView.layer setBorderColor:[UIColor colorWithRed:253.0/255.0 green:147.0/255.0 blue:11.0/255.0 alpha:1.0].CGColor];
    [self.containerView.layer setCornerRadius:8.0];
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
  [self.resultAmountLabel setText:DEFAULT_VALUE_FOR_RESULT_LABEL];
  
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
  NSString *entryAmountString = [textField.text
                             stringByReplacingCharactersInRange:range
                             withString:string];
  
  __block NSString *stringData;
  NSString *fromCountryCode = [self.fromButton currentTitle];
  NSString *toCountryCode = [self.toButton currentTitle];
  NSString *currencyURLString = [NSString stringWithFormat:URL_STRING_WITH_FORMAT, fromCountryCode, toCountryCode, entryAmountString, API_KEY];
  
  NSURL *currencyURL = [NSURL URLWithString:currencyURLString];
  
  NSURLRequest *request = [NSURLRequest requestWithURL:currencyURL];
  NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * data, NSURLResponse * response, NSError *  error) {
    stringData = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    dispatch_async(dispatch_get_main_queue(), ^{
      self.resultAmountLabel.text = stringData;
    });
  }];
  [dataTask resume];
  return YES;
}

-(BOOL)textFieldShouldClear:(UITextField *)textField{
  self.resultAmountLabel.text = DEFAULT_VALUE_FOR_RESULT_LABEL;
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
  self.resultAmountLabel.text = DEFAULT_VALUE_FOR_RESULT_LABEL;
}

@end
