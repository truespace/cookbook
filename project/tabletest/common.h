//
//  common.h
//  tabletest
//
//  Created by Yun Juhyun on 2016. 1. 3..
//  Copyright © 2016년 whoride. All rights reserved.
//

#ifndef common_h
#define common_h

typedef enum {
    ePositionFirstFloor = 0,
    ePositionSecondFloor,
    ePositionThirdFloor,
    EPositionFourthFloor,
} COOK_POSITION;


NSInteger const kCellTagTitle = 0;
NSInteger const kCellTagPhoto = 10;
NSInteger const kCellTagSettingsPosition = 20;
NSInteger const kCellTagSettingsCategoryFirst = 30;
NSInteger const kCellTagSettingsCategorySecond = 40;
NSInteger const kCellTagSettingsCategoryThird = 50;
NSInteger const kCellTagSettingsPan = 60;



#endif /* common_h */
