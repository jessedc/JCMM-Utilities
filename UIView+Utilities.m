//
//  Copyright (c) 2014, Jesse Collis
//  All rights reserved.
//

#import "UIView+Utilities.h"

@implementation UIView (Utilities)

- (void)removeAllSubviews
{
    [self.subviews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [obj removeFromSuperview];
    }];
}

@end

@implementation UIView (Positiioning)

- (void)centerInRect:(CGRect)rect
{
    self.center = CGPointMake(floorf(CGRectGetMidX(rect)) + ((int)floorf(CGRectGetWidth(self.frame))  % 2 ? .5f : 0.f),
                                floorf(CGRectGetMidY(rect)) + ((int)floorf(CGRectGetHeight(self.frame)) % 2 ? .5f : 0.f));
    [self makeFrameIntegral];
}

- (void)centerInSuperView
{
    [self centerInRect:self.superview.bounds];
}

- (void)makeFrameIntegral
{
    [self setFrame:CGRectIntegral(self.frame)];
}

@end
