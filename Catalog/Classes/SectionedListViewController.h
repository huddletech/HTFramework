//
//  SectionedListViewController.h
//  Catalog
//
//  Created by Andy Waite on 13/04/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ListViewController.h"

@interface SectionedListViewController : ListViewController {
	NSMutableArray *sections;
}
@property (nonatomic, retain) NSMutableArray *sections;

@end
