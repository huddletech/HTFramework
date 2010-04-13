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
@synthesize hideCancelButton, hideSaveButton;
- (void)viewWillAppear:(BOOL)animated 
{
	if (!hideCancelButton){
		UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc]
									   initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
									   target:self
									   action:@selector(cancel)];
		self.navigationItem.leftBarButtonItem = cancelButton;
		[cancelButton release];
	}
	if (!hideSaveButton){
		UIBarButtonItem *saveButton = [[UIBarButtonItem alloc]
									   initWithBarButtonSystemItem:UIBarButtonSystemItemSave
									   target:self
									   action:@selector(save)];
		
		self.navigationItem.rightBarButtonItem = saveButton;
		[saveButton release];
	}
	[super viewWillAppear:animated];
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
