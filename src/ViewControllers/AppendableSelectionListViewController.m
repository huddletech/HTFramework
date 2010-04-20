//
//  SelectionListViewController.m
//  iContractor
//
//  Created by Jeff LaMarche on 2/18/09.
//  Copyright 2009 Jeff LaMarche Consulting. All rights reserved.
//
//  Modifications by Andy Waite

#import "AppendableSelectionListViewController.h"


@implementation AppendableSelectionListViewController
@synthesize lastIndexPath;
@synthesize initialSelection;
@synthesize delegate;

- (void)viewDidLoad
{
	[super viewDidLoad];
	self.topRightButton = [self doneButtonItem];
}

-(void)doneAction
{
    [self.delegate rowChosen:[lastIndexPath row] fromArray:self.items];
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
	
	if (initialSelection > - 1 && initialSelection < [self.items count])
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
    return [super tableView:tableView numberOfRowsInSection:section] + 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    
    static NSString *SelectionListCellIdentifier = @"SelectionListCellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SelectionListCellIdentifier];
    if (cell == nil) 
	{
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
									   reuseIdentifier:SelectionListCellIdentifier] autorelease];
	}
    
	NSUInteger row = [indexPath row];
	NSUInteger oldRow = [lastIndexPath row];
		
	if (row >= [self.items count])
	{
		cell.textLabel.text = NSLocalizedString(@"Other…", @"Other…");
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	}
	else
	{
		
		cell.textLabel.text = [self.items objectAtIndex:row];
		cell.accessoryType = (row == oldRow && lastIndexPath != nil) ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
		
	}
	
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
	int newRow = [indexPath row];
	int oldRow = [lastIndexPath row];

	if (newRow < [self.items count])
	{
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
	else
	{
		TextFieldEditingViewController *controller = [[TextFieldEditingViewController alloc] initWithStyle:UITableViewStyleGrouped];
		controller.fieldKeys = [NSArray arrayWithObject:@"newValue"];
		controller.fieldNames = [NSArray arrayWithObject:NSLocalizedString(@"New Item", @"New Item")];
		controller.fieldValues = [NSArray arrayWithObject:@""];
		controller.delegate = self;
		controller.topRightButton = [self saveButtonItem];
		[self.navigationController pushViewController:controller animated:YES];
		[controller release];
	}
}
#pragma mark -
- (void)selectRow:(NSIndexPath *)theIndexPath
{
	//[self.tableView selectRowAtIndexPath:theIndexPath animated:YES scrollPosition:UITableViewScrollPositionBottom];
	[self tableView:self.tableView didSelectRowAtIndexPath:theIndexPath];
}
- (void)valuesDidChange:(NSDictionary *)newValues
{
	NSLog(@"valuesDidChange");
	NSString *newVal = [newValues objectForKey:@"newValue"];
		
	[self.items addObject:newVal];
	//[self.tableView reloadData];
	
	[self.items sortUsingSelector:@selector(compare:)];
	NSUInteger theIndices[] = {0, [self.items indexOfObject:newVal]};
	NSIndexPath *theIndexPath = [[NSIndexPath alloc] initWithIndexes:theIndices length:2];
	[self performSelector:@selector(selectRow:) withObject:theIndexPath];
	//	[self tableView:self.tableView didSelectRowAtIndexPath:theIndexPath];
	[self.tableView reloadData];	
}

@end

