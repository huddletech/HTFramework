#import "AlertView.h"


@implementation AlertView

-(void)viewDidLoad{
	[self showActivityAlert:@"Stuff happening" message:@"Please wait 3 seconds..."];
	[NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(timerFinished) userInfo:nil repeats:NO];
}

-(void)timerFinished{
	[self hideActivityAlert];
}



@end
