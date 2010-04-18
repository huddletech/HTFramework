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


- (TableSection*)addSectionWithTitle:(NSString*)title{
	TableSection *newSection = [[[TableSection alloc] init] autorelease];
	newSection.title = title;
	
	if (sections == nil){
		sections = [NSMutableArray array];
		[sections retain];
	}
	[sections addObject:newSection];
	return newSection;
}

- (void)viewWillLoad {    
	[super viewDidLoad];
}

- (void)dealloc 
{
	[items release];
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

- (void)setItems:(NSArray*)theItems{
	NSLog(@"setItems: %@", theItems);
	TableSection *sectionToUpdate = nil;
	if (sections == nil){
		sections = [NSMutableArray array];
		[sections retain];
		sectionToUpdate = [self addSectionWithTitle:@""];
	} else {
		sectionToUpdate = [sections objectAtIndex:0];
	}
	[sectionToUpdate addItems:theItems];
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
	NSLog(@"numberOfRowsInSection %i", [ts.items count]);
    return [ts.items count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
	NSLog(@"cellForRowAtIndexPath");
    static NSString *SelectionListCellIdentifier = @"ListCellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SelectionListCellIdentifier];
    if (cell == nil) 
	{
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
									   reuseIdentifier:SelectionListCellIdentifier] autorelease];
    }
    
	TableSection *ts = [sections objectAtIndex:indexPath.section];
	
	NSObject<TableItemDisplay> *itemForRow = [ts.items objectAtIndex:indexPath.row];
	
	if ([itemForRow isKindOfClass:[NSString class]])
		cell.textLabel.text = (NSString*)itemForRow;
	else {
		cell.textLabel.text = [itemForRow descriptionForTable:self];
	}
	
    return cell;
}

#pragma mark - #pragma mark Table View Data Source Methods
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath {
	TableSection *sectionToDeleteFrom = [sections objectAtIndex:indexPath.section];
	[sectionToDeleteFrom.items removeObjectAtIndex:indexPath.row];
	[tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    [delegate didDeleteRowAtIndexPath:indexPath];
}

@end

