//
//  TableControlItem.h
//  Catalog
//
//  Created by Andy Waite on 15/04/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#define kViewTag				1		// for tagging our embedded controls for removal at cell recycle time


@interface TableControlItem : NSObject {
	NSString *title, *detail;
	UIControl *control;
	UITableViewCellAccessoryType accessoryType;
}
@property (nonatomic, retain) NSString *title, *detail;
@property (nonatomic, retain) UIControl *control;
@property (nonatomic) UITableViewCellAccessoryType accessoryType;



- (id) initWithTitle:(NSString*)theTitle;

@end
