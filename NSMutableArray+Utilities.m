//
//  Copyright (c) 2014, Jesse Collis
//  All rights reserved.
//

#import "NSMutableArray+Utilities.h"

@implementation NSMutableArray (Utilities)

- (void)moveObjectFromIndex:(NSUInteger)from toIndex:(NSUInteger)to
{
  if (to != from)
  {
    __autoreleasing id obj = [self objectAtIndex:from];

    [self removeObjectAtIndex:from];
    if (to >= [self count])
    {
      [self addObject:obj];
    }
    else
    {
      [self insertObject:obj atIndex:to];
    }
  }
}

- (void)addObjectSafely:(id)object
{
  if (![self containsObject:object])
  {
    [self addObject:object];
  }
}

@end
