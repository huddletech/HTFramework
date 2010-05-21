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
@synthesize multiple;
@synthesize canAddOther;

- (void)viewDidLoad
{
	[super viewDidLoad];
}

- (void)saveAction{
	[self save];
}

- (void)save{
	[self.delegate didChooseItems:selections];
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
    
	
	//NSUInteger oldRow = [lastIndexPath row];
		
	[self configureCell:cell atIndexPath:indexPath];
	
    return cell;
}

- (void)configureCell:(UITableViewCell*)cell atIndexPath:indexPath{
	NSUInteger row = [indexPath row];
	if (row >= [self.items count])
	{
		cell.textLabel.text = NSLocalizedString(@"Other…", @"Other…");
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	}
	else
	{
		NSObject *itemForRow = [self.items objectAtIndex:row];
		if ([itemForRow isKindOfClass:[NSString class]]) {
			cell.textLabel.text = (NSString*)itemForRow;
		} else {
			cell.textLabel.text = (NSString*)[(id<HTTableItemDescription>)itemForRow tableItemDescription];
		}
		
		if ([self.selections containsObject:[self.items objectAtIndex:row]]){
			cell.accessoryType = UITableViewCellAccessoryCheckmark;
		} else {
			cell.accessoryType = UITableViewCellAccessoryNone;
		}		
	}

}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
	int newRow = [indexPath row];

	if (newRow < [self.items count])
	{
		if (!multiple){
			[self.selections removeAllObjects];
		}
				
		NSString *chosenRow = [self.items objectAtIndex:indexPath.row];
		if ([self.selections containsObject:chosenRow]){
			[self.selections removeObject:chosenRow];
		} else {
			[self.selections addObject:chosenRow];
		}
				
		NSArray *indexPaths = [NSArray arrayWithObject:indexPath];
		
		// causes crash after returning from AddOther
		//[tableView reloadRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
		
		[tableView reloadData];
	}
	else
	{
		AddOther *controller = [[AddOther alloc] initWithStyle:UITableViewStyleGrouped];
		controller.delegate = self;
		
		UIViewController *rootViewController = [[UINavigationController alloc] initWithRootViewController:controller];
		[self.navigationController presentModalViewController:rootViewController animated:YES];
		[rootViewController release];
		
		[controller release];
	}
}
#pragma mark -
- (void)selectRow:(NSIndexPath *)theIndexPath
{
	[self tableView:self.tableView didSelectRowAtIndexPath:theIndexPath];
}
- (void)valuesDidChange:(NSDictionary *)newValues
{
	NSString *newVal = [newValues objectForKey:@"newValue"];
		
	[(NSMutableArray*)self.items addObject:newVal];
	
	[(NSMutableArray*)self.items sortUsingSelector:@selector(compare:)];
	NSUInteger theIndices[] = {0, [self.items indexOfObject:newVal]};
	NSIndexPath *theIndexPath = [[NSIndexPath alloc] initWithIndexes:theIndices length:2];
	[self performSelector:@selector(selectRow:) withObject:theIndexPath];
	[self.tableView reloadData];	
}

@end

