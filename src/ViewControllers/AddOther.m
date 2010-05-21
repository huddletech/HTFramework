#import "AddOther.h"


@implementation AddOther

- (void)viewDidLoad {
	self.fieldKeys = [NSArray arrayWithObject:@"newValue"];
	self.fieldNames = [NSArray arrayWithObject:NSLocalizedString(@"New Item", @"New Item")];
	self.fieldValues = [NSArray arrayWithObject:@""];
	self.topRightButton = [self saveButtonItem];
	self.topLeftButton = [self cancelButtonItem];
	self.hideLabels = YES;
	self.title = @"Other";
	[super viewDidLoad];
}


- (void)cancelAction{
	[self.navigationController dismissModalViewControllerAnimated:YES];
}

@end
