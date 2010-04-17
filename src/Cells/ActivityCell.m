//
//  ActivityCell.m
//  Catalog
//
//  Created by Andy Waite on 15/04/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ActivityCell.h"


@implementation ActivityCell

-(id) initWithTitle:(NSString*)theTitle{
	if (self = [super initWithTitle:theTitle])
	{
		self.control = [[UIActivityIndicatorView alloc] init];
		[(UIActivityIndicatorView*)self.control startAnimating];
		((UIActivityIndicatorView*)control).activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
		[control sizeToFit]; // needed?
		control.autoresizingMask = (UIViewAutoresizingFlexibleLeftMargin |
												 UIViewAutoresizingFlexibleRightMargin |
												 UIViewAutoresizingFlexibleTopMargin |
												 UIViewAutoresizingFlexibleBottomMargin);
		
		control.tag = kViewTag;	// tag this view for later so we can remove it from recycled table cells
		
	}
	return self;
}

@end
