//
//  Copyright (c) 2014, Jesse Collis
//  All rights reserved.
///

#import "NSDictionary+JCUtilities.h"

BOOL JCDictionaryIsEmpty(NSDictionary *dict)
{
    return dict == nil || [dict count] < 1;
}

@implementation NSDictionary (JCUtilities)
@end
