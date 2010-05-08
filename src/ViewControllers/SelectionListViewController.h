//
//  SelectionListViewController.h
//  iContractor
//
//  Created by Jeff LaMarche on 2/18/09.
//  Copyright 2009 Jeff LaMarche Consulting. All rights reserved.
//
//  Modifications by Andy Waite

#import "ListViewController.h"
#import "TextFieldEditingViewController.h"

@protocol EditableSelectionListViewControllerDelegate <NSObject>
@required
- (void)didChooseItems:(NSArray*)selections;
@end

@interface SelectionListViewController : ListViewController <TextFieldEditingViewControllerDelegate>
{
	NSIndexPath		*lastIndexPath;
	NSMutableArray  *selectedIndexPaths;
	NSMutableArray         *selections;
	BOOL multiple;
	BOOL canAddOther;
}
@property (nonatomic, retain) NSIndexPath *lastIndexPath;
@property (nonatomic, retain) NSMutableArray *selections;
@property (nonatomic) BOOL multiple;
@property (nonatomic) BOOL canAddOther;

@end
