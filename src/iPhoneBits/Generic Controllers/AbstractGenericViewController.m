//
//  AbstractGenericViewController.m
//  iContractor
//
//  Created by Jeff LaMarche on 2/18/09.
//  Copyright 2009 Jeff LaMarche Consulting. All rights reserved.
//
//  Modifications by Andy Waite

#import "AbstractGenericViewController.h"


@implementation AbstractGenericViewController
@synthesize showCancelButton, showSaveButton, showEditButton;
- (void)viewWillAppear:(BOOL)animated 
{
	if (showCancelButton){
		UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc]
									   initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
									   target:self
									   action:@selector(cancel)];
		self.navigationItem.leftBarButtonItem = cancelButton;
		[cancelButton release];
	}
	if (showSaveButton){
		UIBarButtonItem *saveButton = [[UIBarButtonItem alloc]
									   initWithBarButtonSystemItem:UIBarButtonSystemItemSave
									   target:self
									   action:@selector(save)];
		
		self.navigationItem.rightBarButtonItem = saveButton;
		[saveButton release];
	}
	if (showEditButton){
		UIBarButtonItem *editButton = [[UIBarButtonItem alloc]
									   initWithBarButtonSystemItem:UIBarButtonSystemItemEdit
									   target:self
									   action:@selector(editAction)];
		
		self.navigationItem.rightBarButtonItem = editButton;
		[editButton release];
	}
	[super viewWillAppear:animated];
}
-(void)editAction{
	// toggle mode
	
	[self.tableView setEditing:!self.tableView.editing animated:YES];
	
	if (self.tableView.editing) {
	
	UIBarButtonItem *doneButton = [[UIBarButtonItem alloc]
								   initWithBarButtonSystemItem:UIBarButtonSystemItemDone
								   target:self
								   action:@selector(editAction)];
	
	self.navigationItem.rightBarButtonItem = doneButton;
	[doneButton release];
	} else {
		UIBarButtonItem *editButton = [[UIBarButtonItem alloc]
									   initWithBarButtonSystemItem:UIBarButtonSystemItemEdit
									   target:self
									   action:@selector(editAction)];
		
		self.navigationItem.rightBarButtonItem = editButton;
		[editButton release];
	}
	
	
}
-(IBAction)cancel
{
	[self.navigationController popViewControllerAnimated:YES];
}
-(IBAction)save
{
	// you should override this
}
@end
