//
//  TableSection.h
//  Catalog
//
//  Created by Andy Waite on 14/04/2010.
//  Copyright 2010 HuddleTech. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface TableSection : NSObject {
	NSMutableArray *items;
	NSString *title;
}

- (void) addItem:(NSObject*)item;
- (void) addItems:(NSArray*)items;

@property (nonatomic, retain) NSMutableArray *items;
@property (nonatomic, retain) NSString *title;
@end
