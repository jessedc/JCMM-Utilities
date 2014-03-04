//
//  Copyright (c) 2014, Jesse Collis
//  All rights reserved.
//

#import "NSMutableArray+Blocks.h"

@implementation NSMutableArray (Blocks)

- (id)first:(BOOL (^)(id item))block
{
	id result = nil;
  
  for (id obj in self)
  {
    if (block(obj))
    {
      result = obj;
      break;
    }
  }
  
  return result;
}

- (NSUInteger)indexOfFirst:(BOOL (^)(id item))block
{
  return [self indexOfObjectPassingTest:^ BOOL (id item, NSUInteger __unused idx, BOOL *stop) {
		if (block(item))
    {
      *stop = YES;
      return YES;
    }
    return NO;
  }];
}

@end
