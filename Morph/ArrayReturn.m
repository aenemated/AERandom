//
//  ArrayReturn.m
//  test
//
//  Created by Trent Hamilton on 8/17/16.
//  Copyright © 2016 Trent Hamilton. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArrayReturn : NSObject
@end

@implementation ArrayReturn

-(NSArray*)morph:(NSArray*)arr1 to:(NSArray*)arr2 withRange:(float)range andIncrement:(float)increment {
    
    if ([arr1 count] != [arr2 count]) {
        return nil;
    }
    
    NSMutableArray* returnArray = [[NSMutableArray alloc] init];
    
    for (int i=0;i<[arr1 count];i++) {
        float v1 = [[arr1 objectAtIndex:i] floatValue];
        float v2 = [[arr2 objectAtIndex:i] floatValue];
        float result = [self calcValue:v1 withValue:v2 withRange:range atIncrement:increment];
        
        [returnArray addObject:[NSNumber numberWithFloat:result]];
    }
    
    return returnArray;
}

- (float)calcValue:(float)v1 withValue:(float)v2 withRange:(float)range atIncrement:(float)increment {
    return fabs((v2-v1)/range)*increment;
}


@end
