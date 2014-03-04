//
//  Copyright (c) 2014, Jesse Collis
//  All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JCView : UIView

- (void)calcualtePositions:(CGSize)size segment:(void (^)(UIView *, CGRect))segment;

@end
