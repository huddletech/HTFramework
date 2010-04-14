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
@synthesize lastIndexPath;
@synthesize initialSelection;
@synthesize delegate;


-(IBAction)save
{
    [self.delegate rowChosen:[lastIndexPath row] fromArray:rowItems];
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark -
- (id)initWithStyle:(UITableViewStyle)style
{
	initialSelection = -1;
	return self;
}


- (void)viewWillAppear:(BOOL)animated 
{
	// Check to see if user has indicated a row to be selected, and set it
	if (initialSelection > - 1 && initialSelection < [rowItems count])
	{
		NSUInteger newIndex[] = {0, initialSelection};
		NSIndexPath *newPath = [[NSIndexPath alloc] initWithIndexes:newIndex length:2];
		self.lastIndexPath = newPath;
		[newPath release];
	}
	
    [super viewWillAppear:animated];
}


- (void)dealloc 
{
	[lastIndexPath release];
    [super dealloc];
}


#pragma mark -
#pragma mark Tableview methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    
    static NSString *SelectionListCellIdentifier = @"SelectionListCellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SelectionListCellIdentifier];
    if (cell == nil) 
	{
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
									   reuseIdentifier:SelectionListCellIdentifier] autorelease];}
    
	TableSection *firstSection = [sections objectAtIndex:0];
	
	NSUInteger row = [indexPath row];
	NSUInteger oldRow = [lastIndexPath row];
	cell.textLabel.text = [firstSection.items objectAtIndex:row];
	cell.accessoryType = (row == oldRow && lastIndexPath != nil) ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;

    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
	
	int newRow = [indexPath row];
	int oldRow = [lastIndexPath row];
	
	if (newRow != oldRow)
	{
		UITableViewCell *newCell = [tableView cellForRowAtIndexPath:indexPath];
		newCell.accessoryType = UITableViewCellAccessoryCheckmark;
		
		UITableViewCell *oldCell = [tableView cellForRowAtIndexPath: lastIndexPath]; 
		oldCell.accessoryType = UITableViewCellAccessoryNone;
		
		lastIndexPath = indexPath;	
	}
	
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end

