//
//  TextFieldEditing.m
//  Catalog
//
//  Created by Andy Waite on 18/04/2010.
//  Copyright 2010 HuddleTech. All rights reserved.
//

#import "TextFieldEditing.h"


@implementation TextFieldEditing

- (void)viewDidLoad {
	self.delegate = self;
	self.fieldNames = [NSArray arrayWithObjects:@"A", @"B", @"C", nil];
	self.fieldKeys = [NSArray arrayWithObjects:@"a", @"b", @"c", nil];
	self.fieldValues = [NSArray arrayWithObjects:@"1", @"2", @"3", nil];
	self.hideLabels = YES;
	[super viewDidLoad];
}

#pragma mark TextFieldEditingViewControllerDelegate methods

- (void)valuesDidChange:(NSDictionary *)newValues{
	NSLog(@"You changed values: %@", newValues);
}

@end
