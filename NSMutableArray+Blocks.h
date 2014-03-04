//
//  Copyright (c) 2014, Jesse Collis
//  All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (Blocks)

- (id)first:(BOOL (^)(id item))block;
- (NSUInteger)indexOfFirst:(BOOL (^)(id item))block;

@end
