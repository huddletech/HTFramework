//
//  UIColor-Table.m
//  iContractor
//
//  Created by Jeff LaMarche on 1/20/09.
//  Copyright 2009 Jeff LaMarche Consulting. All rights reserved.
//

#import "UIColor-Table.h"

#define vendColor(r, g, b) static UIColor *ret; if (ret == nil) ret = [[UIColor colorWithRed:(CGFloat)r/255.0 green:(CGFloat)g/255.0 blue:(CGFloat)b/255.0 alpha:1.0] retain]; return ret

@implementation UIColor(Table)
+(id)tableCellNonEditableTextColor {vendColor(81, 102, 145);}
@end
