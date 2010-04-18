//
//  RootViewController.h
//  Catalog
//
//  Created by Andy Waite on 12/04/2010.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "HTFramework.h"
#import "IndexedList.h"
#import "SelectionList.h"
#import "DatePicker.h"

@interface RootViewController : UITableViewController <SelectionListViewControllerDelegate,
                                                       LongTextFieldEditingViewControllerDelegate,
                                                       TextFieldEditingViewControllerDelegate,
                                                       EditableSelectionListViewControllerDelegate>{
	NSArray *catalogItems;
	NSArray *catalogSections;													   
}

@end
