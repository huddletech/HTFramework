//
//  SelectionListViewController.m
//  iContractor
//
//  Created by Jeff LaMarche on 2/18/09.
//  Copyright 2009 Jeff LaMarche Consulting. All rights reserved.
//

#import "EditableSelectionListViewController.h"


@implementation EditableSelectionListViewController
@synthesize list;
@synthesize lastIndexPath;
@synthesize initialSelection;
@synthesize delegate;
-(IBAction)save
{
	NSLog(@"save1");
    [self.delegate rowChosen:[lastIndexPath row] fromArray:list];
	NSLog(@"save2");
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
	if (initialSelection > - 1 && initialSelection < [list count])
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
	[list release];
	[lastIndexPath release];
    [super dealloc];
}
#pragma mark -
#pragma mark Tableview methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
    return [list count] + 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    
    static NSString *SelectionListCellIdentifier = @"SelectionListCellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SelectionListCellIdentifier];
    if (cell == nil) 
	{
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:SelectionListCellIdentifier] autorelease];
    }
    
	NSUInteger row = [indexPath row];
	NSUInteger oldRow = [lastIndexPath row];
	if (row >= [list count])
	{
		cell.textLabel.font = [UIFont boldSystemFontOfSize:19.0];
		cell.textLabel.text = NSLocalizedString(@"Other…", @"Other…");
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	}
	else
	{
		cell.textLabel.font = [UIFont systemFontOfSize:19.0];
		cell.textLabel.text = [list objectAtIndex:row];
		cell.accessoryType = (row == oldRow && lastIndexPath != nil) ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
		
	}
	
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
	int newRow = [indexPath row];
	int oldRow = [lastIndexPath row];
	
	if (newRow < [list count])
	{
		if (newRow != oldRow)
		{
			UITableViewCell *newCell = [tableView cellForRowAtIndexPath:indexPath];
			newCell.accessoryType = UITableViewCellAccessoryCheckmark;
			
			UITableViewCell *oldCell = [tableView cellForRowAtIndexPath: lastIndexPath]; 
			oldCell.accessoryType = UITableViewCellAccessoryNone;
			
			lastIndexPath = indexPath;	
		}
	}
	else
	{
		TextFieldEditingViewController *controller = [[TextFieldEditingViewController alloc] initWithStyle:UITableViewStyleGrouped];
		controller.fieldKeys = [NSArray arrayWithObject:@"newValue"];
		controller.fieldNames = [NSArray arrayWithObject:NSLocalizedString(@"New Item", @"New Item")];
		controller.fieldValues = [NSArray arrayWithObject:@""];
		controller.delegate = self;
		[self.navigationController pushViewController:controller animated:YES];
		[controller release];
	}
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}
#pragma mark -
- (void)selectRow:(NSIndexPath *)theIndexPath
{
	//[self.tableView selectRowAtIndexPath:theIndexPath animated:YES scrollPosition:UITableViewScrollPositionBottom];
	[self tableView:self.tableView didSelectRowAtIndexPath:theIndexPath];
}
- (void)valuesDidChange:(NSDictionary *)newValues
{
	NSString *newVal = [newValues objectForKey:@"newValue"];
	[list addObject:newVal];
	//[self.tableView reloadData];
	
	[list sortUsingSelector:@selector(compare:)];
	NSUInteger theIndices[] = {0, [list indexOfObject:newVal]};
	NSIndexPath *theIndexPath = [[NSIndexPath alloc] initWithIndexes:theIndices length:2];
	[self performSelector:@selector(selectRow:) withObject:theIndexPath afterDelay:0.05];
	//	[self tableView:self.tableView didSelectRowAtIndexPath:theIndexPath];
	[self.tableView reloadData];
}

@end

