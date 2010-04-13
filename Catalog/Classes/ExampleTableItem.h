//
//  ExampleTableItem.h
//  Catalog
//
//  Created by Andy Waite on 13/04/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "HTFramework.h"


@interface ExampleTableItem : NSObject <TableItemDisplay> {
	NSString *name;
}
@property (nonatomic, retain) NSString *name;

+ (id) tableItemWithName:(NSString*)name;

@end
