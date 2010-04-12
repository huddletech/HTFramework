//
//  ListSection.h
//  Catalog
//
//  Created by Andy Waite on 13/04/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ListSection : NSObject {
	NSString *title;
	NSMutableArray *items;
}

-(void)addItem:(id)item;

@property (nonatomic, retain) NSString *title;

@end
