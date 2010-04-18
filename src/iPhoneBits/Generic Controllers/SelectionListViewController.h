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
#import "ListViewController.h"

@protocol SelectionListViewControllerDelegate <NSObject>
@required
- (void)rowChosen:(NSInteger)row fromArray:(NSArray *)theList;
@end

@interface SelectionListViewController : ListViewController 
{
	NSIndexPath		*lastIndexPath;
	NSInteger		initialSelection;	
}
@property (nonatomic, retain) NSIndexPath *lastIndexPath;
@property NSInteger initialSelection;
@end
