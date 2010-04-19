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

@protocol HTTableItemDescription <NSObject>
@required
- (NSString*)tableItemDescription;
@end

@interface ListViewController : AbstractGenericViewController 
{
	NSMutableArray *sections;
	NSMutableArray	*items;
	id delegate;
	BOOL indexed;
}

@property (nonatomic, retain) id delegate;
@property (nonatomic) BOOL indexed;

- (void)setItems:(NSArray*)items;
- (NSArray*)items;
- (TableSection*)addSectionWithTitle:(NSString*)title;
- (NSMutableArray*)sections;
- (void)addItem:(NSObject*)item;

@end
