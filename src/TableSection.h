//
//  TableSection.h
//  Catalog
//
//  Created by Andy Waite on 14/04/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface TableSection : NSObject {
	NSArray *items;
	NSString *title;
}
@property (nonatomic, retain) NSArray *items;
@property (nonatomic, retain) NSString *title;
@end
