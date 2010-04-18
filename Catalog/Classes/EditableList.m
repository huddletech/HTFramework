//
//  EditableList.m
//  Catalog
//
//  Created by Andy Waite on 18/04/2010.
//  Copyright 2010 HuddleTech. All rights reserved.
//

#import "EditableList.h"


@implementation EditableList

-(void)viewDidLoad{
	
	self.delegate = self;
	self.showEditButton = YES;
	
	TableSection *section = [self addSectionWithTitle:@"Numbers"];
	NSArray *itemsForSection = [NSMutableArray arrayWithObjects:@"1", @"2", @"3", nil];
	[section addItems:itemsForSection];
	
	[super viewDidLoad];
}




- (void)didDeleteRowAtIndexPath:indexPath{
	NSLog(@"You deleted item at %@", indexPath);
}

@end
