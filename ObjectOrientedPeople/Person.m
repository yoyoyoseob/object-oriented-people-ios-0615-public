//
//  Person.m
//  ObjectOrientedPeople
//
//  Created by Yoseob Lee on 6/8/15.
//  Copyright (c) 2015 al-tyus.com. All rights reserved.
//

#import "Person.h"
#define ARC4RANDOM_MAX 0x100000000

@implementation Person

- (CGFloat)randomFloatBetweenNumber:(CGFloat)minRange andNumber:(CGFloat)maxRange
{
    return ((float)arc4random() / ARC4RANDOM_MAX) * (maxRange - minRange) + minRange;
}

-(NSNumber *)grow
{
    
    srand48(arc4random());
    double x = drand48();
    
    if (self.isFemale){
        if ([self.age integerValue] < 11){
            self.height =  @([self.height floatValue] + x);
        }
        if ([self.age integerValue] >= 11 && [self.age integerValue] <= 15){
            self.height = @([self randomFloatBetweenNumber:.5 andNumber:2] + [self.height floatValue]);
        }
        if ([self.age integerValue] > 15){
            return self.height;
        }
    }
    
    else if (!(self.isFemale)){
        if ([self.age integerValue] < 12){
            self.height = @([self.height floatValue] + x);
        }
        if ([self.age integerValue] >= 12 && [self.age integerValue] <= 15){
            self.height = @([self randomFloatBetweenNumber:.5 andNumber:3.5] + [self.height floatValue]);
        }
        if ([self.age integerValue] > 16){
            return self.height;
        }
    }

    return self.height;
}


-(void)addFriends:(NSArray *)friendsArray
{
    for (NSString *friends in friendsArray){
        [self.friends addObject:friends];
    }
}


-(NSString *)generatePartyList
{
    NSMutableArray *listOfNames = [[NSMutableArray alloc] init];
    
    for (Person *friend in self.friends){
        [listOfNames addObject:friend.name];
    }
    
    NSString *partyList = [listOfNames componentsJoinedByString:@", "];
    return partyList;
}


-(BOOL)removeFriend:(Person *)friend
{
    
    if ([self.friends containsObject:friend]){
        [self.friends removeObject:friend];
        return YES;
    }
    
    return NO;
}

-(NSArray *)removeFriends:(NSArray *)friendsToRemove
{
    NSMutableArray *removedFriends = [[NSMutableArray alloc] init];
    
    for (NSString *friend in self.friends){
        for (NSUInteger i=0; i<friendsToRemove.count; i++){
            if ([friend isEqual:friendsToRemove[i]]){
                [removedFriends addObject:friend];
            }
        }
    }
    
    [self.friends removeObjectsInArray:removedFriends];
    
    return removedFriends;
}



-(instancetype)init
{
    self = [super init];
    
    if (self) {
        _height = @9;
        _name = @"";
    }
    
    return self;
}


-(instancetype)initWithName:(NSString *)name
{
    self = [super init];
    
    if (self){
        _name = name;
        _height = @9;
    }
    return self;
}

@end
