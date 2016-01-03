//
//  CBFoodDataManager.m
//  tabletest
//
//  Created by Yun Juhyun on 2016. 1. 3..
//  Copyright © 2016년 whoride. All rights reserved.
//

#import "CBFoodDataManager.h"

@implementation CBFoodDataManager

@synthesize foodData;
@synthesize namesOfSectionHeader;

- (void)load {
    NSString* foodDataPath = [[NSBundle mainBundle] pathForResource:@"foods" ofType:@"plist"];
    if (!foodDataPath) {
        NSLog(@"[CBFoodDataManager] load - There is foods.plist.");
        return;
    }
    
    NSDictionary* dic = [NSDictionary dictionaryWithContentsOfFile:foodDataPath];
    foodData = [dic copy];
}


- (void)setSections:(NSArray *)sections {
    namesOfSectionHeader = [[NSArray arrayWithArray:sections] copy];
}
- (NSInteger)sectionsCount {
    return [namesOfSectionHeader count];
}

- (NSArray *)arrayOfAutoFoods {
    return [foodData objectForKey:@"AutoCook"];
}

- (NSArray *)arrayOfManualFoods {
    return [foodData objectForKey:@"ManualCook"];
}

@end
