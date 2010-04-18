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
@synthesize sections, delegate, indexed;


- (void)dealloc 
{
	[items release];
    [super dealloc];
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
	
	NSMutableArray *sectionTitles = [NSMutableArray arrayWithCapacity:[self.sections count]];
	for (TableSection *section in self.sections){
		[sectionTitles addObject:section.title];
	}
	
	if (indexed)
		return sectionTitles;
	else {
		return nil;
	}

}

- (void)setItems:(NSArray*)theItems{
	TableSection *sectionToUpdate;
	if (self.sections == nil){
		self.sections = [NSMutableArray array];
		sectionToUpdate = [[TableSection alloc] init];
		sectionToUpdate.title = @"Untitled Section";
		[sections addObject:sectionToUpdate];
	} else {
		sectionToUpdate = [sections objectAtIndex:0];
	}
	[self setItems:theItems forSection:sectionToUpdate];
}

- (void)setItems:(NSMutableArray*)theItems forSection:(TableSection*)section{
	NSLog(@"called setItems with %@ for section %@", theItems, section);
	section.items = theItems;
}

- (NSArray*)items{
	return [[sections objectAtIndex:0] items];
}

#pragma mark -
#pragma mark Tableview methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
	NSLog(@"numberOfSectionsInTableView, returning %i", [sections count]);
	return [sections count];
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
	TableSection *ts = [sections objectAtIndex:section];
	return ts.title;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
	TableSection *ts = [sections objectAtIndex:section];
    return [ts.items count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
	NSLog(@"cellForRowAtIndexPath: %i, %i:", indexPath.section, indexPath.row);
    static NSString *SelectionListCellIdentifier = @"ListCellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SelectionListCellIdentifier];
    if (cell == nil) 
	{
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
									   reuseIdentifier:SelectionListCellIdentifier] autorelease];
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
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

