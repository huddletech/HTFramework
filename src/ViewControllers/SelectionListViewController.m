//
//  SelectionListViewController.m
//  iContractor
//
//  Created by Jeff LaMarche on 2/18/09.
//  Copyright 2009 Jeff LaMarche Consulting. All rights reserved.
//
//  Modifications by Andy Waite

#import "SelectionListViewController.h"


@implementation SelectionListViewController 
@synthesize returnAfterSelection;

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
    return [super tableView:tableView numberOfRowsInSection:section] - 1;
}

@end

