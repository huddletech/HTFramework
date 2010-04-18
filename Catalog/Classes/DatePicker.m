//
//  DatePicker.m
//  Catalog
//
//  Created by Andy Waite on 18/04/2010.
//  Copyright 2010 HuddleTech. All rights reserved.
//

#import "DatePicker.h"


@implementation DatePicker

- (void)viewDidLoad {
	self.delegate = self;
	[super viewDidLoad];
}

#pragma mark DateViewDelegate methods

- (void)takeNewDate:(NSDate *)newDate{
	NSLog(@"You took new date: %@", newDate);
}

@end
