//
//  SelectCountryViewController.h
//  MAMConverter
//
//  Created by Md Mainul Haque on 2/10/16.
//  Copyright © 2016 Md Mainul Haque. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SelectCountryViewController;

@protocol SelectCountryViewControllerDelegate <NSObject>

- (void)selectCountryViewControllerDidSelect:(NSString *)currencyCodeString;

@end

@interface SelectCountryViewController : UITableViewController <UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UISearchBar *currencySearchBar;

@property (weak, nonatomic) id<SelectCountryViewControllerDelegate>countryDelegate;

@end
