#import "SingleTextFieldEditingViewController.h"


@implementation SingleTextFieldEditingViewController
@synthesize fieldName, fieldKey, fieldValue;

- (void)viewDidLoad {
	self.fieldNames = [NSArray arrayWithObject:fieldName];
	self.fieldKeys = [NSArray arrayWithObject:fieldKey];
	self.fieldValues = [NSArray arrayWithObject:fieldValue];
	
	[super viewDidLoad];
}

- (void)valuesDidChange:(NSDictionary *)newValues{
	[delegate valueDidChangeTo:self.fieldValue];
}

@end
