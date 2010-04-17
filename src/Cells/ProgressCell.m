//
//  ProgressCell.m
//  Catalog
//
//  Created by Andy Waite on 15/04/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ProgressCell.h"


@implementation ProgressCell

-(id) initWithTitle:(NSString*)theTitle{
	if (self = [super initWithTitle:theTitle])
	{
		self.control = [[UIProgressView alloc] init];
		control = [[UIProgressView alloc] init];	
		CGRect frame = control.frame;
		// need to set these or it doesn't appear for some reason
		frame.size.width = kUIProgressBarWidth;
		frame.size.height = kUIProgressBarHeight;
		((UIProgressView*)control).frame = frame;
		((UIProgressView*)control).progressViewStyle = UIProgressViewStyleDefault;
		((UIProgressView*)control).progress = 0.5;
		
		control.tag = kViewTag;	// tag this view for later so we can remove it from recycled table cells
		
	}
	return self;
}

@end
