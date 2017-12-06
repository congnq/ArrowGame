//
//  Settings.h
//  Arrow
//
//  Created by 宋 奎熹 on 15/9/30.
//  Copyright © 2015年 宋 奎熹. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Settings : NSObject

@property (nonatomic) int difficulty;

+ (void)setDifficulty:(int)difficulty;

+ (int)readDifficulty;

+ (void)setSoundEffect:(int)SoundEffect;

+ (int)readSoundEffect;

@end
