//  ListViewController.h
//
//  based on
//  SelectionListViewController.h
//  iContractor
//
//  Created by Jeff LaMarche on 2/18/09.
//  Copyright 2009 Jeff LaMarche Consulting. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AbstractGenericViewController.h"
#import "TableSection.h"

@protocol TableItemDisplay <NSObject>
@required
-(NSString*) descriptionForTable:(AbstractGenericViewController*)table;
@end

@interface ListViewController : AbstractGenericViewController 
{
	NSMutableArray *sections;
	NSArray	*rowItems;
}
@property (nonatomic, retain) NSMutableArray *sections;

- (void)setRowItems:(NSArray*)items;
- (void)setRowItems:(NSArray*)items forSection:(TableSection*)section;
- (NSArray*)rowItems;


@end
