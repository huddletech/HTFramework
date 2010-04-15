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
	NSString *title;
	UIControl *control;
}
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) UIControl *control;



- (id) initWithTitle:(NSString*)theTitle;

@end
