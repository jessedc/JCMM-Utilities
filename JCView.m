//
//  Copyright (c) 2014, Jesse Collis
//  All rights reserved.
//

#import "JCView.h"

@implementation JCView

- (void)calcualtePositions:(CGSize)size segment:(void (^)(UIView *, CGRect))segment
{
    //Suclasses to override
}

//NOTE: mainly for vertical layouts

- (CGSize)sizeThatFits:(CGSize)size
{
    __block CGRect subviewBounds = CGRectZero;
    [self calcualtePositions:size segment:^(UIView *view, CGRect frame) {
        subviewBounds = CGRectUnion(subviewBounds, frame);
    }];

    return CGSizeMake(size.width, CGRectGetHeight(subviewBounds));
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self calcualtePositions:self.bounds.size segment:^(UIView *view, CGRect frame) {
        view.frame = frame;
    }];
}

@end
