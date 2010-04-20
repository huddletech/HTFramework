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
@synthesize topLeftButton, topRightButton;

- (void)viewWillAppear:(BOOL)animated 
{
	if (topLeftButton){
		self.navigationItem.leftBarButtonItem = topLeftButton;
	}
	if (topRightButton){
		self.navigationItem.rightBarButtonItem = topRightButton;
	}
	[super viewWillAppear:animated];
}

-(void)addAction{
	NSLog(@"addAction called");
}

-(void)doneAction{
	NSLog(@"doneAction called");
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

-(UIBarButtonItem*)saveButton{
	return [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave
														  target:self
														  action:@selector(save)] autorelease];
};
-(UIBarButtonItem*)cancelButton{
	return [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
														  target:self
														  action:@selector(cancel)] autorelease];
};
-(UIBarButtonItem*)editButton{
	return [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit
														  target:self
														  action:@selector(editAction)] autorelease];
};
-(UIBarButtonItem*)addButton{
	return [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
														  target:self
														  action:@selector(addAction)] autorelease];
};
-(UIBarButtonItem*)doneButton{
	return [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
														  target:self
														  action:@selector(doneAction)] autorelease];
};
@end
