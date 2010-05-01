//  ListViewController.h
//
//  based on
//  SelectionListViewController.h
//  iContractor
//
//  Created by Jeff LaMarche on 2/18/09.
//  Copyright 2009 Jeff LaMarche Consulting. All rights reserved.
//

#import "AbstractGenericViewController.h"
#import "TableSection.h"
#import "TableControlItem.h"

@class RootViewController;

@protocol HTTableItemDescription <NSObject>
@required
- (NSString*)tableItemDescription;
@end

@interface ListViewController : AbstractGenericViewController 
{
	NSMutableArray *sections;
	id delegate;
	BOOL indexed;
	RootViewController *rootVC;
}

@property (nonatomic, retain) id delegate;
@property (nonatomic) BOOL indexed;
@property (nonatomic, retain) IBOutlet RootViewController *rootVC;


- (void)addItems:(NSArray*)items;
- (NSArray*)items;
- (TableSection*)addSectionWithTitle:(NSString*)title;
- (NSMutableArray*)sections;
- (void)addItem:(NSObject*)item;
- (void)addItem:(NSObject*)item display:(BOOL)display;
- (void)didSelectItem:(NSObject*)item atIndexPath:(NSIndexPath*)indexPath;
- (NSString*)reuseIdentifier;
+ (NSString*)reuseIdentifier;

@end
