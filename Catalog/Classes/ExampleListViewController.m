//
//  ExampleListViewController.m
//  Catalog
//
//  Created by Andy Waite on 13/04/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ExampleListViewController.h"


@implementation ExampleListViewController

- (void)viewWillAppear:(BOOL)animated 
{
	self.list = [NSArray arrayWithObjects:@"A", @"B", @"C", nil];
	self.hideSaveButton = YES;
	self.hideCancelButton = YES;
	[super viewWillAppear:animated];
}

@end
