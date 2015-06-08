//
//  Person.h
//  ObjectOrientedPeople
//
//  Created by Yoseob Lee on 6/8/15.
//  Copyright (c) 2015 al-tyus.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property (nonatomic, strong) NSNumber *height;
@property (nonatomic, strong) NSNumber *age;
@property (nonatomic, strong) NSString *name;
@property (nonatomic) BOOL isFemale;
@property (nonatomic, strong) NSMutableArray *friends;


-(NSNumber*)grow;
-(void)addFriends:(NSArray*)friends;
-(NSString*)generatePartyList;
-(BOOL)removeFriend:(Person*)friend;
-(NSArray *)removeFriends:(NSArray *)friendsToRemove;
- (CGFloat)randomFloatBetweenNumber:(CGFloat)minRange andNumber:(CGFloat)maxRange;


-(instancetype)init;
-(instancetype)initWithName:(NSString*)name;

@end
