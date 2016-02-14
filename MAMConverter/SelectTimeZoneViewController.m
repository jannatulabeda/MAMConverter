//
//  SelectTimeZoneViewController.m
//  MAMConverter
//
//  Created by Abu Khalid on 2/10/16.
//  Copyright © 2016 Md Mainul Haque. All rights reserved.
//

#import "SelectTimeZoneViewController.h"

@interface SelectTimeZoneViewController ()

@end

@implementation SelectTimeZoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.zoneValueArray = [[NSTimeZone abbreviationDictionary] allValues];
    self.zoneKeyArray = [[NSTimeZone abbreviationDictionary] allKeys];
    self.displayZoneValueArray = [[NSMutableArray alloc] initWithArray:self.zoneValueArray];
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

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.displayZoneValueArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *selectTimeZones = @"SelectTimeZonesCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:selectTimeZones];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:selectTimeZones];
    }
    cell.textLabel.text = [self.displayZoneValueArray objectAtIndex:indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *timeZoneName = [[NSString alloc] init];
    //getting time zone name from the time zone name array...
    timeZoneName = [self.displayZoneValueArray objectAtIndex:indexPath.row];
    //calling the delegate method...
    [self.delegate selectTimeZone:timeZoneName];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    if ([searchText length] != 0) {
        [self.displayZoneValueArray removeAllObjects];
        for (NSString *zone in self.zoneValueArray) {
            NSRange r1 = [zone rangeOfString:searchText options:NSCaseInsensitiveSearch];
            if ((r1.location != NSNotFound)) {
                [self.displayZoneValueArray addObject:zone];
            }
        }
    } else {
        [self.displayZoneValueArray removeAllObjects];
        [self.displayZoneValueArray addObjectsFromArray:self.zoneValueArray];
    }
    
    [self.selectTimeZoneTableView reloadData];
}

@end
