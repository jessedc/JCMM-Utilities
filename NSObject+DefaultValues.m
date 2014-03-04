//
//  Copyright (c) 2014, Jesse Collis
//  All rights reserved.
//

#import "NSObject+DefaultValues.h"

@implementation NSObject (ContainsValues)

- (BOOL)containsValueForKey:(NSString *)key
{
    id value = [self valueForKey:key];
    if (value == [NSNull null])
    {
        DLog(@"Careful, NSNUll returned inside %@.%@", self, key);
    }
    return (value != nil) && (value != [NSNull null]);
}

- (BOOL)containsValueForKeyPath:(NSString *)keyPath
{
    id value = [self valueForKeyPath:keyPath];
    if (value == [NSNull null])
    {
        DLog(@"Careful, NSNUll exists inside %@.%@", self, keyPath);
    }
    return (value != nil) && (value != [NSNull null]);
}

@end


@implementation NSObject (DefaultValues)

- (id)valueForKey:(NSString *)key defaultValue:(id)defaultValue
{
    id value = [self valueForKey:key];

    if (value == [NSNull null])
    {
        DLog(@"Careful, NSNUll returned inside %@.%@", self, key);
    }

    return (value == nil || value == [NSNull null]) ? defaultValue : value;
}

- (id)valueForKeyPath:(NSString *)keyPath defaultValue:(id)defaultValue
{
    id value = [self valueForKeyPath:keyPath];

    if (value == [NSNull null])
    {
        DLog(@"Careful, NSNUll returned inside %@.%@", self, keyPath);
    }

    return (value == nil || value == [NSNull null]) ? defaultValue : value;
}

@end

@implementation NSObject (IfKindOf)

- (id)valueForKey:(NSString *)key ifKindOf:(Class)aClass
{
    return [self valueForKey:key ifKindOf:aClass defaultValue:nil];
}

- (id)valueForKeyPath:(NSString *)key ifKindOf:(Class)aClass
{
    return [self valueForKeyPath:key ifKindOf:aClass defaultValue:nil];
}

- (id)valueForKey:(NSString *)key ifKindOf:(Class)aClass defaultValue:(id)defaultValue
{
    id value = [self valueForKey:key];
    return [value isKindOfClass:aClass] ? value : defaultValue;
}

- (id)valueForKeyPath:(NSString *)key ifKindOf:(Class)aClass defaultValue:(id)defaultValue
{
    id value = [self valueForKeyPath:key];
    return [value isKindOfClass:aClass] ? value : defaultValue;
}

@end
