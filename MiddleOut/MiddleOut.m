#import <Foundation/Foundation.h>

@interface MiddleOut : NSObject
+ (NSMutableArray*)buildMiddleOutPriorityWithSource:(NSArray*)sourceArray andCurrentIndex:(NSInteger)idx;
@end

@implementation MiddleOut


+ (NSMutableArray*)buildMiddleOutPriorityWithSource:(NSArray*)sourceArray andCurrentIndex:(NSInteger)idx {
    
    NSInteger pivot = idx;
    NSMutableArray* ordered = [[NSMutableArray alloc] init];
    
    NSMutableArray* left = [[NSMutableArray alloc] init];
    NSMutableArray* right = [[NSMutableArray alloc] init];
    
    for (NSInteger i=0;i<[sourceArray count];i++) {
        if (i < pivot) {
            [left addObject:[NSString stringWithFormat:@"%i",i]];
        } else {
            [right addObject:[NSString stringWithFormat:@"%i",i]];
        }
    }
    
    left = [[[left reverseObjectEnumerator] allObjects] mutableCopy];
    
    NSInteger mo;
    if ([left count] > [right count]) {
        mo = [left count];
    } else {
        mo = [right count];
    }
    
    for (int ii=0;ii<mo;ii++) {
        if (ii < [left count]) {
            [ordered addObject:[left objectAtIndex:ii]];
        }
        
        if (ii < [right count]) {
            [ordered addObject:[right objectAtIndex:ii]];
        }
    }
    
    return ordered;
}

@end
