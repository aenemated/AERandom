/*
 
USAGE: 
 
 NSArray* arr1 = @[@1.0,@1.0,@3.0];
 NSArray* arr2 = @[@2.0,@25.0,@1.0];
 
 float range = 10.0;
 float value = 7.0;
 
[[[ArrayReturn alloc] init] morph:arr1 to:arr2 withRange:range andIncrement:value];
 
RETURNED:
 
 Result (
 "0.7",
 "16.8",
 "1.4"
 )
 
*/

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
