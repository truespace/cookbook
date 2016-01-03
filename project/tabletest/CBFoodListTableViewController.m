//
//  CBFoodListTableViewController.m
//  tabletest
//
//  Created by dongtan2 on 2016. 1. 3..
//  Copyright © 2016년 whoride. All rights reserved.
//

#import "CBFoodListTableViewController.h"
#import "CBFoodDataManager.h"
#import "common.h"

@interface CBFoodListTableViewController ()

@end

@implementation CBFoodListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    // names of sections
    _foodDataManager = [[CBFoodDataManager alloc] init];
    [_foodDataManager load];
    [_foodDataManager setSections:@[@"자동 설정 요리", @"수동 설정 요리"]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [_foodDataManager sectionsCount];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == eFoodAutoCook) {
        return [[_foodDataManager arrayOfAutoFoods] count];
    }
    else if (section == eFoodManualCook) {
        return [[_foodDataManager arrayOfManualFoods] count];
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FoodInfoCell" forIndexPath:indexPath];
    
    // Configure the cell...
    NSArray* arrayOfAuto = [_foodDataManager arrayOfAutoFoods];
    NSArray* arrayOfManual = [_foodDataManager arrayOfManualFoods];
    
    // UI
    UILabel* labelTitle = nil;
    UIImage* imagePosition = nil;
    UIImage* imageCategoryFirst = nil;
    UIImage* imageCategorySecond = nil;
    UIImage* imageCategoryThird = nil;
    
    for (UIView* view in cell.contentView.subviews) {
        if (view.tag == kCellTagTitle) {        // labelTitle;
            labelTitle = (UILabel *)[view viewWithTag:kCellTagTitle];
        }
        else if (view.tag == kCellTagSettingsPosition) {
            imagePosition = (UIImage *)[view viewWithTag:kCellTagSettingsPosition];
        }
        else if (view.tag == kCellTagSettingsCategoryFirst) {
            imageCategoryFirst = (UIImage *)[view viewWithTag:kCellTagSettingsCategoryFirst];
        }
        else if (view.tag == kCellTagSettingsCategorySecond) {
            imageCategorySecond = (UIImage *)[view viewWithTag:kCellTagSettingsCategorySecond];
        }
        else if (view.tag == kCellTagSettingsCategoryThird) {
            imageCategoryThird = (UIImage *)[view viewWithTag:kCellTagSettingsCategoryThird];
        }
        
    }
    
    // Data
    NSString* title = nil;
    NSString* position = nil;
    
    if (indexPath.section == eFoodAutoCook) {
        title = [[arrayOfAuto objectAtIndex:indexPath.row] objectForKey:@"Name"];
        position = [NSString stringWithFormat:@"pos%ld", [[arrayOfAuto objectAtIndex:indexPath.row] objectForKey:@"Settings"
    }
    else if (indexPath.section == eFoodManualCook) {
        title = [[arrayOfManual objectAtIndex:indexPath.row] objectForKey:@"Name"];
    }
    [labelTitle setText:title];
    
    return cell;
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [[_foodDataManager namesOfSectionHeader] objectAtIndex:section];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100.0f;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
