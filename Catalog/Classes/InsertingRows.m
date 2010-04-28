#import "InsertingRows.h"


@implementation InsertingRows

- (void)viewDidLoad {
    [super viewDidLoad];
	self.topRightButton = [self addButtonItem];
}

- (void)addAction{
	
	NSString *s = [[NSDate date] description];
	
	[self addItem:s display:YES];
}


@end
