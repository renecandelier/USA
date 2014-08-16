//
//  DataStore.m
//  ChalkboardStateCapitals
//
//  Created by Kurt Niemi on 8/7/13.
//  Copyright (c) 2013 22nd Century Software. All rights reserved.
//

#import "DataStore.h"
#import "StateClass.h"

static DataStore *_instance = nil;

@interface DataStore()
@property(nonatomic,strong) NSMutableArray *stateArray;
@property(nonatomic,strong) NSMutableDictionary *stateDictionary;
@end

@implementation DataStore

+(DataStore *)sharedInstance
{
    if (_instance == nil)
    {
        _instance = [[DataStore alloc] init];
    }
    
    return _instance;
}


-(id)init
{
    self = [super init];
    
    if (self)
    {
        [self loadStates];
    }
    
    return self;
}

-(NSMutableArray *)getStates
{
    return self.stateArray;
}

-(NSDictionary *)getStateDictionary
{
    if (self.stateDictionary == nil)
    {
        self.stateDictionary = [[NSMutableDictionary alloc] init];
        
        for (int i=0; i < [self.stateArray count]; i++)
        {
            StateClass *state = self.stateArray[i];
            [self.stateDictionary setObject:state forKey:state.StateAbbreviation];
        }
    }
    
    return self.stateDictionary;
}

-(void)loadStates
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"USA States" ofType:@"plist"];
    
//    NSDictionary *dictionary = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    self.stateArray = [[NSMutableArray alloc]init];
    
    NSArray *StateArrayDic = [[NSArray alloc] initWithContentsOfFile:path];
    for (NSDictionary *dict in StateArrayDic){
        StateClass *Statefill = [[StateClass alloc]init];
        Statefill.Statename = dict[@"State"];
        Statefill.StateCapitol = dict[@"Capital"];
        Statefill.StateTree = dict[@"Tree"];
        Statefill.StateFlower = dict[@"Flower"];
        Statefill.StateNickname = dict[@"Nickname"];
        Statefill.StateBird = dict[@"Bird"];
        Statefill.StateAbbreviation = dict[@"Abbreviation"];
        [self.stateArray addObject:Statefill];
    }
}


@end
