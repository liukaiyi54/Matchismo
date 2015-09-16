//
//  PlayingCard.h
//  Matchismo
//
//  Created by Michael on 9/16/15.
//  Copyright (c) 2015 Michael. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (nonatomic, strong) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end
