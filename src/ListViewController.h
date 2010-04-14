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

@protocol TableItemDisplay <NSObject>
@required
-(NSString*) descriptionForTable:(AbstractGenericViewController*)table;
@end

@interface ListViewController : AbstractGenericViewController 
{
	NSArray	*rowItems;
}
@property (nonatomic, retain) NSArray *rowItems;
@end
