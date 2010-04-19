//
//  ExampleTableItem.h
//  Catalog
//
//  Created by Andy Waite on 13/04/2010.
//  Copyright 2010 HuddleTech. All rights reserved.
//

#import "HTFramework.h"


@interface ExampleTableItem : NSObject <HTTableItemDescription> {
	NSString *name;
}
@property (nonatomic, retain) NSString *name;

+ (id) tableItemWithName:(NSString*)theName;
- (NSString*) tableItemDescription;

@end
