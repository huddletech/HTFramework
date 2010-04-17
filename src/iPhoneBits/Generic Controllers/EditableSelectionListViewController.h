//
//  SelectionListViewController.h
//  iContractor
//
//  Created by Jeff LaMarche on 2/18/09.
//  Copyright 2009 Jeff LaMarche Consulting. All rights reserved.
//
//  Modifications by Andy Waite

#import <UIKit/UIKit.h>
#import "ListViewController.h"
#import "TextFieldEditingViewController.h"

@protocol EditableSelectionListViewControllerDelegate <NSObject>
@required
- (void)rowChosen:(NSInteger)row fromArray:(NSMutableArray *)theList;
@end

@interface EditableSelectionListViewController : ListViewController <TextFieldEditingViewControllerDelegate>
{
	NSIndexPath		*lastIndexPath;
	NSInteger		initialSelection;
	
	id <EditableSelectionListViewControllerDelegate>	delegate;
}
@property (nonatomic, retain) NSIndexPath *lastIndexPath;
@property NSInteger initialSelection;
@property (nonatomic, assign) id <EditableSelectionListViewControllerDelegate> delegate;
@end
