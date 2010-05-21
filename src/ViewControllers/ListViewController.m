//  ListViewController.m
//
//  based on
//  SelectionListViewController.m
//  iContractor
//
//  Created by Jeff LaMarche on 2/18/09.
//  Copyright 2009 Jeff LaMarche Consulting. All rights reserved.
//
#import "ListViewController.h"

@implementation ListViewController
@synthesize delegate, indexed;
@synthesize rootVC;

- (TableSection*)addSectionWithTitle:(NSString*)title{
	TableSection *newSection = [[[TableSection alloc] init] autorelease];
	newSection.title = title;

	[[self sections] addObject:newSection];
	return newSection;
}

- (void)viewWillLoad {    
	[super viewDidLoad];
}

- (void)dealloc 
{
    [super dealloc];
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
	
	NSMutableArray *sectionTitles = [NSMutableArray arrayWithCapacity:[sections count]];
	for (TableSection *section in sections){
		[sectionTitles addObject:section.title];
	}
	
	if (indexed)
		return sectionTitles;
	else {
		return nil;
	}

}

- (void)addItems:(NSArray*)theItems{

	for (NSObject* item in theItems){
		[self addItem:item];
	}
	
}

- (void)clearAllItems{
	sections = nil;
}

- (void)addItem:(NSObject*)item{
	[self addItem:item display:NO];
}

- (void)addItem:(NSObject*)item display:(BOOL)display{
	TableSection *sectionToAddTo = nil;
	if ([[self sections] count] == 0){
		sectionToAddTo = [self addSectionWithTitle:@""];
	} else {
		sectionToAddTo = [sections objectAtIndex:0];
	}

	[sectionToAddTo addItem:item];
	

	if (display){
[self.tableView beginUpdates];
		// seems needed because of UITableView bug
		// see http://www.feedspew.com/article/quick-table-view-weirdness-1361
		if ([self.items count] == 1){
			NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:0];
			[self.tableView insertSections:indexSet withRowAnimation:UITableViewRowAnimationFade];
		}
		
		NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[self.items count]-1 inSection:0];
		NSArray *indexPaths = [NSArray arrayWithObject:indexPath];
		[self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade]; 
																	   
	
	[self.tableView endUpdates];
		//[self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionNone animated:YES];

	}
}

- (NSMutableArray*)sections{
	if (sections == nil) {
		sections = [NSMutableArray array];
		[sections retain];
	}
	return sections;
}

- (NSArray*)items{
	return [[sections objectAtIndex:0] items];
}

#pragma mark -
#pragma mark Tableview methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
	return [sections count];
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
	TableSection *ts = [sections objectAtIndex:section];
	if (ts.title == nil)
		return @"";
	else
		return ts.title;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
	TableSection *ts = [sections objectAtIndex:section];
    return [ts.items count];
}

- (UITableViewCellStyle)tableViewCellStyle{
	return UITableViewCellStyleDefault;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[self reuseIdentifier]];
    
	NSString *customNibName = [self customNibName];
	
	if (cell == nil) 
	{
		if (customNibName){
			NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:customNibName owner:self options:nil];
			cell = [topLevelObjects objectAtIndex:0];
		} else {
			cell = [[UITableViewCell alloc] initWithStyle:[self tableViewCellStyle] reuseIdentifier:[self reuseIdentifier]];
		}
		[self prepareCell:cell];
	}
    
	TableSection *ts = [sections objectAtIndex:indexPath.section];
	NSObject *itemForRow = [ts.items objectAtIndex:indexPath.row];
	
	[self configureCell:cell withItem:itemForRow];
	
	[self configureCell:cell forItem:itemForRow];
	
    return cell;
}

// override this if you want
-(void)prepareCell:(UITableViewCell*)cell{
}

// override this if you want
-(void)configureCell:(UITableViewCell*)cell forItem:(id)item{
}


- (NSString*)customNibName{
	return nil;
}


- (void)configureCell:(UITableViewCell*)cell withItem:(NSObject*)itemForRow{
	
	if ([itemForRow respondsToSelector:@selector(tableItemDescription)]){
		cell.textLabel.text = [(id<HTTableItemDescription>)itemForRow tableItemDescription];
	} else {
		cell.textLabel.text = (NSString*)itemForRow;
	}
	
	if ([itemForRow respondsToSelector:@selector(accessoryType)]){
		cell.accessoryType = (UITableViewCellAccessoryType)[(TableControlItem*)itemForRow accessoryType];
	}
	
	if ([itemForRow respondsToSelector:@selector(control)]){
		cell.accessoryView = [(TableControlItem*)itemForRow control];
	}
	
	if ([itemForRow respondsToSelector:@selector(detail)]){
		cell.detailTextLabel.text = [(TableControlItem*)itemForRow detail];
	}
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	TableSection *selectedSection = [self.sections objectAtIndex:indexPath.section];
	NSObject *selectedItem = [selectedSection.items objectAtIndex:indexPath.row];
	[self didSelectItem:selectedItem atIndexPath:indexPath];
}

- (void)didSelectItem:(NSObject*)item atIndexPath:(NSIndexPath*)indexPath{
	NSLog(@"you selected %@ at indexPath %@ (you should override this method)", item, indexPath);
}

- (NSString*)reuseIdentifier{
	return [[self class] reuseIdentifier];
}

+ (NSString*)reuseIdentifier{
	return NSStringFromClass([self class]);
	
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    //return (interfaceOrientation == UIInterfaceOrientationPortrait);
	return YES;
}

@end

