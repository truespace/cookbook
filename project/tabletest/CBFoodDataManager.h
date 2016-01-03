//
//  CBFoodDataManager.h
//  tabletest
//
//  Created by Yun Juhyun on 2016. 1. 3..
//  Copyright © 2016년 whoride. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    eFoodAutoCook = 0,
    eFoodManualCook,
} SECTION_FOOD;

@interface CBFoodDataManager : NSObject

@property (retain, nonatomic) NSDictionary* foodData;
@property (retain, nonatomic) NSArray*      namesOfSectionHeader;

- (void)load;
- (void)setSections:(NSArray *)sections;
- (NSInteger)sectionsCount;

- (NSArray *)arrayOfAutoFoods;
- (NSArray *)arrayOfManualFoods;

@end
