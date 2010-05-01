//
//  RootViewController.h
//  Catalog
//
//  Created by Andy Waite on 12/04/2010.
//  Copyright HuddleTech 2010. All rights reserved.
//

#import "HTFramework.h"
#import "IndexedList.h"
#import "SelectionList.h"
#import "DatePicker.h"
#import "Controls.h"
#import "AppendableSelectionList.h"
#import "TextFieldEditing.h"
#import "ListViewController.h"
#import "LongTextField.h"
#import "EditableList.h"
#import "SimpleList.h"
#import "StyledTable.h"
#import "ListWithSections.h"
#import "AlertView.h"
#import "InsertingRows.h"
#import "SingleTextFieldEditing.h"


@interface RootViewController : ListViewController <SelectionListViewControllerDelegate,
                                                       SelectionListViewControllerDelegate>{
														   ListViewController *listVC;
}

@property (nonatomic, retain) IBOutlet ListViewController *listVC;

@end
