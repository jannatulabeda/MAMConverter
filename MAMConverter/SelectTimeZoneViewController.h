//
//  SelectTimeZoneViewController.h
//  MAMConverter
//
//  Created by Abu Khalid on 2/10/16.
//  Copyright © 2016 Md Mainul Haque. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SelectTimeZoneViewControllerDelegate <NSObject>
-(void) selectTimeZone:(NSString *)nameTimeZone;
@end


@interface SelectTimeZoneViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UITableView *selectTimeZoneTableView;
@property (weak, nonatomic) IBOutlet UISearchBar *timeZoneSearchBar;
@property (copy, nonatomic) NSArray *zoneValueArray;//total Array....
@property (copy, nonatomic) NSArray *zoneKeyArray;
@property (weak, nonatomic) id <SelectTimeZoneViewControllerDelegate> delegate;
@property (strong, nonatomic) NSMutableArray *displayZoneValueArray;

@end
