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
@synthesize showCancelButton, showSaveButton, showEditButton, showAddButton, showDoneButton;
- (void)viewWillAppear:(BOOL)animated 
{
	UIBarButtonItem *button = nil;
	if (showCancelButton){
		button = [[UIBarButtonItem alloc]
									   initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
									   target:self
									   action:@selector(cancel)];
		self.navigationItem.leftBarButtonItem = button;
	}
	if (showSaveButton){
		button = [[UIBarButtonItem alloc]
									   initWithBarButtonSystemItem:UIBarButtonSystemItemSave
									   target:self
									   action:@selector(save)];
		
		self.navigationItem.rightBarButtonItem = button;
	}
	if (showEditButton){
		button = [[UIBarButtonItem alloc]
									   initWithBarButtonSystemItem:UIBarButtonSystemItemEdit
									   target:self
									   action:@selector(editAction)];
		
		self.navigationItem.rightBarButtonItem = button;
	}
	if (showAddButton){
		button = [[UIBarButtonItem alloc]
									   initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
									   target:self
									   action:@selector(addAction)];
		
		self.navigationItem.rightBarButtonItem = button;
		
	}
	if (showDoneButton){
		button = [[UIBarButtonItem alloc]
				  initWithBarButtonSystemItem:UIBarButtonSystemItemDone
				  target:self
				  action:@selector(doneAction)];
		
		self.navigationItem.rightBarButtonItem = button;
		
	}
	[button release];
	[super viewWillAppear:animated];
}

-(void)addAction{
	NSLog(@"addAction called");
}

-(void)doneAction{
	NSLog(@"addAction called");
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
