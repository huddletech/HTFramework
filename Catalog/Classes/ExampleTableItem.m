//
//  ExampleTableItem.m
//  Catalog
//
//  Created by Andy Waite on 13/04/2010.
//  Copyright 2010 HuddleTech. All rights reserved.
//

#import "ExampleTableItem.h"


@implementation ExampleTableItem
@synthesize name;

+ (id) tableItemWithName:(NSString*)theName{
	ExampleTableItem *exampleTableItem = [[[ExampleTableItem alloc] init] autorelease];
	exampleTableItem.name = theName;
	return exampleTableItem;
}

- (NSString*) descriptionForTable:(AbstractGenericViewController *)table{
	return name;
}

@end
