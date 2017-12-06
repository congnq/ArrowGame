//
//  HighScore.m
//  Arrow
//
//  Created by 宋 奎熹 on 15/9/23.
//  Copyright © 2015年 宋 奎熹. All rights reserved.
//

#import "HighScore.h"
#import "Settings.h"

@implementation HighScore

//Classic
+ (void)setScore:(int)score
{
    if(score == -1){
        [self setDifficulty:0];
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults setInteger:0
                          forKey:@"score"];
        [userDefaults synchronize];
    }else if(score > [HighScore readHighScore]){
        [self setDifficulty:[Settings readDifficulty]];
        
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults setInteger:score
                          forKey:@"score"];
        [userDefaults synchronize];
    }
}

+ (int)readHighScore
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSInteger score = [userDefaults integerForKey:@"score"];
    return (int)score;
}

+ (void)setDifficulty:(int)difficulty
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:difficulty
                      forKey:@"highDifficulty"];
    [userDefaults synchronize];
}

+ (int)readDifficulty
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSInteger difficulty = [userDefaults integerForKey:@"highDifficulty"];
    return (int)difficulty;
}

//Arcade
+ (void)setNumberScore:(int)numberScore
{
    if(numberScore == -1){
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults setInteger:0
                          forKey:@"numberScore"];
        [userDefaults synchronize];
    }else if(numberScore > [HighScore readNumberHighScore]){
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults setInteger:numberScore
                          forKey:@"numberScore"];
        [userDefaults synchronize];
    }
}

+ (int)readNumberHighScore
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSInteger numberScore = [userDefaults integerForKey:@"numberScore"];
    return (int)numberScore;
}

//Hell
+ (void)setHellScore:(int)hellScore
{
    if(hellScore == -1){
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults setInteger:0
                          forKey:@"hellScore"];
        [userDefaults synchronize];
    }else if(hellScore > [HighScore readHellHighScore]){
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults setInteger:hellScore
                          forKey:@"hellScore"];
        [userDefaults synchronize];
    }
}

+ (int)readHellHighScore
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSInteger hellScore = [userDefaults integerForKey:@"hellScore"];
    return (int)hellScore;
}

@end


