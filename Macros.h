//
//  Copyright (c) 2014, Jesse Collis
//  All rights reserved.
//

// Assertions

#define AssertNotNil(x) NSAssert1((x) != nil, @"%@ can not be nil", @#x)

// http://www.cimgf.com/2010/05/02/my-current-prefix-pch-file/
#ifdef DEBUG
#define DLog(...) NSLog(@"%s %@", __PRETTY_FUNCTION__, [NSString stringWithFormat:__VA_ARGS__])
#define ALog(...) [[NSAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithCString:__PRETTY_FUNCTION__ encoding:NSUTF8StringEncoding] file:[NSString stringWithCString:__FILE__ encoding:NSUTF8StringEncoding] lineNumber:__LINE__ description:__VA_ARGS__]
#else
#define DLog(...) do { } while (0)
#ifndef NS_BLOCK_ASSERTIONS
#define NS_BLOCK_ASSERTIONS
#endif
#define ALog(...) NSLog(@"%s %@", __PRETTY_FUNCTION__, [NSString stringWithFormat:__VA_ARGS__])
#endif

#define ZAssert(condition, ...) do { if (!(condition)) { ALog(__VA_ARGS__); }} while(0)

//Hashing - borrwed from Mike Ash
//http://www.mikeash.com/pyblog/friday-qa-2010-06-18-implementing-equality-and-hashing.html

#define NSUINT_BIT (CHAR_BIT * sizeof(NSUInteger))
#define NSUINTROTATE(val, howmuch) ((((NSUInteger)val) << howmuch) | (((NSUInteger)val) >> (NSUINT_BIT - howmuch)))

#define IOS_7_AVAILABLE (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_6_1)

#define standardViewControllerPortraitFrame CGRectMake(0.f, 0.f, 320.f, 460.f)

#define kUTFNewLineChar @"\u2028"
#define kNewParagraphChar @"\n"
