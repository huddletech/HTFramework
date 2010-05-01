#import "SingleTextFieldEditing.h"


@implementation SingleTextFieldEditing

- (void)viewDidLoad {
	self.delegate = self;
	self.fieldName = @"x";
	self.fieldKey = @"y";
	self.fieldValue = @"z";
	
	[super viewDidLoad];
}


-(void) valueDidChangeTo:(NSString*)newValue{
	NSLog(@"Value entered was %@", newValue);
}

@end
