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
@synthesize sections;


- (void)dealloc 
{
	[rowItems release];
    [super dealloc];
}

- (void)setRowItems:(NSArray*)items{
	TableSection *sectionToUpdate;
	if (self.sections == nil){
		self.sections = [NSMutableArray array];
		sectionToUpdate = [[TableSection alloc] init];
		sectionToUpdate.title = @"Untitled Section";
		[sections addObject:sectionToUpdate];
	} else {
		sectionToUpdate = [sections objectAtIndex:0];
	}
	[self setRowItems:items forSection:sectionToUpdate];
}

- (void)setRowItems:(NSArray*)items forSection:(TableSection*)section{
	NSLog(@"called setRowItems with %@ for section %@", items, section);
	section.items = items;
}

- (NSArray*)rowItems{
	return [[sections objectAtIndex:0] items];
}

#pragma mark -
#pragma mark Tableview methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
	NSLog(@"numberOfSectionsInTableView, returning %i", [sections count]);
	return [sections count];
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

@end

