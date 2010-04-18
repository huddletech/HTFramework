#import "HTStyle.h"

#define vendColor(r, g, b) static UIColor *ret; if (ret == nil) ret = [[UIColor colorWithRed:(CGFloat)r/255.0 green:(CGFloat)g/255.0 blue:(CGFloat)b/255.0 alpha:1.0] retain]; return ret

@implementation HTStyle

+ (UIFont*) longTextFieldFont {
	return [UIFont systemFontOfSize:14.0];
}

+ (UIFont*) datePickerFont {
	return [UIFont systemFontOfSize:17.0];
}

+ (UIColor*) datePickerTextColor {
	return [UIColor colorWithRed:0.243 green:0.306 blue:0.435 alpha:1.0];
}

+(id)tableCellNonEditableTextColor {
	vendColor(81, 102, 145);
}

@end
@end
