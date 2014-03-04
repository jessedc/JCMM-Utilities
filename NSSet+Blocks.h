//
//  Copyright (c) 2014, Jesse Collis
//  All rights reserved.
//

@interface NSSet (Blocks)

- (id)first:(BOOL (^)(id))block;
- (id)firstEqualing:(id)obj;

- (void)each:(void (^)(id item))block;

- (NSSet *)filter:(BOOL (^)(id item))block;
- (NSSet *)pick:(BOOL (^)(id item))block;

- (NSSet *)map:(id (^)(id item))block;
- (id)reduce:(id (^)(id current, id item))block initial:(id)initial;

- (BOOL)any:(BOOL (^)(id))block;
- (BOOL)all:(BOOL (^)(id))block;

@end
