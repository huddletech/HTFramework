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
@synthesize selections;
@synthesize delegate;
@synthesize multiple;
@synthesize canAddOther;

- (void)viewDidLoad
{
	[super viewDidLoad];
	self.topRightButton = [self doneButtonItem];
}

-(void)doneAction
{
    [self.delegate didChooseItems:selections];
	[self.navigationController popViewControllerAnimated:YES];
}
#pragma mark -
- (id)initWithStyle:(UITableViewStyle)style
{
	NSLog(@"initWithStyle");
	self.selections = [NSMutableArray array];
	selectedIndexPaths = [NSMutableArray array];
	[selectedIndexPaths retain];
	return self;
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
	int result = [super tableView:tableView numberOfRowsInSection:section];
	if (canAddOther){
		return result + 1;
	} else {
		return result;
	}
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
	//NSUInteger oldRow = [lastIndexPath row];
		
	if (row >= [self.items count])
	{
		cell.textLabel.text = NSLocalizedString(@"Other…", @"Other…");
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	}
	else
	{
		NSObject *itemForRow = [self.items objectAtIndex:row];
		if ([itemForRow isKindOfClass:[NSString class]]) {
			cell.textLabel.text = itemForRow;
		} else {
			cell.textLabel.text = (NSString*)[itemForRow tableItemDescription];
		}
		//cell.accessoryType = (row == oldRow && lastIndexPath != nil) ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
		
		if ([self.selections containsObject:[self.items objectAtIndex:row]]){
			cell.accessoryType = UITableViewCellAccessoryCheckmark;
		} else {
			cell.accessoryType = UITableViewCellAccessoryNone;
		}

		
	}
	
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
	int newRow = [indexPath row];
	//int oldRow = [lastIndexPath row];

	if (newRow < [self.items count])
	{
		//if (newRow != oldRow)
		//{
		
		if (!multiple){
			NSLog(@"removing all...");
			[self.selections removeAllObjects];
		}
		
		//UITableViewCell *newCell = [tableView cellForRowAtIndexPath:indexPath];
		
		NSString *chosenRow = [self.items objectAtIndex:indexPath.row];
		if ([self.selections containsObject:chosenRow]){
			[self.selections removeObject:chosenRow];
			//newCell.accessoryType = UITableViewCellAccessoryNone;
		} else {
			[self.selections addObject:chosenRow];
			//newCell.accessoryType = UITableViewCellAccessoryCheckmark;
		}
			//UITableViewCell *oldCell = [tableView cellForRowAtIndexPath: lastIndexPath]; 
			//oldCell.accessoryType = UITableViewCellAccessoryNone;
			
			//lastIndexPath = indexPath;	
		//
	//}
		//[tableView deselectRowAtIndexPath:indexPath animated:YES];
		NSLog(@"calling reload");
		[tableView reloadData];
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

