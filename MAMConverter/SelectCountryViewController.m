//
//  SelectCountryViewController.m
//  MAMConverter
//
//  Created by Md Mainul Haque on 2/10/16.
//  Copyright © 2016 Md Mainul Haque. All rights reserved.
//

#import "SelectCountryViewController.h"
#import "Country.h"
#import "ConstantLiterals.h"

@interface SelectCountryViewController ()
@property (strong, nonatomic) NSMutableArray *countryList;
@property (strong, nonatomic) NSMutableArray *searchedCountryList;
@end

@implementation SelectCountryViewController

@synthesize countryDelegate;

- (void)viewDidLoad {
    [super viewDidLoad];
  
  NSDictionary *mainDictionary = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Currencies" ofType:@"plist"]];
  
  self.countryList = [[NSMutableArray alloc] init];
  for (NSDictionary *dict in [mainDictionary objectForKey:CURRENCY_LIST]) {
    Country *country = [[Country alloc] init];
    country.currencyName = [dict objectForKey:CURRENCY_NAME];
    country.currencyCode = [dict objectForKey:CURRENCY_CODE];
    
    [self.countryList addObject:country];
  }
  self.searchedCountryList = [[NSMutableArray alloc] initWithArray:self.countryList];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [self.searchedCountryList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CurrencyCodeCell" forIndexPath:indexPath];
  
  Country *country = [self.searchedCountryList objectAtIndex:indexPath.row];
  cell.textLabel.text = country.currencyName;
  cell.detailTextLabel.text = country.currencyCode;
  return cell;
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
  if ([searchText length] != 0) {
    [self.searchedCountryList removeAllObjects];
    for (Country *country in self.countryList) {
      NSRange r1 = [country.currencyCode rangeOfString:searchText options:NSCaseInsensitiveSearch];
      NSRange r2 = [country.currencyName rangeOfString:searchText options:NSCaseInsensitiveSearch];
        if ((r1.location != NSNotFound) || (r2.location != NSNotFound)) {
          [self.searchedCountryList addObject:country];
        }
    }
  } else {
    [self.searchedCountryList removeAllObjects];
    [self.searchedCountryList addObjectsFromArray:self.countryList];
  }
  
  [self.tableView reloadData];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  
  Country *temp = [self.searchedCountryList objectAtIndex:indexPath.row];
  [self.countryDelegate selectCountryViewControllerDidSelect:temp.currencyCode];
  [self.navigationController popViewControllerAnimated:YES];
}

@end
