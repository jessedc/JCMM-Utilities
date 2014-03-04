//  Copyright (c) 2011, Kevin O'Neill
//  All rights reserved.
//
//  Redistribution and use in source and binary forms, with or without
//  modification, are permitted provided that the following conditions are met:
//
//  * Redistributions of source code must retain the above copyright
//   notice, this list of conditions and the following disclaimer.
//
//  * Redistributions in binary form must reproduce the above copyright
//   notice, this list of conditions and the following disclaimer in the
//   documentation and/or other materials provided with the distribution.
//
//  * Neither the name UsefulBits nor the names of its contributors may be used
//   to endorse or promote products derived from this software without specific
//   prior written permission.
//
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
//  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
//  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
//  DISCLAIMED. IN NO EVENT SHALL <COPYRIGHT HOLDER> BE LIABLE FOR ANY
//  DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
//  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
//  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
//  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
//  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
//  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

#import "NSArray+Blocks.h"

@implementation NSArray (Blocks)

- (void)each:(void (^)(id item))block
{
  [self enumerateObjectsUsingBlock: ^(id item, NSUInteger __unused i, BOOL __unused *stop) { block(item); }];
}

- (void)eachWithIndex:(void (^)(id item, NSUInteger i))block
{
  [self enumerateObjectsUsingBlock: ^(id item, NSUInteger i, BOOL __unused *stop) { block(item, i); }];
}


- (NSArray *)filter:(BOOL (^)(id item))block
{
  NSMutableArray *result = [NSMutableArray arrayWithCapacity:[self count]];
  
  for (id obj in self)
  {
    if (!block(obj))
    {
      [result addObject:obj];
    }
  }
  
  return [NSArray arrayWithArray:result];
}

- (NSArray *)pick:(BOOL (^)(id item))block
{
  NSMutableArray *result = [NSMutableArray arrayWithCapacity:[self count]];
  
  for (id obj in self)
  {
    if (block(obj))
    {
      [result addObject:obj];
    }
  }
  
  return [NSArray arrayWithArray:result];
}

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

- (id)last:(BOOL (^)(id item))block
{
	id result = nil;
  
  for (id obj in [self reverseObjectEnumerator])
  {
    if (block(obj))
    {
      result = obj;
      break;
    }
  }
  
  return result;
}

- (NSUInteger)indexOfLast:(BOOL (^)(id item))block
{
  return [self indexOfObjectWithOptions:NSEnumerationReverse passingTest:^ BOOL (id item, NSUInteger __unused idx, BOOL *stop) {
		if (block(item))
    {
      *stop = YES;
      return YES;
    }
    
    return NO;
  }];
}

- (NSArray *)map:(id (^)(id item))block
{
  NSMutableArray *result = [NSMutableArray arrayWithCapacity:[self count]];
  
  for (id obj in self)
  {
    [result addObject:block(obj)];
  }
  
  return [NSArray arrayWithArray:result];
}

- (id)reduce:(id (^)(id current, id item))block initial:(id)initial
{
  id result = initial;
  
  for (id obj in self)
  {
    result = block(result, obj);
  }
  
  return result;
}

- (BOOL)any:(BOOL (^)(id item))block
{
  return NSNotFound != [self indexOfFirst:block];
}

- (BOOL)all:(BOOL (^)(id item))block
{
  return NSNotFound == [self indexOfFirst:^ BOOL (id item) { return !block(item); }];
}

- (NSArray *)reverse
{
  return [[self reverseObjectEnumerator] allObjects];
}

@end
