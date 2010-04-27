//
//  SelectionList.m
//  Catalog
//
//  Created by Andy Waite on 18/04/2010.
//  Copyright 2010 HuddleTech. All rights reserved.
//

#import "SelectionList.h"

@implementation SelectionList

- (void)viewDidLoad
{
	self.delegate = self;
	[self addItems:[NSMutableArray arrayWithObjects:@"A", @"B", @"C", nil]];
	self.initialSelection = 1;
	self.returnAfterSelection = YES;
	
	[super viewDidLoad];
}

- (void)rowChosen:(NSInteger)row fromArray:(NSArray *)theList;
{
    NSLog(@"You chose row %i from array %@", row, theList);
}

@end


