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
	
	TableSection *listViews = [self addSectionWithTitle:@"List Views"];
	
	NSArray *listViewItems = [NSArray arrayWithObjects:@"Simple List",
							                 @"List With Sections",
					                         @"Indexed List",
					                         @"Selection List",
					                         @"Appendable Selection List",
											 @"Text Field Editing",
											 @"Controls",
											 @"Editable List",
					                         nil];
	[listViews addItems:listViewItems];
	
	TableSection *otherKinds = [self addSectionWithTitle:@"Other Kinds"];
	NSArray *otherKindsItems = [NSArray arrayWithObjects:@"Date Picker",
								@"Long Text Field",
							  nil];
	
	[otherKinds addItems:otherKindsItems];
}

- (void)viewDidUnload {
	//[catalogItems release];
	//[catalogSections release];
}

/*

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

*/



// Override to support row selection in the table view.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

	TableSection *selectedSection = [sections objectAtIndex:indexPath.section];
	
	NSString *selectedItemLabel = [selectedSection.items objectAtIndex:indexPath.row];
	
	AbstractGenericViewController *controller = nil;
	
	if ([selectedItemLabel isEqualToString:@"Simple List"]){
		controller = [[SimpleList alloc] init];
	} else if ([selectedItemLabel isEqualToString:@"Indexed List"]){
		controller = [[IndexedList alloc] init];
	} else if ([selectedItemLabel isEqualToString:@"Date Picker"]){
		controller = [[DatePicker alloc] init];
	} else if ([selectedItemLabel isEqualToString:@"Selection List"]){
		controller = [[SelectionList alloc] init];
	} else if ([selectedItemLabel isEqualToString:@"Long Text Field"]){
		controller = [[LongTextField alloc] initWithStyle:UITableViewStyleGrouped];
	} else if ([selectedItemLabel isEqualToString:@"Text Field Editing"]){
		controller = [[TextFieldEditing alloc] initWithStyle:UITableViewStyleGrouped];
	} else if ([selectedItemLabel isEqualToString:@"Appendable Selection List"]){
		controller = [[AppendableSelectionList alloc] init];
	} else if ([selectedItemLabel isEqualToString:@"List With Sections"]){
		controller = [[ListWithSections alloc] init];
	} else if ([selectedItemLabel isEqualToString:@"Controls"]){
		controller = [[Controls alloc] initWithStyle:UITableViewStyleGrouped];
	} else if ([selectedItemLabel isEqualToString:@"Editable List"]){
		controller = [[EditableList alloc] init];
	}
	controller.title = selectedItemLabel;
	[self.navigationController pushViewController:controller animated:YES];
	[controller release];
}


- (void)dealloc {
    [super dealloc];
}


#pragma mark SelectionListViewControllerDelegate / EditableSelectionListViewControllerDelegate methods

- (void)rowChosen:(NSInteger)row fromArray:(NSArray *)theList;
{
    NSLog(@"You chose row %i from array %@", row, theList);
}
	
@end

