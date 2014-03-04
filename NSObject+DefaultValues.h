//
//  Copyright (c) 2014, Jesse Collis
//  All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (ContainsValues)

- (BOOL)containsValueForKey:(NSString *)key;
- (BOOL)containsValueForKeyPath:(NSString *)keyPath;

@end

@interface NSObject (DefaultValues)

- (id)valueForKey:(NSString *)key defaultValue:(id)defaultValue;
- (id)valueForKeyPath:(NSString *)keyPath defaultValue:(id)defaultValue;

@end

@interface NSObject (IfKindOf)

- (id)valueForKey:(NSString *)key ifKindOf:(Class)aClass;
- (id)valueForKeyPath:(NSString *)key ifKindOf:(Class)aClass;

- (id)valueForKey:(NSString *)key ifKindOf:(Class)aClass defaultValue:(id)defaultValue;
- (id)valueForKeyPath:(NSString *)key ifKindOf:(Class)aClass defaultValue:(id)defaultValue;

@end
