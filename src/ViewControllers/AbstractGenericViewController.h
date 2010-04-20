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
	UIBarButtonItem *topLeftButton, *topRightButton;
}
-(void)cancelAction;

@property (nonatomic, retain) UIBarButtonItem *topLeftButton, *topRightButton;

-(void)doneAction;

-(UIBarButtonItem*)saveButtonItem;
-(UIBarButtonItem*)cancelButtonItem;
-(UIBarButtonItem*)addButtonItem;
-(UIBarButtonItem*)doneButtonItem;

@end
