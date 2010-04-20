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
-(IBAction)cancel;

@property (nonatomic, retain) UIBarButtonItem *topLeftButton, *topRightButton;

-(void)doneAction;

-(UIBarButtonItem*)saveButton;
-(UIBarButtonItem*)cancelButton;
-(UIBarButtonItem*)addButton;
-(UIBarButtonItem*)doneButton;

@end
