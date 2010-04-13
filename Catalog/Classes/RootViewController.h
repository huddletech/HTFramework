//
//  RootViewController.h
//  Catalog
//
//  Created by Andy Waite on 12/04/2010.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "AbstractGenericViewController.h"
#import "DateViewController.h"
#import "SelectionListViewController.h"
#import "LongTextFieldViewController.h";
#import "TextFieldEditingViewController.h"
#import "EditableSelectionListViewController.h"
#import "ListViewController.h"
#import "ListSection.h"

@interface RootViewController : UITableViewController <SelectionListViewControllerDelegate,
                                                       LongTextFieldEditingViewControllerDelegate,
                                                       TextFieldEditingViewControllerDelegate,
                                                       EditableSelectionListViewControllerDelegate,
                                                       DateViewDelegate>{
	NSArray *catalogItems;
	NSArray *catalogSections;													   
}

@end
