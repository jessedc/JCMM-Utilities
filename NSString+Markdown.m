//
//  Copyright 2011 REA Group. All rights reserved.
//

#import "NSString+Markdown.h"
#import <CoreText/CTFont.h>

@implementation NSString (MarkdownAttributedStringParser)

- (NSAttributedString *)asAttributedStringWithStyles:(NSDictionary *)styles
{
    NSMutableAttributedString *buf = [[NSMutableAttributedString alloc] initWithString:[self stringByReplacingOccurrencesOfString:kHighlightDelimiter withString:@""]];

    NSParameterAssert([styles objectForKey:kNormalColor]);
    NSParameterAssert([styles objectForKey:kNormalFont]);

    UIColor *normalColor = [styles objectForKey:kNormalColor];
    UIColor *highlightColor = [styles objectForKey:kHighlightColor] ?: normalColor;
    UIFont *normalFont = [styles objectForKey:kNormalFont];
    UIFont *highlightFont = [styles objectForKey:kHighlightFont] ?: normalFont;

    NSRange wholeString = NSMakeRange(0, [buf length]);

    [buf addAttribute:NSForegroundColorAttributeName value:normalColor range:wholeString];
    [buf addAttribute:NSFontAttributeName value:normalFont range:wholeString];

    NSArray *components = [self componentsSeparatedByString:kHighlightDelimiter];
    for (NSUInteger pos = 0, i = 0; i < [components count]; pos += [(NSString *)[components objectAtIndex:i] length], ++i)
    {
        if (i % 2)
        {
            id item = [components objectAtIndex:i];
            NSRange range = NSMakeRange(pos, [(NSString *)item length]);
            [buf addAttribute:NSForegroundColorAttributeName value:highlightColor range:range];
            [buf addAttribute:NSFontAttributeName value:highlightFont range:range];
        }
    }
    
    return buf;
}

@end
