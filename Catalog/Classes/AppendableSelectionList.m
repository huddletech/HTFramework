//
//  EditableSelectionList.m
//  Catalog
//
//  Created by Andy Waite on 18/04/2010.
//  Copyright 2010 HuddleTech. All rights reserved.
//

#import "AppendableSelectionList.h"


@implementation AppendableSelectionList


- (void)viewDidLoad
{
	[super viewDidLoad];
	
	self.delegate = self;
	[self addItems:[NSMutableArray arrayWithObjects:@"A", @"B", @"C", nil]];
	self.selections = [NSMutableArray arrayWithObjects:@"B",
							 @"C",
							  nil];
}


- (void)didChooseItems:(NSArray*)theSelections
{
    NSLog(@"You chose items %@", theSelections);
}

@end
