//
//  LongTextFieldViewController.m
//  iContractor
//
//  Created by Jeff LaMarche on 2/10/09.
//  Copyright 2009 Jeff LaMarche Consulting. All rights reserved.
//
//  Modifications by Andy Waite

#import "LongTextFieldViewController.h"
#import "HTStyle.h"

@implementation LongTextFieldViewController
@synthesize string;
@synthesize textView;
@synthesize keyboardHeight, reloadedTable;
@synthesize delegate;


- (void)save
{
	[self.delegate takeNewString:textView.text];
	[self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -
- (void)viewDidLoad 
{
	NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
	[nc addObserver:self selector:@selector(keyboardWillShow:) name: UIKeyboardWillShowNotification object:nil];	
    self.topRightButton = [self saveButtonItem];
	[super viewDidLoad];
}


-(void) keyboardWillShow:(NSNotification *) notification
{
	if (!reloadedTable){
		keyboardHeight = [[[notification userInfo] objectForKey:UIKeyboardBoundsUserInfoKey] CGRectValue].size.height;
		CGRect frame = textView.frame;
		float newHeight = self.view.frame.size.height - 2*[self margin] - keyboardHeight;
		frame.size.height = newHeight;
		textView.frame = frame;
		[self.tableView reloadData];
		reloadedTable = YES;
	}
}

- (void)dealloc 
{
	[string release];
	[textView release];
    [super dealloc];
}

#pragma mark Tableview methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
	return 1;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    static NSString *LongTextFieldCellIdentifier = @"LongTextFieldCellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:LongTextFieldCellIdentifier];
    
	CGRect screenRect = [[UIScreen mainScreen] bounds];

	float textViewWidth = screenRect.size.width - [self margin] * 2;
	
	if (cell == nil) 
	{
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:LongTextFieldCellIdentifier] autorelease];
		UITextView *theTextView = [[UITextView alloc] initWithFrame:CGRectMake(kTextViewOffset, kTextViewOffset, textViewWidth, 0)];
		theTextView.editable = YES;
		theTextView.text = string;
		theTextView.font = [HTStyle longTextFieldFont];
		self.textView = theTextView;
		[[cell contentView] addSubview:theTextView];
		[theTextView release];
    }
	// This doesn't work - no matter where I put it. It's almost as if this property is readonly
	textView.selectedRange = NSMakeRange([string length], 0);

	[textView becomeFirstResponder];
	
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (reloadedTable){
		return self.view.frame.size.height - keyboardHeight - [self margin];
	} else {
		return 0;
	}

}

- (float) margin{
	return 20.0; // on iPad this varies depending on width (up to 45?)
}

@end
	
