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
	self.selections = [NSMutableArray arrayWithObject:@"B"];	
	[super viewDidLoad];
}


- (void)didChooseItems:(NSArray*)theSelections
{
    NSLog(@"You chose items %@", theSelections);
}

@end


