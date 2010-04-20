//
//  SelectionListViewController.h
//  iContractor
//
//  Created by Jeff LaMarche on 2/18/09.
//  Copyright 2009 Jeff LaMarche Consulting. All rights reserved.
//
//  Modifications by Andy Waite

#import "AppendableSelectionListViewController.h"

@protocol SelectionListViewControllerDelegate <NSObject>
@required
- (void)rowChosen:(NSInteger)row fromArray:(NSArray *)theList;
@end

@interface SelectionListViewController : AppendableSelectionListViewController {
	BOOL            returnAfterSelection;
}

@property (nonatomic) BOOL returnAfterSelection;

@end
