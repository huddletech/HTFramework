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

-(void)cancelAction
{
	[self.navigationController popViewControllerAnimated:YES];
}
-(void)saveAction
{
	// you should override this
}

-(UIBarButtonItem*)saveButtonItem{
	return [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave
														  target:self
														  action:@selector(saveAction)] autorelease];
};
-(UIBarButtonItem*)cancelButtonItem{
	return [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
														  target:self
														  action:@selector(cancelAction)] autorelease];
};
-(UIBarButtonItem*)addButtonItem{
	return [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
														  target:self
														  action:@selector(addAction)] autorelease];
};
-(UIBarButtonItem*)doneButtonItem{
	return [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
														  target:self
														  action:@selector(doneAction)] autorelease];
};
@end
