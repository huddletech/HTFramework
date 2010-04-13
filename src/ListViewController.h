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

@interface ListViewController : AbstractGenericViewController 
{
	NSArray			*list;
}
@property (nonatomic, retain) NSArray *list;
@end
