//
//  RootViewController.m
//  Catalog
//
//  Created by Andy Waite on 12/04/2010.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "RootViewController.h"


@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.title = @"Catalog";
	
	catalogSections = [NSArray arrayWithObject:@"Originals from iphonebits"];
	[catalogSections retain];
	
	catalogItems = [NSArray arrayWithObjects:@"AbstractGenericViewController",
					                         @"DateViewController",
					                         @"SelectionListViewController",
					                         @"LongTextFieldViewController",
					                         @"TextFieldEditingViewController",
					                         @"EditableSelectionListViewController",
					                         @"ListViewController",
					                         @"Apple Controls",
											 @"Editable List",
					                         nil];
	[catalogItems retain];
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}
*/

/*
 // Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
 */

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release anything that can be recreated in viewDidLoad or on demand.
	// e.g. self.myOutlet = nil;
	[catalogItems release];
	[catalogSections release];
}


#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [catalogItems count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
	// Configure the cell.

	cell.textLabel.text = [catalogItems objectAtIndex:indexPath.row];
	
    return cell;
}



// Override to support row selection in the table view.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

	NSString *selectedItemLabel = [catalogItems objectAtIndex:indexPath.row];
	
	if ([selectedItemLabel isEqualToString:@"AbstractGenericViewController"]){
		AbstractGenericViewController *controller = [[AbstractGenericViewController alloc] init];
		[self.navigationController pushViewController:controller animated:YES];
		[controller release];
	} else if ([selectedItemLabel isEqualToString:@"DateViewController"]){
		DateViewController *controller = [[DateViewController alloc] init];
		controller.delegate = self;
		[self.navigationController pushViewController:controller animated:YES];
		[controller release];
	} else if ([selectedItemLabel isEqualToString:@"SelectionListViewController"]){
		SelectionListViewController *controller = [[SelectionListViewController alloc] init];
		controller.delegate = self;
		controller.rowItems = [NSArray arrayWithObjects:@"A", @"B", @"C", nil];
		controller.initialSelection = 1;
		[self.navigationController pushViewController:controller animated:YES];
		[controller release];
	} else if ([selectedItemLabel isEqualToString:@"LongTextFieldViewController"]){
		LongTextFieldViewController *controller = [[LongTextFieldViewController alloc] initWithStyle:UITableViewStyleGrouped];
		controller.delegate = self;
		controller.string = @"Pre-populated text";
		[self.navigationController pushViewController:controller animated:YES];
		[controller release];
	} else if ([selectedItemLabel isEqualToString:@"TextFieldEditingViewController"]){
		TextFieldEditingViewController *controller = [[TextFieldEditingViewController alloc] initWithStyle:UITableViewStyleGrouped];
		controller.delegate = self;
		controller.fieldNames = [NSArray arrayWithObjects:@"A", @"B", @"C", nil];
		controller.fieldKeys = [NSArray arrayWithObjects:@"a", @"b", @"c", nil];
		controller.fieldValues = [NSArray arrayWithObjects:@"1", @"2", @"3", nil];
		[self.navigationController pushViewController:controller animated:YES];
		[controller release];
	} else if ([selectedItemLabel isEqualToString:@"EditableSelectionListViewController"]){
		EditableSelectionListViewController *controller = [[EditableSelectionListViewController alloc] init];
		controller.delegate = self;
		controller.list = [NSMutableArray arrayWithObjects:@"A", @"B", @"C", nil];
		controller.initialSelection = 1;
		[self.navigationController pushViewController:controller animated:YES];
		[controller release];
	} else if ([selectedItemLabel isEqualToString:@"ListViewController"]){
		ExampleListViewController *controller = [[ExampleListViewController alloc] init];
		[self.navigationController pushViewController:controller animated:YES];
		[controller release];
	} else if ([selectedItemLabel isEqualToString:@"Apple Controls"]){
		ControlsViewController *controller = [[ControlsViewController alloc] initWithStyle:UITableViewStyleGrouped];
		[self.navigationController pushViewController:controller animated:YES];
		[controller release];
	} else if ([selectedItemLabel isEqualToString:@"Editable List"]){
		SelectionListViewController *controller = [[SelectionListViewController alloc] init];
		controller.delegate = self;
		controller.rowItems = [NSMutableArray arrayWithObjects:@"A", @"B", @"C", nil];
		controller.initialSelection = 1;
		controller.showAddButton = YES;
		[self.navigationController pushViewController:controller animated:YES];
		[controller release];
	}
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


- (void)dealloc {
    [super dealloc];
}


#pragma mark SelectionListViewControllerDelegate / EditableSelectionListViewControllerDelegate methods

- (void)rowChosen:(NSInteger)row fromArray:(NSArray *)theList;
{
    NSLog(@"You chose row %i from array %@", row, theList);
}


#pragma mark SelectionListViewControllerDelegate methods

- (void)takeNewString:(NSString *)newValue{
	NSLog(@"You selected: %@", newValue);
}


#pragma mark TextFieldEditingViewControllerDelegate methods

- (void)valuesDidChange:(NSDictionary *)newValues{
	NSLog(@"You changed values: %@", newValues);
}


#pragma mark DateViewDelegate methods

- (void)takeNewDate:(NSDate *)newDate{
	NSLog(@"You took new date: %@", newDate);
}

@end

