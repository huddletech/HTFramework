//
//  AbstractGenericViewController.h
//  iContractor
//
//  Created by Jeff LaMarche on 2/18/09.
//  Copyright 2009 Jeff LaMarche Consulting. All rights reserved.
//
//  Modifications by Andy Waite

#import <UIKit/UIKit.h>


@interface AbstractGenericViewController : UITableViewController 
{
	BOOL showCancelButton;
	BOOL showSaveButton;
	BOOL showEditButton;
	BOOL showAddButton;
}
-(IBAction)cancel;
@property (nonatomic) BOOL showCancelButton;
@property (nonatomic) BOOL showSaveButton;
@property (nonatomic) BOOL showEditButton;
@property (nonatomic) BOOL showAddButton;

@end
