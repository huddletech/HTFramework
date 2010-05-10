#import "SingleTextFieldEditingViewController.h"


@implementation SingleTextFieldEditingViewController
@synthesize fieldName, fieldKey, fieldValue;

- (void)viewDidLoad {
	self.fieldNames = [NSArray arrayWithObject:fieldName];
	self.fieldKeys = [NSArray arrayWithObject:@"key"];
	self.hideLabels = YES;
	
	if (fieldValue == nil){
		fieldValue = @"";
	}
	
	self.fieldValues = [NSArray arrayWithObject:fieldValue];
	[super viewDidLoad];
}

- (void)valuesDidChange:(NSDictionary *)newValues{
	[delegate valueDidChangeTo:[newValues objectForKey:@"key"]];
}

@end
