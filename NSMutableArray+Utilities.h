//
//  Copyright (c) 2014, Jesse Collis
//  All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (Utilities)

- (void)moveObjectFromIndex:(NSUInteger)from toIndex:(NSUInteger)to;

- (void)addObjectSafely:(id)object;

@end
