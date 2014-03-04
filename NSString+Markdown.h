//
//  Copyright 2011 REA Group. All rights reserved.
//

static NSString * const kNormalColor = @"kNormalColor";
static NSString * const kNormalFont = @"kNormalFont";
static NSString * const kHighlightColor = @"kHighlightColor";
static NSString * const kHighlightFont = @"kHighlightFont";
static NSString * const kHighlightDelimiter = @"*";

@interface NSString (MarkdownAttributedStringParser)

- (NSAttributedString *)asAttributedStringWithStyles:(NSDictionary *)styles;

@end
