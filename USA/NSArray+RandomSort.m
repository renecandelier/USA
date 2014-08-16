//
//  NSArray+RandomSort.m
//  ChalkboardStateCapitals
//
//  Created by Kurt Niemi on 8/15/13.
//  Copyright (c) 2013 22nd Century Software. All rights reserved.
//

#import "NSArray+RandomSort.h"

@implementation NSArray (RandomSort)

-(NSArray *)shuffle
{
    NSMutableArray *resultArray = [[NSMutableArray alloc] init];

    // Build temporary array - we will randomly remove one element from here
    // and add it to our resultArray
    NSMutableArray *tempArray = [[NSMutableArray alloc] init];
    for(int x = 0; x < [self count]; x++)
    {
        [tempArray addObject:self[x]];
    }
    
//    for(int x = 0; x < [self count]; x++)
//    {
//        // Get Random element from tempArray
//        NSInteger n = (arc4random() % [tempArray count]);
//        id arrayElement = tempArray[n];
//
//        // Add Random element to Result
//        [resultArray addObject:arrayElement];
//        
//        // Remove from tempArray (as we added the object to the result array)
//        [tempArray removeObjectAtIndex:n];
//    }

    return tempArray;
}


@end
