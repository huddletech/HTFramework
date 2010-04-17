//
//  SliderCell.m
//  Catalog
//
//  Created by Andy Waite on 15/04/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SliderCell.h"

@implementation SliderCell
@synthesize delegate;

-(id) initWithTitle:(NSString*)theTitle{
	if (self = [super initWithTitle:theTitle])
	{
		self.control = [[UISlider alloc] init];
		[control addTarget:delegate action:@selector(sliderAction:) forControlEvents:UIControlEventValueChanged];
		// in case the parent view draws with a custom color or gradient, use a transparent color
		control.backgroundColor = [UIColor clearColor];
		
		((UISlider*)control).minimumValue = 0.0;
		((UISlider*)control).maximumValue = 100.0;
		((UISlider*)control).continuous = YES;
		((UISlider*)control).value = 50.0;
		
		// Add an accessibility label that describes the slider.
		[control setAccessibilityLabel:NSLocalizedString(@"StandardSlider", @"")];
		
		control.tag = kViewTag;	// tag this view for later so we can remove it from recycled table cells
		
	}
	return self;
}
@end
