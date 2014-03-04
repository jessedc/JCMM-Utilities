//
//  Copyright (c) 2014, Jesse Collis
//  All rights reserved.
//

#import "JCGeometry.h"

CGFloat JCVerticalCenter(CGSize a, CGSize b)
{
    return (a.height - b.height) / 2.0f;
}

CGFloat JCCenterHorizontal(CGSize a, CGSize b)
{
    return (a.width - b.width) / 2.0f;
}

