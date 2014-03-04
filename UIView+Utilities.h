//
//  Copyright (c) 2014, Jesse Collis
//  All rights reserved.
//


@interface UIView (Utilities)

- (void)removeAllSubviews;

@end

@interface UIView (Positiioning)

- (void)centerInRect:(CGRect)rect;
- (void)centerInSuperView;
- (void)makeFrameIntegral;

@end
