//
//  RootViewController.m
//  Catalog
//
//  Created by Andy Waite on 12/04/2010.
//  Copyright HuddleTech 2010. All rights reserved.
//

#import "RootViewController.h"

@implementation RootViewController
@synthesize listVC;

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


// Override to support row selection in the table view.
- (void)didSelectItem:(NSObject*)item atIndexPath:(NSIndexPath*)indexPath{
	AbstractGenericViewController *controller = nil;
	
	NSString *selectedItemLabel = (NSString*)item;
	
	if ([selectedItemLabel isEqualToString:@"Styled Table"]){
		controller = [[SimpleList alloc] initWithStyle:UITableViewStyleGrouped];
	} else if ([selectedItemLabel isEqualToString:@"Simple List"]){
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
	
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 30200
		[self.listVC.view addSubview:[controller view]];
#else
		[self.navigationController pushViewController:controller animated:YES];
#endif
	//[controller release];
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

