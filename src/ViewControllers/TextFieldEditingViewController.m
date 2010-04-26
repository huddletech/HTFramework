#import "TextFieldEditingViewController.h"
@implementation TextFieldEditingViewController
@synthesize fieldNames;
@synthesize fieldKeys;
@synthesize fieldValues;
@synthesize delegate;
@synthesize changedValues;
@synthesize textFieldBeingEdited;
@synthesize shouldClearOnEditing;
@synthesize clearButtonMode;
- (id)initWithStyle:(UITableViewStyle)style
{
	if (self = [super initWithStyle:style])
	{
		for (int i =0; i < 5; i++)
			keyboardTypes[i] = UIKeyboardTypeAlphabet;
	}
	return self;
}

- (void)viewDidLoad
{	
	self.topRightButton = [self doneButtonItem];
	[super viewDidLoad];
}

-(IBAction)textFieldDone:(id)sender
{
	UITableViewCell *cell = (UITableViewCell *)[[(UIView *)sender superview] superview];
	UITableView *table = (UITableView *)[cell superview];
	NSIndexPath *textFieldIndexPath = [table indexPathForCell:cell];
	NSUInteger row = [textFieldIndexPath row];
	row++;
	if (row >= [fieldNames count])
		row = 0;
	NSUInteger newIndex[] = {0, row};
	NSIndexPath *newPath = [[NSIndexPath alloc] initWithIndexes:newIndex length:2];
	UITableViewCell *nextCell = [self.tableView cellForRowAtIndexPath:newPath];
	[newPath release];
	UITextField *nextField = nil;
	for (UIView *oneView in nextCell.contentView.subviews)
	{
		if ([oneView isMemberOfClass:[UITextField class]])
			nextField = (UITextField *)oneView;
	}
	[nextField becomeFirstResponder];
	
}
- (void)viewDidAppear:(BOOL)animated
{
	NSUInteger firstRowIndices[] = {0,0};
	NSIndexPath *firstRowPath = [NSIndexPath indexPathWithIndexes:firstRowIndices length:2];
	UITableViewCell *firstCell = [self.tableView cellForRowAtIndexPath:firstRowPath];
	UITextField *firstCellTextField = nil;
	for (UIView *oneView in firstCell.contentView.subviews)
	{
		if ([oneView isMemberOfClass:[UITextField class]])
			firstCellTextField = (UITextField *)oneView;
	}
	[firstCellTextField becomeFirstResponder];
	[super viewDidAppear:animated];
}
-(void)doneAction
{
	if (textFieldBeingEdited != nil)
		[changedValues replaceObjectAtIndex:textFieldBeingEdited.tag withObject:textFieldBeingEdited.text];

	[self.delegate valuesDidChange:[NSMutableDictionary dictionaryWithObjects:changedValues forKeys:fieldKeys]];
	[self.navigationController popViewControllerAnimated:YES];
}
-(void)setKeyboardType:(UIKeyboardType)theType forIndex:(NSUInteger)index
{
	keyboardTypes[index] = theType;
}
#pragma mark -
- (void)setFieldNames:(NSArray *)theFieldNames
{
	if ([theFieldNames count] > 5)
	{
		// The end user will never see these - no reason to localize
		NSException *e = [NSException exceptionWithName:@"Too Many Values" 
												 reason:@"If more than five values are provided, some will be inaccessible because of the keyboard view" 
											   userInfo:nil];
		[e raise];
	}
	[theFieldNames retain];
	[fieldNames release];
	fieldNames = theFieldNames;
}
- (void)setFieldValues:(NSArray *)theFieldValues
{
	[theFieldValues retain];
	[fieldValues release];
	fieldValues = theFieldValues;
	
	changedValues = [theFieldValues mutableCopy];
}
- (void)dealloc 
{
	[fieldNames release];
	[fieldKeys release];
	[fieldValues release];
	[textFieldBeingEdited release];
	[changedValues release];
    [super dealloc];
}

#pragma mark -
#pragma mark Table View Data Source Methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [fieldNames count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *textFieldCellIdentifier = @"textFieldCellIdentifier";
	
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:textFieldCellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:textFieldCellIdentifier] autorelease];
		UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 80, 25)];
		label.textAlignment = UITextAlignmentRight;
		label.tag = kDefaultLabelTag;
		UIFont *font = [UIFont boldSystemFontOfSize:12.0];
		label.textColor = [HTStyle tableCellNonEditableTextColor];
		label.font = font;
		[cell.contentView addSubview:label];
		cell.backgroundColor = [UIColor whiteColor];
		[label release];
		
		
		UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(100, 10, 190, 25)];
		textField.clearButtonMode = self.clearButtonMode;
		textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
		//textField.tag = kDefaultTextFieldTag;
		textField.clearsOnBeginEditing = shouldClearOnEditing;
		[textField setDelegate:self];
		[textField addTarget:self 
					  action:@selector(textFieldDone:) 
			forControlEvents:UIControlEventEditingDidEndOnExit];
		[cell.contentView addSubview:textField];
		[textField release];
    }
    UILabel *label = (UILabel *)[cell.contentView viewWithTag:kDefaultLabelTag];
	UITextField *textField = nil;
	for (UIView *oneView in cell.contentView.subviews)
	{
		if ([oneView isMemberOfClass:[UITextField class]])
			textField = (UITextField *)oneView;
	}
	
	label.text = [fieldNames objectAtIndex:[indexPath row]];
	textField.text = [changedValues objectAtIndex:[indexPath row]];
	textField.tag = [indexPath row];
	textField.keyboardType = keyboardTypes[[indexPath row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark -
#pragma mark Text Field Delegate Methods
#pragma mark -
#pragma mark Table Delegate Methods
- (NSIndexPath *)tableView:(UITableView *)tableView 
  willSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
	// prevents the rows from being selected.
	return nil;
}
#pragma mark -
#pragma mark Text Field Delegate Methods
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
	self.textFieldBeingEdited = textField;
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
	[changedValues replaceObjectAtIndex:textField.tag withObject:textField.text];
}

@end

