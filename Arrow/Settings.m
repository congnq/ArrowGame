//
//  Settings.m
//  Arrow
//
//  Created by 宋 奎熹 on 15/9/30.
//  Copyright © 2015年 宋 奎熹. All rights reserved.
//

//Set the difficulty and color(to be done)

#import "Settings.h"

@implementation Settings

+ (void)setDifficulty:(int)difficulty
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:difficulty
                      forKey:@"difficulty"];
    [userDefaults synchronize];
}

+ (int)readDifficulty
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSInteger difficulty = [userDefaults integerForKey:@"difficulty"];
    return (int)difficulty;
}

+ (void)setSoundEffect:(int)SoundEffect
{
    
}

+ (int)readSoundEffect
{
    return 0;
}

@end
