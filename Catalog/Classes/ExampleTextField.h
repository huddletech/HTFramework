//
//  ExampleTextField.h
//  Catalog
//
//  Created by Andy Waite on 13/04/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "HTFramework.h"


@interface ExampleTextField : NSObject <EditableTextField>{

}

-(NSString*) fieldName;
-(id) fieldKey;
-(id) fieldValue;

@end
