//
//  SelectionListViewController.h
//  iContractor
//
//  Created by Jeff LaMarche on 2/18/09.
//  Copyright 2009 Jeff LaMarche Consulting. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AbstractGenericViewController.h"

@protocol SelectionListViewControllerDelegate <NSObject>
@required
- (void)rowChosen:(NSInteger)row fromArray:(NSArray *)theList;
@end

@interface SelectionListViewController : AbstractGenericViewController 
{
	NSArray			*list;
	NSIndexPath		*lastIndexPath;
	NSInteger		initialSelection;
	
	id <SelectionListViewControllerDelegate>	delegate;
}
@property (nonatomic, retain) NSIndexPath *lastIndexPath;
@property (nonatomic, retain) NSArray *list;
@property NSInteger initialSelection;
@property (nonatomic, assign) id <SelectionListViewControllerDelegate> delegate;
@end
