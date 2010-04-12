//
//  ListSection.m
//  Catalog
//
//  Created by Andy Waite on 13/04/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ListSection.h"


@implementation ListSection
@synthesize title;

- (void)dealloc 
{
	[items release];
    [super dealloc];
}

- (id)init{
	if (self = [super init])
	{
		items = [NSMutableArray array];
		[items retain];
	}
	return self;
}

-(void)addItem:(id)item{
	[items addObject:item];
}

@end
