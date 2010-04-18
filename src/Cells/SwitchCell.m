//
//  SwitchCell.m
//  Catalog
//
//  Created by Andy Waite on 15/04/2010.
//  Copyright 2010 HuddleTech. All rights reserved.
//

#import "SwitchCell.h"


@implementation SwitchCell
@synthesize delegate;

-(id) initWithTitle:(NSString*)theTitle{
	if (self = [super initWithTitle:theTitle])
	{
		self.control = [[UISwitch alloc] init];
		[self.control addTarget:delegate action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
		// in case the parent view draws with a custom color or gradient, use a transparent color
		((UISwitch*)control).backgroundColor = [UIColor clearColor];
		[(UISwitch*)control setAccessibilityLabel:NSLocalizedString(@"StandardSwitch", @"")];
		((UISwitch*)control).tag = kViewTag;	// tag this view for later so we can remove it from recycled table cells
		
	}
	return self;
}

@end
