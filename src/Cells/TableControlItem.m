//
//  TableControlItem.m
//  Catalog
//
//  Created by Andy Waite on 15/04/2010.
//  Copyright 2010 HuddleTech. All rights reserved.
//

#import "TableControlItem.h"


@implementation TableControlItem
@synthesize title, detail;
@synthesize control;
@synthesize accessoryType;

- (id) initWithTitle:(NSString*)theTitle{
	if (self = [super init])
	{
		self.title = theTitle;
	}
	return self;	
}

@end
