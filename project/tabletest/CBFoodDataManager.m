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

- (NSDictionary *)autoFoodDataAtIndex:(NSInteger)index {
    return [[self arrayOfAutoFoods] objectAtIndex:index];
}

- (NSString *)nameOfAutoFoodDataAtIndex:(NSInteger)index {
    return [[self autoFoodDataAtIndex:index] objectForKey:@"Name"];
}

- (NSArray *)howToMakeOfAutoFoodDataAtIndex:(NSInteger)index {
    return [[self autoFoodDataAtIndex:index] objectForKey:@"HowToMake"];
}

- (NSArray *)ingredientsOfAutoFoodDataAtIndex:(NSInteger)index {
    return [[self autoFoodDataAtIndex:index] objectForKey:@"Ingredients"];
}

- (NSDictionary *)settingsOfAutoFoodDataAtIndex:(NSInteger)index {
    return [[self autoFoodDataAtIndex:index] objectForKey:@"Settings"];
}

- (NSNumber *)positionOfAutoFoodDataAtIndex:(NSInteger)index {
    return [[self settingsOfAutoFoodDataAtIndex:index] objectForKey:@"Position"];
}

- (NSString *)categoryOfAutoFoodDataAtIndex:(NSInteger)index category:(NSInteger)category {
    NSDictionary* settings = [self settingsOfAutoFoodDataAtIndex:index];
    switch (category) {
        case 1:
            return [settings objectForKey:@"CategoryFirst"];
        case 2:
            return [settings objectForKey:@"CategorySecond"];
        case 3:
            return [settings objectForKey:@"CategoryThird"];
        default:
            return nil;
    }
    return nil;
}

- (NSString *)panOfAutoFoodDataAtIndex:(NSInteger)index {
    return [[self settingsOfAutoFoodDataAtIndex:index] objectForKey:@"Pan"];
}


- (NSArray *)arrayOfManualFoods {
    return [foodData objectForKey:@"ManualCook"];
}

@end
