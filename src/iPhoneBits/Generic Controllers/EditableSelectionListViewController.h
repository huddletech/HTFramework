//
//  SelectionListViewController.h
//  iContractor
//
//  Created by Jeff LaMarche on 2/18/09.
//  Copyright 2009 Jeff LaMarche Consulting. All rights reserved.
//
//  Modifications by Andy Waite

#import <UIKit/UIKit.h>
#import "AbstractGenericViewController.h"
#import "TextFieldEditingViewController.h"

@protocol EditableSelectionListViewControllerDelegate <NSObject>
@required
- (void)rowChosen:(NSInteger)row fromArray:(NSMutableArray *)theList;
@end

@interface EditableSelectionListViewController : AbstractGenericViewController <TextFieldEditingViewControllerDelegate>
{
	NSMutableArray	*list;
	NSIndexPath		*lastIndexPath;
	NSInteger		initialSelection;
	
	id <EditableSelectionListViewControllerDelegate>	delegate;
}
@property (nonatomic, retain) NSIndexPath *lastIndexPath;
@property (nonatomic, retain) NSArray *list;
@property NSInteger initialSelection;
@property (nonatomic, assign) id <EditableSelectionListViewControllerDelegate> delegate;
@end
