//
//  LongTextField.m
//  Catalog
//
//  Created by Andy Waite on 18/04/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "LongTextField.h"


@implementation LongTextField

-(void)viewDidLoad{
	
	self.delegate = self;
	self.string = @"Pre-populated text";
	
	[super viewDidLoad];
}

- (void)takeNewString:(NSString *)newValue{
	NSLog(@"You entered: %@", newValue);
}

@end
