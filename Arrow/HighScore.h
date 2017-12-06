//
//  HighScore.h
//  Arrow
//
//  Created by 宋 奎熹 on 15/9/23.
//  Copyright © 2015年 宋 奎熹. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HighScore : NSObject

+ (void)setScore:(int)score;

+ (int)readHighScore;

+ (void)setDifficulty:(int)difficulty;

+ (int)readDifficulty;



+ (void)setNumberScore:(int)numberScore;

+ (int)readNumberHighScore;



+ (void)setHellScore:(int)hellScore;

+ (int)readHellHighScore;

@end
