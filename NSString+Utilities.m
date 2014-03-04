//
//  Copyright (c) 2014, Jesse Collis
//  All rights reserved.
//

#import "NSString+Utilities.h"

BOOL JCStringIsEmpty(NSString *string)
{
    return string == nil || [string length] < 1 || [string isEqualToString:@""];
}

@implementation NSString (JCUtilities)
@end
