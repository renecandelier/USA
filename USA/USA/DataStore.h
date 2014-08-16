//
//  DataStore.h
//  ChalkboardStateCapitals
//
//  Created by Kurt Niemi on 8/7/13.
//  Copyright (c) 2013 22nd Century Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataStore : NSObject

+(DataStore *)sharedInstance;

-(NSMutableArray *)getStates;
-(NSDictionary *)getStateDictionary;



@end
